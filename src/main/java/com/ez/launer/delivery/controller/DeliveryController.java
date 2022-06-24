package com.ez.launer.delivery.controller;

import com.ez.launer.category.model.CategoryService;
import com.ez.launer.common.ConstUtil;
import com.ez.launer.common.MapPolygon;
import com.ez.launer.common.PaginationInfo;
import com.ez.launer.common.SearchVO;
import com.ez.launer.delivery.model.DeliveryDriverService;
import com.ez.launer.delivery.model.DeliveryDriverVO;
import com.ez.launer.delivery.model.OrderListSearchVO;
import com.ez.launer.laundryService.order.model.OrderDeliveryAllVO;
import com.ez.launer.laundryService.order.model.OrderService;
import com.ez.launer.office.model.OfficeService;
import com.ez.launer.office.model.OfficeVO;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    private final OrderService orderService;

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

        /*String ab[][] = {
                {"서울시", "금천구"},
                {"경기도", "인천시"}
        };*/

        model.addAttribute("deliveryName", deliveryVO.getName());
        model.addAttribute("officeVO", officeVO);
        model.addAttribute("polygon", polygon);
        model.addAttribute("polygon", polygon);

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


    @RequestMapping("/list")
    @ResponseBody
    public Map<Object, Object> listP(@ModelAttribute OrderListSearchVO orderListSearchVO,
                                     HttpSession session) {
        logger.info("수거 요청 리스트, 파라미터 orderListSearchVO={}", orderListSearchVO);
//        orderListSearchVO.setCurrentPage(2);

        int deliveryNo = (int) session.getAttribute("deliveryNo");
//        logger.info("배송기사 메인 페이지, orderListSearchVO={}, deliveryNo={}", orderListSearchVO, deliveryNo);

        //deliveryNo로 배달기사 정보 전체 조회
        DeliveryDriverVO deliveryVO = deliveryDriverService.selectByNo(deliveryNo);
//        logger.info("배달기사 정보조회 결과 deliveryVo={}", deliveryVO);

//        OfficeVO officeVO = officeService.selectByNo(deliveryVO.getOfficeNo());
//        logger.info("지점정보 조회 officeVO={}", officeVO);

        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setBlockSize(ConstUtil.BLOCKSIZE);
        paginationInfo.setCurrentPage(orderListSearchVO.getCurrentPage());
        paginationInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);

        orderListSearchVO.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
        orderListSearchVO.setFirstRecordIndex(paginationInfo.getFirstRecordIndex());

        orderListSearchVO.setOfficeNo(deliveryVO.getOfficeNo());    //리스트 조회할 지점번호
        /*orderListSearchVO.setOrderStatusNo(1);     //수거 전 상태
        orderListSearchVO.setListType("PICKUP_DRIVER");*/

//        logger.info("중간 테스트 orderListSearchVO={}", orderListSearchVO);

        /* Map<String, Object> setMap = new HashMap<>();
        setMap.put("no", officeVO.getNo());
        setMap.put("orderStatusNo", ConstUtil.BEFORE_PICKUP);
        setMap.put("listType", "PICKUP_DRIVER");*/

        List<OrderDeliveryAllVO> listMap = orderService.orderOfficeView(orderListSearchVO);
        logger.info("검색 사이즈 listMap.size={}", listMap.size());

        int totalRecord = orderService.orderCount(orderListSearchVO);
        logger.info("총 리스트 개수 totalRecord={}", totalRecord);
        paginationInfo.setTotalRecord(totalRecord);

        Map<Object, Object> resMap = new HashMap<>();
        resMap.put("listMap", listMap);
        resMap.put("totalPage", paginationInfo.getTotalPage());
        resMap.put("dbCur", orderListSearchVO.getCurrentPage());
        resMap.put("totalRecord", totalRecord);


        logger.info("수거요청 리스트 조회 결과 listMap={}", listMap);

        /*Map<List<OrderDeliveryAllVO>, Map<String, Object>> resMap = new HashMap<>();
        resMap.put(listMap, (Map<String, Object>) new HashMap<>().put("lastPage", paginationInfo.getLastPage()));*/

        return resMap;
    }
}
