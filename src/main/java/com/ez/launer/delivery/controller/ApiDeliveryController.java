package com.ez.launer.delivery.controller;

import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/delivery")
@RequiredArgsConstructor
public class ApiDeliveryController {
    private static final Logger logger = LoggerFactory.getLogger(ApiDeliveryController.class);

    @GetMapping("/")
    public String deliveryMain() {
        logger.info("배송기사 메인 페이지");
        return "/delivery/index";
    }

    @GetMapping("/pickup")
    public String pickupList(Model model) {
        logger.info("내 수거목록 리스트");

        return "/delivery/deliveryList";
    }
    @PutMapping("/pickup/item-test")
    public String pickupListTest(@RequestParam String id) {
        logger.info("asdf={}", id);
        return id + "가 픽업됨";
    }
    @GetMapping("/pickup/items")
    public String pickupListGetTest() {
        return "[{\"no\":1,\"name\":\"상품명 1\",\"applicant\":\"홍길동 1\",\"address\":\"금천구\",\"fullAddress\":\"서울시 금천구 시흥대로213길 123\",\"lat\":37.55374049977461,\"lng\":126.9726918915864},{\"no\":2,\"name\":\"상품명 2\",\"applicant\":\"홍길동 2\",\"address\":\"금천구\",\"fullAddress\":\"서울시 금천구 시흥대로213길 123\",\"lat\":37.55966677312312,\"lng\":126.9641333408035},{\"no\":3,\"name\":\"상품명 3\",\"applicant\":\"홍길동 3\",\"address\":\"금천구\",\"fullAddress\":\"서울시 금천구 시흥대로213길 123\",\"lat\":37.54185685679763,\"lng\":126.94757630362035}]";
    }
}
