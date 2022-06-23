package com.ez.launer.delivery.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/delivery")
public class DeliveryJoinController {
    private static final Logger logger = LoggerFactory.getLogger(DeliveryJoinController.class);

    @GetMapping("/join")
    public String register(Model model) {
        logger.info("회원가입 화면");

        model.addAttribute("classNo", 2);
        return "/user/join";
    }

}
