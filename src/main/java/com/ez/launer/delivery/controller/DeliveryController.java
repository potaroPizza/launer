package com.ez.launer.delivery.controller;

import com.ez.launer.common.ConstUtil;
import com.ez.launer.common.MapPolygon;
import com.ez.launer.common.PaginationInfo;
import com.ez.launer.delivery.model.DeliveryDriverService;
import com.ez.launer.delivery.model.DeliveryDriverVO;
import com.ez.launer.delivery.model.OrderListSearchVO;
import com.ez.launer.laundryService.order.model.OrderDeliveryAllVO;
import com.ez.launer.laundryService.order.model.OrderDeliveryVO;
import com.ez.launer.laundryService.order.model.OrderService;
import com.ez.launer.office.model.OfficeService;
import com.ez.launer.office.model.OfficeVO;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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


    @RequestMapping("/addList")
    @ResponseBody
    public String addList(@RequestParam(defaultValue = "0") int groupNo,
                          @RequestParam(defaultValue = "0") int orderNo,
                          HttpSession session) {
        int deliveryNo = (int) session.getAttribute("deliveryNo");
        logger.info("수거/배송 리스트 내 항목으로 추가, 현재 deliveryNo={}, " +
                "파라미터 groupNo={}, orderNo={}", deliveryNo, groupNo, orderNo);

        if(groupNo == 0 && orderNo == 0) return "알 수 없는 에러, 수거하기 실패";

        /*
        * 리스트에서 내 수거/배송 목록으로
        * [1] 우선 해당 Order가 상태 업데이트 상태인지 확인해야함
        * [1] order 테이블에서 PICKUP_DRIVER/DELIVERY_DRIVER, ORDER_STATUS_NO 업데이트
        * */

        OrderDeliveryVO orderDeliveryVO = new OrderDeliveryVO();
        int orderStatusNo = 0;
        String typeStatus = "";
        if(groupNo == 1) {
            orderStatusNo = ConstUtil.COMPLE_PICKUP;
            typeStatus = "PICKUP_DRIVER";
        }else if(groupNo == 2) {
            orderStatusNo = ConstUtil.DELIVERY_PROGRESS;
            typeStatus = "DELIVERY_DRIVER";
        }

        orderDeliveryVO.setNo(orderNo);
        orderDeliveryVO.setOrderStatusNo(orderStatusNo);
        orderDeliveryVO.setTypeStatus(typeStatus);
        orderDeliveryVO.setDeliveryNo(deliveryNo);

        logger.info("내 할일로 추가 전 orderDeliveryVO={}", orderDeliveryVO);

        int cnt = orderService.updateOrder(orderDeliveryVO);
        logger.info("내 할일로 추가 결과 cnt={}", cnt);
        String res = "해당 항목이 유효하지않습니다. 새로고침 후 다시 시도해주세요.";
        if(cnt > 0) res = "추가 성공";

        return res;
    }
}
