package com.ez.launer.delivery.controller;

import com.ez.launer.category.model.CategoryService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/delivery")
@RequiredArgsConstructor
public class DeliveryController {
    private static final Logger logger = LoggerFactory.getLogger(DeliveryController.class);

    @GetMapping("/")
    public String deliveryMain() {
        logger.info("배송기사 메인 페이지ddd");
        return "/delivery/index";
    }

    @GetMapping("/pickup")
    public String pickupList(Model model) {
        logger.info("내 수거목록 리스트");

        Map<String, Object> info = new HashMap<>();
        info.put("name", "홍홍홍");
        info.put("title", "수거목록");

        model.addAttribute("deliveryInfo", info);

        return "/delivery/deliveryList";
    }
    @GetMapping("/return")
    public String deliveryList(Model model) {
        logger.info("내 배송목록 리스트");

        Map<String, Object> info = new HashMap<>();
        info.put("name", "홍홍홍");
        info.put("title", "배송목록");

        model.addAttribute("deliveryInfo", info);

        return "/delivery/deliveryList";
    }
}
