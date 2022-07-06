package com.ez.launer.user.controller;

import com.ez.launer.user.model.UserAddressVO;
import com.ez.launer.user.model.UserService;
import com.ez.launer.user.model.UserVO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
@RequiredArgsConstructor
@RequestMapping("/user/login/naver")
public class NaverLoginController {
    private static final Logger logger = LoggerFactory.getLogger(NaverLoginController.class);

    private final UserService userService;

    private final String CLIENT_ID = "sA1wXjzUVJ_q15yX5Z3k";
    private final String CLIENT_SECRET = "LzHF30VRtz";


    /*
    * oAuth2.0 에 접근? 하기 위한 절차는
    * [1] 인가코드 발급 (프론트단에서 받아옴)
    * [2] 인가코드를 토대로 액세스토큰을 발급(이건 백엔드)
    * [3] 액세스 토큰을 활용해 사용자 정보를 json형태로 받는다
    * 몰루
    * */

    //[2]인가코드를 바탕으로 액세스 토큰을 발급받는다.
    private String getAccessToken(String code, String state) throws JsonProcessingException {
        // HTTP Header 생성
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        // HTTP Body 생성
        MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
        body.add("grant_type", "authorization_code");
        body.add("client_id", CLIENT_ID);
        body.add("client_secret", CLIENT_SECRET);
        body.add("code", code);
        body.add("state", state);

        // HTTP 요청 보내기
        HttpEntity<MultiValueMap<String, String>> naverTokenRequest =
                new HttpEntity<>(body, headers);
        RestTemplate rt = new RestTemplate();
        ResponseEntity<String> response = rt.exchange(
                "https://nid.naver.com/oauth2.0/token",
                HttpMethod.POST,
                naverTokenRequest,
                String.class
        );

        // HTTP 응답 (JSON) -> 액세스 토큰 파싱
        String responseBody = response.getBody();
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(responseBody);
        return jsonNode.get("access_token").asText();
    }

    private JsonNode getNaverUserInfo(String accessToken) throws JsonProcessingException {
        // HTTP Header 생성
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "Bearer " + accessToken);
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        // HTTP 요청 보내기
        HttpEntity<MultiValueMap<String, String>> naverUserInfoRequest = new HttpEntity<>(headers);
        RestTemplate rt = new RestTemplate();
        ResponseEntity<String> response = rt.exchange(
                "https://openapi.naver.com/v1/nid/me",
                HttpMethod.POST,
                naverUserInfoRequest,
                String.class
        );

        // HTTP 응답 받아오기
        String responseBody = response.getBody();
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(responseBody);

        /*Long id = jsonNode.get("response").get("id").asLong();
        String nickname = jsonNode.get("response").get("nickname").asText();*/
        JsonNode jsonResponse = jsonNode.get("response");

        /*return NaverUserInfoDto.builder()
                .id(id)
                .nickname(nickname)
                .profileImage(profileImage)
                .build();*/
        return jsonResponse;
    }



    @RequestMapping("/auth")
    public String authNaver(@RequestParam String code, @RequestParam String state,
                            HttpSession session, Model model, HttpServletRequest request)
            throws JsonProcessingException {
        logger.info("code : {}", code);

        String accessToken = getAccessToken(code, state);
        logger.info("accessToken : {}", accessToken);

        JsonNode json = getNaverUserInfo(accessToken);
        logger.info("json : {}", json);

        String id = json.get("id").asText();
        String name = json.get("name").asText();
        String email = json.get("email").asText();
        String mobile = json.get("mobile").asText();
        logger.info("id={}, name={}, email={}, mobile={}", id, name, email, mobile);



        //db존재여부 check
        int count = userService.accIsExist(email);
        logger.info("count(*) = {}",count);

        UserVO userVO = new UserVO();
        String socialInfo = "";

        String url ="/user/login", msg ="로그인처리 실패";


        //현재 버그
        //계정을 email로만 찾게되서 중복된 이메일이 있을 시(해당 sns가 아닌 모든 회원가입 경로)
        //naver 회원가입 처리를 안하고 기존 계정으로 로그인하게됨
        //현재상황 예 )
        //kakao 계정이 회원가입된 상태 aa@aa.com
        //naver로 회원가입 및 로그인을 하려고함
        //naver sns관련 로직처리가 아닌 기존 db에 있는 계정(kakao)로 로그인을 처리함
        if(count > 0) { //존재하면 social_login_host 받아서 model 저장
            userVO = userService.selectByEmail(email);
//            logger.info("socialInfo={}",socialInfo);
            msg =userVO.getSocialLoginHost() + "로 로그인되었습니다";


            //리턴 페이지 관련 로직//
            //리턴 페이지 관련 로직//
            Cookie[] cookies = request.getCookies();
            int returnURLChk = 0;
            String returnURL = "";
            for(Cookie cookie : cookies) {
                if(cookie.getName().equals("tempURL")) {
                    returnURLChk++;
                    returnURL = cookie.getValue();
                    break;
                }
            }

            Cookie myCookie = new Cookie("tempURL", null);
            myCookie.setMaxAge(0);
            myCookie.setPath("/");

            if(returnURLChk > 0) {
                url = returnURL;
            }else {
                url="/";
            }
            //리턴 페이지 관련 로직//
            //리턴 페이지 관련 로직//
        }else {
            // 존재 X => 회원정보 insert
            userVO.setName(name);
            userVO.setEmail(email);
            userVO.setSocialLoginKey(id);
            userVO.setHp(mobile);
            userVO.setSocialLoginHost("NAVER");
            logger.info("미가입회원 userVO={}", userVO);

            //users insert
            int cnt = userService.insertSnsUser(userVO);

            //users_address insert
            UserVO vo= userService.selectByEmail(email);
            UserAddressVO addressvo = new UserAddressVO();
            addressvo.setUsersNo(vo.getNo());

            int addressCnt = userService.insertAddressOnlyPart(addressvo);
            logger.info("userAddress result ={}",addressCnt);

            logger.info("네이버 회원가입결과={}",cnt);
            url = "/";
            msg = name + "님, 회원가입을 축하드립니다";
        } //if


        //session 저장
        session.setAttribute("no", userVO.getNo());
        session.setAttribute("email", userVO.getEmail());
        session.setAttribute("access_Token",accessToken); //로그아웃때 필요한 accessToken


        model.addAttribute("msg",msg);
        model.addAttribute("url",url);

        return "/common/message";
    }
}