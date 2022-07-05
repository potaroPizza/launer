package com.ez.launer.board.controller;

import com.ez.launer.user.model.UserService;
import com.ez.launer.user.model.UserVO;
import lombok.RequiredArgsConstructor;
import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class BoardController {
    private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

    private final UserService userService;

    @GetMapping("/user/board/notice")
    public String userNotice(Model model) {
        logger.info("사용자 공지사항");

        model.addAttribute("boardClass", 1);
        return "/board/user";
    }

    @GetMapping("/user/board/review")
    public String userReview(Model model) {
        logger.info("사용자 후기 게시판");

        model.addAttribute("boardClass", 3);
        return "/board/user";
    }

    @GetMapping("/delivery/board/notice")
    public String deliveryNotice(Model model) {
        logger.info("배송기사 공지사항");

        model.addAttribute("boardClass", 2);
        return "/board/delivery";
    }

    @GetMapping("/board/userInfo")
    @ResponseBody
    public Map<String, Object> userInfo(HttpSession session)
            throws InvocationTargetException, IllegalAccessException, NoSuchMethodException {
//        session.setAttribute("no", 1000);

        int userNo = Integer.parseInt(String.valueOf(session.getAttribute("no")));
//        int userNo = 1000;

        UserVO userVO = userService.selectById(userNo);
        Map<String, Object> map = BeanUtils.describe(userVO);   //BeanUtils.describe() => Vo 프로퍼티를 map으로 바꿔준다고함

        return map;
    }
}
