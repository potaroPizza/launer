package com.ez.launer.admin.controller;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.launer.admin.model.AdminChartsService;
import com.ez.launer.admin.model.AdminChartsVO;
import com.ez.launer.common.ConstUtil;
import com.ez.launer.common.OrderSearchVO;
import com.ez.launer.common.PaginationInfo;
import com.ez.launer.laundryService.order.model.AdminOrderDetailVO;
import com.ez.launer.laundryService.order.model.AdminOrderListVO;
import com.ez.launer.laundryService.order.model.OrderService;
import com.ez.launer.laundryService.order.model.OrderVO;
import com.ez.launer.notice.model.NoticeService;
import com.ez.launer.notice.model.NoticeVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {
	
	private static final Logger logger
		= LoggerFactory.getLogger(AdminController.class);
	
	private final NoticeService noticeService;
	private final OrderService orderService;
	private final AdminChartsService chartsService;
	
	
	@RequestMapping("/")
	public String index(Model model) {
		logger.info("메인 페이지");
		
		List<NoticeVO> list = noticeService.selectTopTen();
		logger.info("사내공지 게시판 상위 글 10개 조회 결과, list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "/admin/index";
	}
	
	@RequestMapping("/test")
	public String test() {
		logger.info("test 페이지");
		
		return "/admin/test";
	}
	
	//주문관리 관련 핸들러
	@RequestMapping("/orders")
	public String orders(@ModelAttribute OrderSearchVO searchVo,
			Model model) {
		logger.info("주문관리 페이지, 파라미터 searchVo={}", searchVo);
		
		//초기값 설정
		if(searchVo.getCountPerPage() == 0) {	
			searchVo.setCountPerPage(10);
		}
		
		if(searchVo.getStartDay() == null || searchVo.getStartDay().isEmpty()) {
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String str = sdf.format(today);
			searchVo.setStartDay(str);
			searchVo.setEndDay(str);
			
			logger.info("현재일자 셋팅된, searchVo={}", searchVo);
		}
		
		//페이징에 필요한 변수 셋팅
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(searchVo.getCountPerPage());
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setRecordCountPerPage(searchVo.getCountPerPage());
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String, Object>> list = orderService.adminSelectOrderList(searchVo);
		logger.info("주문내역 출력 결과, list.size={}", list.size());
		
		int totalRecord = orderService.adminSelectTotalRecord(searchVo);
		logger.info("주문내역 출력 결과, totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "/admin/orders";
	}
	

	@RequestMapping("/orderDetail")
	public String orderDetail(@RequestParam(defaultValue = "0") int orderNo,
			Model model) {
		logger.info("주문상세 페이지, 파라미터 orderNo={}", orderNo);
		
		if(orderNo == 0) {
			model.addAttribute("msg", "잘못된 url 접근입니다.");
			model.addAttribute("url", "/admin/orders");
	
			return "/common/message";
		}
		
		AdminOrderDetailVO vo = orderService.adminSelectOrderDetail(orderNo);
		logger.info("주문상세 출력 결과, vo={}", vo);
		
		model.addAttribute("vo", vo);
		
		return "/admin/orderDetail";
	}
	
	@RequestMapping("/ordersUpdateMulti")
	public String ordersUpdateMulti(@ModelAttribute AdminOrderListVO vo,
			Model model) {
		logger.info("주문 다중 픽업대기 처리, 파라미터 AdminOrderListVO={}", vo);
		
		List<OrderVO> list = vo.getOrderItems();
		
		int cnt = orderService.adminOrderStatusUpdateMulti(list);
		
		String msg = "선택한 주문 처리를 실패했습니다.";
		String url = "/admin/orders";
		
		if(cnt > 0) {
			msg = "선택한 주문 처리를 성공했습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "/common/message";
	}
	
	@RequestMapping("/ordersUpdate")
	public String ordersUpdate(@RequestParam(defaultValue = "0") int orderNo,
			Model model) {
		logger.info("주문 픽업대기 처리, 파라미터 orderNo={}", orderNo);
		
		int cnt = orderService.adminOrderStatusUpdate(orderNo);
		
		String msg = "주문 처리를 실패했습니다.";
		String url = "/admin/orders";
		
		if(cnt > 0) {
			msg = "주문 처리를 성공했습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "/common/message";
	}

		
	//POI
	@RequestMapping("/excel")
	public String excel(HttpServletRequest request,
			HttpServletResponse response,
			Model model) throws IOException {
		logger.info("엑셀 다운로드 처리");
		
		List<Map<String, Object>> list = orderService.adminSelectAll();
		logger.info("size={}", list.size());
		
		BufferedOutputStream outs = null;

		Workbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet("주문 리스트");
    	//행,열
	    Row row = null;
	    Cell cell = null;
	    //헤더명
	    String[] headerKey = {"주문번호", "주문자", "담당지점", "주문상태", "날짜"};
	     
	    //테이블 헤더 스타일 적용
	    CellStyle headerStyle = CellStyleSetting(wb, "header");
	    //테이블 데이터 스타일 적용
	    CellStyle dataStyle = CellStyleSetting(wb, "data");
	      
	    row = sheet.createRow(0);
	    for(int i=0; i<headerKey.length; i++) {		//헤더 구성
	        cell = row.createCell(i);
	        cell.setCellValue(headerKey[i]);
	        cell.setCellStyle(headerStyle);
	    }
	    
	    for(int i=0; i<list.size(); i++) {	//데이터 구성
	    	row = sheet.createRow(i + 1);
	    	int cellIdx = 0;
	
	     	Map<String, Object> map = list.get(i);
	          
	        cell = row.createCell(cellIdx++);
	        cell.setCellValue(map.get("ORDERNO")+"");
	        cell.setCellStyle(dataStyle);
	        cell = row.createCell(cellIdx++);
	        cell.setCellValue(map.get("USEREMAIL")+"");
	        cell.setCellStyle(dataStyle);
	        cell = row.createCell(cellIdx++);
	        cell.setCellValue(map.get("OFFICENAME")+"");
	        cell.setCellStyle(dataStyle);
	        cell = row.createCell(cellIdx++);
	        cell.setCellValue(map.get("ORDERSTATUS")+"");
	        cell.setCellStyle(dataStyle);
	        cell = row.createCell(cellIdx++);
	        cell.setCellValue(map.get("REGDATE")+"");
	        cell.setCellStyle(dataStyle);
	      }
	      
	      //셀 넓이 자동 조정
	  	for (int i=0; i<headerKey.length; i++) {
	  		sheet.autoSizeColumn(i);
	  		sheet.setColumnWidth(i, sheet.getColumnWidth(i));
	  	}

        // 컨텐츠 타입과 파일명 지정
        response.setContentType("ms-vnd/excel");
//	        response.setHeader("Content-Disposition", "attachment;filename=example.xls");
        response.setHeader("Content-Disposition", "attachment;filename=example.xlsx");
        
       

        // Excel File Output
        try {
        	outs = new BufferedOutputStream(response.getOutputStream());
			wb.write(outs);
	        } catch(DataAccessException e) {
	           outs = null;
	        } catch(Exception e) {
	           e.printStackTrace();
	        } finally {
	           if (outs != null) {
	               outs.flush();
	               outs.close();
	           }
	        }
		
		String msg = "엑셀파일 다운로드를 성공했습니다.";
		String url = "/admin/orders";

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "/common/message";
	}
	
	//각 셀의 스타일 세팅
	public CellStyle CellStyleSetting(Workbook workbook, String kind) {
		//테이블 스타일
        CellStyle cellStyle = workbook.createCellStyle();
        
        //가는 경계선
        cellStyle.setBorderTop(BorderStyle.THIN);
        cellStyle.setBorderBottom(BorderStyle.THIN);
        cellStyle.setBorderLeft(BorderStyle.THIN);
        cellStyle.setBorderRight(BorderStyle.THIN);

        if(kind.equals("header")) {
        	//배경색 회색
        	cellStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
        	cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        }
        
        //데이터는 가운데 정렬
        cellStyle.setAlignment(HorizontalAlignment.CENTER);
        cellStyle.setVerticalAlignment(VerticalAlignment.CENTER); //중앙 정렬
        
        //폰트 설정
        Font fontOfGothic = workbook.createFont();
        fontOfGothic.setFontName("맑은 고딕");
        cellStyle.setFont(fontOfGothic);

        return cellStyle;
	}
	
	
	
	
	//통계 관련 핸들러
	@RequestMapping("/charts")
	public String charts(@ModelAttribute AdminChartsVO vo,
			Model model) {
		logger.info("통계 페이지 officeNo={}", vo.getRevenueChart());
		
		List<Map<String, Object>> vum = null;
		List<Map<String, Object>> jum = null;
		List<Map<String, Object>> uum = null;
		List<Map<String, Object>> rcm = null;
		List<Map<String, Object>> ccm = null;
		
		if(vo.getUserChart() == null) {	// 첫 화면 세팅
			vo.setUserChart("2022");
			vo.setRevenueChart("0");
			vo.setCategoryChart("1");
		}
		
		if(vo.getUserChart() != null && !vo.getUserChart().isEmpty()) {
//			if(vo.getUserChart().equals("1")) {	// 최근 2주
//				vum = chartsService.selectVisitByDay();
//				jum = chartsService.selectJoinByDay();
//				uum = chartsService.selectUsersByDay();
//			} else if(vo.getUserChart().equals("2022")) {	
				// 2022년
				vum = chartsService.selectVisitByMonth();
				jum = chartsService.selectjoinByMonth();
				uum = chartsService.selectUsersByMonth();
			}
//		}
		
		if(vo.getRevenueChart() != null && !vo.getRevenueChart().isEmpty()) {
			int officeNo = Integer.parseInt(vo.getRevenueChart());
			rcm = chartsService.selectRevenueByMonth(officeNo);
		}

		if(vo.getCategoryChart() != null && !vo.getCategoryChart().isEmpty()) {
			ccm = chartsService.selectAdminCategory();
		}
		
		logger.info("통계 페이지 vum={}", vum);
		logger.info("통계 페이지 jum={}", jum);
		logger.info("통계 페이지 uum={}", uum);
		logger.info("통계 페이지 ccm={}", ccm);
		
		model.addAttribute("vum", vum);	// 방문자 수
		model.addAttribute("jum", jum);	// 신규 가입자 수
		model.addAttribute("uum", uum);	// 누적 가입자 수
		model.addAttribute("rcm", rcm);	// 월별 매출
		if(!vo.getRevenueChart().equals("0")) {
			model.addAttribute("ofn", rcm.get(0).get("OFFICENO"));
			model.addAttribute("ofName", rcm.get(0).get("OFFICENAME"));
		} else {
			model.addAttribute("ofn", 0);
		}
		model.addAttribute("ccm", ccm);	// 카테고리 별 주문 수
		
		return "/admin/charts";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
