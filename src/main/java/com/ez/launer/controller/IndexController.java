package com.ez.launer.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class IndexController {
    private static final Logger logger = LoggerFactory.getLogger(IndexController.class);

    @RequestMapping("/")
    public String index(Model model, HttpSession session) {
        logger.info("메인화면");

//        session.setAttribute("name", "나는나");
//        model.addAttribute("htmlTitle", "런드리고 index");

        return "/index";
    }
}
