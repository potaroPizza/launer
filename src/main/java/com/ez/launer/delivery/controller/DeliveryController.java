package com.ez.launer.delivery.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/delivery")
public class DeliveryController {
    private static final Logger logger = LoggerFactory.getLogger(DeliveryController.class);

    @GetMapping("/")
    public String deliveryMain() {
        logger.info("배송기사 메인 페이지");
        return "/delivery/index";
    }

    @GetMapping("/pickup")
    public String pickupList() {
        logger.info("내 수거목록 리스트");
        return "/delivery/deliveryList";
    }
}
