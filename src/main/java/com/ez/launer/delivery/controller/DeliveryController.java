package com.ez.launer.delivery.controller;

import com.ez.launer.category.model.CategoryService;
import com.ez.launer.common.MapPolygon;
import com.ez.launer.delivery.model.DeliveryDriverService;
import com.ez.launer.delivery.model.DeliveryDriverVO;
import com.ez.launer.office.model.OfficeService;
import com.ez.launer.office.model.OfficeVO;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/delivery")
@RequiredArgsConstructor
public class DeliveryController {
    private static final Logger logger = LoggerFactory.getLogger(DeliveryController.class);

    private final DeliveryDriverService deliveryDriverService;
    private final OfficeService officeService;

    @GetMapping("/")
    public String deliveryMain(HttpSession session, Model model) {
        session.setAttribute("deliveryNo", 1000);   //임시

        int deliveryNo = (int) session.getAttribute("deliveryNo");
        logger.info("배송기사 메인 페이지, 기사 no={}", deliveryNo);

        //deliveryNo로 배달기사 정보 전체 조회
        DeliveryDriverVO deliveryVO = deliveryDriverService.selectByNo(deliveryNo);
        logger.info("배달기사 정보조회 결과 deliveryVo={}", deliveryVO);

        OfficeVO officeVO = officeService.selectByNo(deliveryVO.getOfficeNo());
        logger.info("지점정보 조회 officeVO={}", officeVO);

        MapPolygon mapPolygon = new MapPolygon();
        double[][] polygon = mapPolygon.filterPolygon(officeVO.getNo());

        /*for(int i = 0; i < polygon.length; i++) {
            for(int j = 0; j < polygon[i].length) {

            }
        }*/

        String ab[][] = {
                {"서울시", "금천구"},
                {"경기도", "인천시"}
        };

        model.addAttribute("deliveryName", deliveryVO.getName());
        model.addAttribute("officeVO", officeVO);
        model.addAttribute("polygon", polygon);
        model.addAttribute("ab", ab);

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
