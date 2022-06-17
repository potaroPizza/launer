package com.ez.launer.delivery.controller;

import com.ez.launer.category.model.CategoryService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/delivery")
@RequiredArgsConstructor
public class DeliveryController {
    private static final Logger logger = LoggerFactory.getLogger(DeliveryController.class);

    private final CategoryService categoryService;

    @GetMapping("/")
    public String deliveryMain() {
        logger.info("배송기사 메인 페이지");
        return "/delivery/index";
    }

    @GetMapping("/pickup")
    public String pickupList(Model model) {
        logger.info("내 수거목록 리스트");

        List<Map<String, Object>> list = categoryService.selectAllCategoryGroup();

        model.addAttribute("list", list);

        return "/delivery/deliveryList";
    }
}
