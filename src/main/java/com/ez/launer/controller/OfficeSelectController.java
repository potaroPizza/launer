package com.ez.launer.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.launer.office.model.OfficeVO;
import com.ez.launer.user.model.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class OfficeSelectController {
	private static final Logger logger 
	= LoggerFactory.getLogger(OfficeSelectController.class);
	
	private final UserService userService;

    @RequestMapping("/inc/officeModal")
    public String officeSelect(Model model) {
        logger.info("배달기사 지점선택 모달");
        
        List<OfficeVO> list= userService.selectOffice();

        model.addAttribute("list", list);

        return "/inc/officeModal";
    }

}
