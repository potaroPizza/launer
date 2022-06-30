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
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.tomcat.util.bcel.Const;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
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
    public String pickupList(HttpSession session, Model model) {
        logger.info("내 수거목록 리스트");

        int deliveryNo = (int) session.getAttribute("deliveryNo");
        logger.info("배송기사 메인 페이지, 기사 no={}", deliveryNo);

        //deliveryNo로 배달기사 정보 전체 조회
        DeliveryDriverVO deliveryVO = deliveryDriverService.selectByNo(deliveryNo);
        logger.info("배달기사 정보조회 결과 deliveryVo={}", deliveryVO);

        OfficeVO officeVO = officeService.selectByNo(deliveryVO.getOfficeNo());
        logger.info("지점정보 조회 officeVO={}", officeVO);

        // 해당 기사의 수거목록 개수
        OrderDeliveryVO orderDeliveryVO = new OrderDeliveryVO();
        orderDeliveryVO.setTypeStatus("PICKUP_DRIVER");
        orderDeliveryVO.setDeliveryNo(deliveryNo);
        orderDeliveryVO.setOrderStatusNo(ConstUtil.COMPLE_PICKUP);
        int countList = orderService.countOrderByDeliveryNo(orderDeliveryVO);

        // 해당 기사의 수거목록 가져오기
        Map<String, Object> findListMap = new HashMap<>();
        findListMap.put("officeNo", deliveryVO.getOfficeNo());
        findListMap.put("orderStatusNo", ConstUtil.COMPLE_PICKUP);
        findListMap.put("typeStatus", "PICKUP_DRIVER");
        findListMap.put("deliveryNo", deliveryVO.getNo());

        List<OrderDeliveryAllVO> list = orderService.selectByDeliveryNo(findListMap);
        logger.info("내 할일(수거목록) 조회결과 list={}", list);

        model.addAttribute("deliveryName", deliveryVO.getName());
        model.addAttribute("officeVO", officeVO);
        model.addAttribute("groupNo", 1);
        model.addAttribute("countList", countList);
        model.addAttribute("list", list);

        return "/delivery/deliveryList";
    }

    @GetMapping("/pass")
    public String deliveryList(HttpSession session, Model model) {
        logger.info("내 배송목록 리스트");

        int deliveryNo = (int) session.getAttribute("deliveryNo");
        logger.info("배송기사 메인 페이지, 기사 no={}", deliveryNo);

        //deliveryNo로 배달기사 정보 전체 조회
        DeliveryDriverVO deliveryVO = deliveryDriverService.selectByNo(deliveryNo);
        logger.info("배달기사 정보조회 결과 deliveryVo={}", deliveryVO);

        OfficeVO officeVO = officeService.selectByNo(deliveryVO.getOfficeNo());
        logger.info("지점정보 조회 officeVO={}", officeVO);

        // 해당 기사의 수거목록 개수
        OrderDeliveryVO orderDeliveryVO = new OrderDeliveryVO();
        orderDeliveryVO.setTypeStatus("DELIVERY_DRIVER");
        orderDeliveryVO.setDeliveryNo(deliveryNo);
        orderDeliveryVO.setOrderStatusNo(ConstUtil.DELIVERY_PROGRESS);
        int countList = orderService.countOrderByDeliveryNo(orderDeliveryVO);

        // 해당 기사의 수거목록 가져오기
        Map<String, Object> findListMap = new HashMap<>();
        findListMap.put("officeNo", deliveryVO.getOfficeNo());
        findListMap.put("orderStatusNo", ConstUtil.DELIVERY_PROGRESS);
        findListMap.put("typeStatus", "DELIVERY_DRIVER");
        findListMap.put("deliveryNo", deliveryVO.getNo());

        List<OrderDeliveryAllVO> list = orderService.selectByDeliveryNo(findListMap);
        logger.info("내 할일(배송목록) 조회결과 list={}", list);

        model.addAttribute("deliveryName", deliveryVO.getName());
        model.addAttribute("officeVO", officeVO);
        model.addAttribute("groupNo", 2);
        model.addAttribute("countList", countList);
        model.addAttribute("list", list);

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
        if(cnt > 0) {
            res = "추가 성공";
        }

        return res;
    }


    // 내 수거/배송 항목 두개가 하나의 핸들러를 바라보게(취소하는 것도 바라보게)
    @PostMapping("/process")
    @ResponseBody
    public String processing(@RequestParam Map<String, Object> map, HttpSession session) {
        int deliveryNo = (int) session.getAttribute("deliveryNo");
        map.put("deliveryNo", deliveryNo);

        logger.info("내 할일 프로세싱 처리, 파라미터 map={}", map);
        logger.info("접속자 : {}", deliveryNo);
        logger.info("배달기사 정보조회 결과 deliveryNo={}", deliveryNo);

        int cnt = deliveryDriverService.insertDeliveryAmount(map);
        logger.info("내 할일 프로세싱 처리 결과 cnt={}", cnt);

        String message = "실패";
        if(cnt > 0) message = "성공";

        return message;
    }

    /*//내 할일 페이지 취소 버튼 ajax
    @PostMapping("/return/process")
    @ResponseBody
    public Map<String, Object> returnProcess(@RequestParam(defaultValue = "0") int orderNo,
                                          @RequestParam(defaultValue = "0") int groupNo,
                                          HttpSession session) {
        int deliveryNo = (int) session.getAttribute("deliveryNo");
        logger.info("내 할일 프로세싱 취소, 파라미터 orderNo={}, groupNo={}", orderNo, groupNo);
        logger.info("접속자 : {}", deliveryNo);

        //deliveryNo로 배달기사 정보 전체 조회
        DeliveryDriverVO deliveryVO = deliveryDriverService.selectByNo(deliveryNo);
        logger.info("배달기사 정보조회 결과 deliveryNo={}", deliveryNo);

        Map<String, Object> map = new HashMap<>();
        map.put("orderNo", orderNo);
        map.put("groupNo", groupNo);
        map.put("result", 1);

        return map;
    }*/

    @RequestMapping("/income")
    public String deliveryIncome(HttpSession session, Model model) {
        int deliveryNo = (int) session.getAttribute("deliveryNo");
        logger.info("배송기사 - 내 수입 페이지");

        //deliveryNo로 배달기사 정보 전체 조회
        DeliveryDriverVO deliveryVO = deliveryDriverService.selectByNo(deliveryNo);
        logger.info("배달기사 정보조회 결과 deliveryVo={}", deliveryVO);

        model.addAttribute("deliveryName", deliveryVO.getName());
        return "/delivery/income";
    }


    @RequestMapping("/income/mylist")
    @ResponseBody
