package com.ez.launer.board.controller;

import com.ez.launer.board.model.BoardVO;
import com.ez.launer.common.ConstUtil;
import com.ez.launer.common.FileUploadUtil;
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
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class BoardController {
    private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

    private final FileUploadUtil fileUploadUtil;
    private final UserService userService;

    @GetMapping("/user/board/notice")
    public String userNotice(Model model) {
        logger.info("사용자 공지사항");

        model.addAttribute("boardClass", 1);
        return "/board/user";
    }

    @GetMapping("/user/board/review")
    public String userReview(Model model) {
        logger.info("사용자 후기 게시판");

        model.addAttribute("boardClass", 3);
        return "/board/user";
    }

    @GetMapping("/delivery/board/notice")
    public String deliveryNotice(Model model) {
        logger.info("배송기사 공지사항");

        model.addAttribute("boardClass", 2);
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
        Map<String, Object> map = BeanUtils.describe(userVO);   //BeanUtils.describe() => Vo 프로퍼티를 map으로 바꿔준다고함

        return map;
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
    public String uploadBoard(@ModelAttribute BoardVO boardVO,
                              HttpServletRequest request) {
        logger.info("게시글 업로드 처리, 파라미터 boardVO={}", boardVO);

        //파일 업로드 처리
        String fileName = "", originFileName = "";
        long fileSize = 0;
        try {
            List<Map<String, Object>> fileList = fileUploadUtil.fileUpload(request, ConstUtil.UPLOAD_FILE_FLAG);
            for(Map<String, Object> fileMap : fileList) {
                //다중 파일 업로드 처리 해야 함! (현재는 단일 파일)
                originFileName = (String)fileMap.get("originalFileName");
                fileName = (String)fileMap.get("fileName");
                fileSize = (long)fileMap.get("fileSize");
            }//for

            logger.info("파일 업로드 성공, originFileName={}, fileName={}, fileSize={}",
                    originFileName,fileName, fileSize);
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
        }

        return "";
    }

}
