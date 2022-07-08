package com.ez.launer.board.controller;

import com.ez.launer.board.model.BoardDetailDownVO;
import com.ez.launer.board.model.BoardFileVO;
import com.ez.launer.board.model.BoardService;
import com.ez.launer.common.ConstUtil;
import com.ez.launer.common.FileUploadUtil;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class BoardAPIController {
    private static final Logger logger = LoggerFactory.getLogger(BoardAPIController.class);

    private final BoardService boardService;
    private final FileUploadUtil fileUploadUtil;

    @GetMapping("/board/{no}")
    public BoardDetailDownVO boardDetail (@PathVariable int no,
                                          HttpServletRequest request,
                                          HttpServletResponse response) {
        logger.info("글 상세보기 api, no={}", no);

        //쿠키 체크(view count 관련)
        int ckChk = 0;
        String tempCookieValue = "";
        Cookie[] cookies = request.getCookies();
        for(Cookie cookie : cookies) {
            if(cookie.getName().equals("board_view")) {
                ckChk++;
                tempCookieValue = cookie.getValue();
            }
        }

        Cookie cookie = null;
        int chk = 0;
        if(ckChk > 0) { //쿠키가 있으면 기존 거 덮어!!
            String[] text = tempCookieValue.split("/");
            for(String num : text)  //기존 쿠키에서 해당 게시글 번호가 있는지 확인
                if(num.equals(String.valueOf(no))) chk++;

            if(chk == 0) tempCookieValue += "/" + no;
        }else { //새로 만듬
            tempCookieValue = String.valueOf(no);
        }

        if(chk == 0) {
            cookie = new Cookie("board_view", tempCookieValue);
            cookie.setMaxAge(24*60*60); //24시간
            cookie.setPath("/");

            response.addCookie(cookie);

            int updateChk = boardService.updateBoardViewCount(no);
            logger.info("조회수 증가 결과 updateChk={}", updateChk);
        }

        BoardDetailDownVO boardDetailDownVO = boardService.selectBoardByNo(no);
        logger.info("조회 결과 boardDetailDownVO={}", boardDetailDownVO);

        return boardDetailDownVO;
    }

    @DeleteMapping("/board/{no}/{userNo}")
    @ResponseBody
    public Map<String, Object> boardDelete(@PathVariable int no, @PathVariable int userNo) {
        logger.info("글 삭제 no={}, userNo={}", no, userNo);

        Map<String, Object> resMap = new HashMap<>();
        resMap.put("no", no);
        resMap.put("userNo", userNo);

        int cnt = boardService.deleteBoard(resMap);
        logger.info("글 삭제 결과 cnt={}", cnt);

        boolean bool = false;
        String msg = "삭제 실패";
        if(cnt > 0) {
            bool = true;
            msg = "삭제 성공";
        }

        resMap.clear();
        resMap.put("SUCCESS", bool);
        resMap.put("message", msg);

        return resMap;
    }






























}