//    public Map<String, Object> mylist(HttpSession session) {
    public Map<String, Object> mylist(@RequestParam Map<String, Object> map, HttpSession session) {
        int deliveryNo = (int) session.getAttribute("deliveryNo");

        logger.info("배송기사 - 내 수입 / 리스트 ajax, 파라미터 paramMap={}", map);

        PaginationInfo pagingInfo = new PaginationInfo();
        pagingInfo.setBlockSize(5);
        pagingInfo.setRecordCountPerPage(4);
        pagingInfo.setCurrentPage(Integer.parseInt((String) map.get("currentPage")));

        map.put("firstRecordIndex", pagingInfo.getFirstRecordIndex());
        map.put("recordCountPerPage", 4);
        map.put("deliveryNo", deliveryNo);
        logger.info("페이징 작업 후 map={}", map);

        List<Map<String, Object>> list = deliveryDriverService.amountByDeliveryNo(map);
        logger.info("내 수입 / 리스트 조회결과 list.size={}", list.size());

        Map<String, Object> recode = deliveryDriverService.amountAllRecode(map);
        int totalRecord = Integer.parseInt(String.valueOf(recode.get("COUNT")));
        logger.info("내 수입 / 리스트 세부항목(전체개수, 총 수입) recode={}", recode);
        logger.info("totalRecord={}", totalRecord);

        pagingInfo.setTotalRecord(totalRecord);

        Map<String, Object> resList = new HashMap<>();
        resList.put("jsonList", list);
        resList.put("recode", recode);
        resList.put("pagingInfo", pagingInfo);

        /*select * from DELIVERY_AMOUNT_DETAIL_VIEW
        where DELIVERY_DRIVER_NO = #{deliveryNo}
        and ${typeList} = #{deliveryNo}
        and REGDATE between to_date(#{startDate}) and to_date(#{endDate}) + 1
        order by REGDATE <if test="desc == 1">desc</if>*/

        return resList;
    }










    @PostMapping("/income/excel/download")
    public void excelDownload(@RequestParam Map<String, Object> map,
                              HttpServletResponse response) throws IOException {
        logger.info("엑셀 다운로드, 파라미터 map={}", map);

        Workbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet("첫번째 시트");
        Row row = null;
        Cell cell = null;
        int rowNum = 0;

        // Header
        row = sheet.createRow(rowNum++);
        cell = row.createCell(0);
        cell.setCellValue("번호");
        cell = row.createCell(1);
        cell.setCellValue("이름");
        cell = row.createCell(2);
        cell.setCellValue("제목");

        // Body
        for (int i=0; i<3; i++) {
            row = sheet.createRow(rowNum++);
            cell = row.createCell(0);
            cell.setCellValue(i);
            cell = row.createCell(1);
            cell.setCellValue(i+"_name");
            cell = row.createCell(2);
            cell.setCellValue(i+"_title");
        }

        // 컨텐츠 타입과 파일명 지정
        response.setContentType("ms-vnd/excel");
//        response.setHeader("Content-Disposition", "attachment;filename=example.xls");
        response.setHeader("Content-Disposition", "attachment;filename=example.xlsx");

        // Excel File Output
        wb.write(response.getOutputStream());
        wb.close();
    }
}
