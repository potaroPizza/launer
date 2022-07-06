package com.ez.launer.board.controller;

import com.ez.launer.board.model.BoardService;
import com.ez.launer.board.model.BoardVO;
import com.ez.launer.board.model.UploadFileVO;
import com.ez.launer.common.ConstUtil;
import com.ez.launer.common.FileUploadUtil;
import com.ez.launer.common.PaginationInfo;
import com.ez.launer.user.model.UserService;
import com.ez.launer.user.model.UserVO;
import lombok.RequiredArgsConstructor;
import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class BoardController {
    private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

    private final FileUploadUtil fileUploadUtil;
    private final UserService userService;
    private final BoardService boardService;

    @GetMapping("/user/board/notice")
    public String userNotice(Model model) {
        logger.info("사용자 공지사항");

        model.addAttribute("boardClass", 1);
        model.addAttribute("categoryNo", "A01");
        return "/board/user";
    }

    @GetMapping("/user/board/review")
    public String userReview(Model model) {
        logger.info("사용자 후기 게시판");

        model.addAttribute("boardClass", 3);
        model.addAttribute("categoryNo", "B01");
        return "/board/user";
    }

    @GetMapping("/delivery/board/notice")
    public String deliveryNotice(Model model) {
        logger.info("배송기사 공지사항");

        model.addAttribute("boardClass", 2);
        model.addAttribute("categoryNo", "A02");
        return "/board/delivery";
    }

    @GetMapping("/board/userInfo")
    @ResponseBody
    public Map<String, Object> userInfo(HttpSession session)
            throws InvocationTargetException, IllegalAccessException, NoSuchMethodException {
//        session.setAttribute("no", 1000);

        int userNo = Integer.parseInt(String.valueOf(session.getAttribute("no")));
//        int userNo = 1000;

        UserVO userVO = userService.selectById(userNo);

        return (Map<String, Object>) BeanUtils.describe(userVO);    //BeanUtils.describe() => Vo 프로퍼티를 map으로 바꿔준다고함
    }



    @PostMapping("/board/tempImg")
    @ResponseBody
    public String tempImgSave(HttpServletRequest request) {
        logger.info("임시 이미지 저장 처리");

        //파일 업로드 처리
        String imageURL = "";
        try {
            List<Map<String, Object>> fileList = fileUploadUtil.fileUpload(request, ConstUtil.UPLOAD_IMAGE_FLAG);
            for(Map<String, Object> fileMap : fileList) {
                imageURL = (String)fileMap.get("fileName");
            }//for
            logger.info("파일 업로드 성공, fileName={}", imageURL);
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
        }


        return imageURL;
    }


    @PostMapping("/board/upload")
    @ResponseBody
    public Map<String, Object> uploadBoard(HttpServletRequest request, @RequestPart(value = "key") BoardVO boardVO) {
        logger.info("게시글 업로드 처리, 파라미터 boardVO={}", boardVO);
        HttpSession session = request.getSession();

        //유저의 정보 가져오기
        int no = (int)session.getAttribute("no");
        UserVO userVO = userService.selectById(no);
        logger.info("유저정보 조회 결과 userVO={}", userVO);

        //파일 업로드 처리
        String fileName = "", originFileName = "";
        long fileSize = 0;
        List<UploadFileVO> fileListVo = new ArrayList<>();

        try {
            List<Map<String, Object>> fileList = fileUploadUtil.mulitiFileUpload(request, ConstUtil.UPLOAD_FILE_FLAG);
            for(Map<String, Object> fileMap : fileList) {
                UploadFileVO uploadFileVO = new UploadFileVO();

                originFileName = (String)fileMap.get("originalFileName");
                fileName = (String)fileMap.get("fileName");
                fileSize = (long)fileMap.get("fileSize");

                uploadFileVO.setOriginalFileName(originFileName);
                uploadFileVO.setFileName(fileName);
                uploadFileVO.setFileSize(fileSize);

                fileListVo.add(uploadFileVO);
            }//for

            logger.info("파일 업로드 성공 fileListVo.size={}, originFileName={}, fileName={}, fileSize={}",
                    fileListVo.size(), originFileName, fileName, fileSize);
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
        }

        int cnt = boardService.insertUploadFileBoard(boardVO, fileListVo);
        logger.info("업로드 처리 결과 cnt={}", cnt);

        Map<String, Object> map = new HashMap<>();

        String msg = "업로드 실패";
        boolean success = false;
        if(cnt > 0) {
            msg = "업로드 완료";
            success = true;
        }

        map.put("SUCCESS", success);
        map.put("msg", msg);

        return map;
    }




    //카테고리에 맞는 게시글 조회
    @GetMapping("/board/searchList")
    @ResponseBody
    /*public Map<String, Object> boardList(@RequestParam String categoryNo)
            throws InvocationTargetException, IllegalAccessException, NoSuchMethodException {*/
    public Map<String, Object> boardList(@RequestParam Map<String, Object> paramMap)
            throws InvocationTargetException, IllegalAccessException, NoSuchMethodException {
        logger.info("게시글 조회, paramMap={}", paramMap);

        PaginationInfo pagingInfo = new PaginationInfo();
        pagingInfo.setBlockSize(5);
        pagingInfo.setRecordCountPerPage(10);
        pagingInfo.setCurrentPage(Integer.parseInt((String) paramMap.get("currentPage")));

        paramMap.put("firstRecordIndex", pagingInfo.getFirstRecordIndex());
        paramMap.put("recordCountPerPage", 10);
        logger.info("페이징 작업 후 paramMap={}", paramMap);

        List<Map<String, Object>> list = boardService.selectByCategoryNo(paramMap);
        logger.info("게시글 조회 결과, list.size={}", list.size());

        int totalRecord = boardService.countBoardList(paramMap);
        logger.info("totalRecord={}", totalRecord);

        pagingInfo.setTotalRecord(totalRecord);
        logger.info("pagingInfo={}", pagingInfo);

        Map<String, Object> resMap = new HashMap<>();

        resMap.put("jsonData", list);
        resMap.put("pagingInfo", pagingInfo);
        resMap.put("SUCCESS", true);

        return resMap;
    }

    /*public Map<String, Object> boardList(@RequestParam String categoryNo)
            throws InvocationTargetException, IllegalAccessException, NoSuchMethodException {
        logger.info("게시글 조회, categoryNo={}", categoryNo);

        List<BoardVO> list = boardService.selectByCategoryNo(categoryNo);
        logger.info("게시글 조회 결과, list.size={}", list.size());

        List<Map<String, Object>> resList = new ArrayList<>();
        for(BoardVO boardVO : list) {
//            logger.info("boardVO={}", boardVO);
            Map<String, Object> map = BeanUtils.describe(boardVO);
            resList.add(map);
        }

        Map<String, Object> resMap = new HashMap<>();
        resMap.put("jsonData", resList);
        resMap.put("SUCCESS", true);

        return resMap;
    }*/
}
