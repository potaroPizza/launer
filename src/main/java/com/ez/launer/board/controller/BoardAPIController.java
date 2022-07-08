package com.ez.launer.board.controller;

import com.ez.launer.board.model.BoardDetailDownVO;
import com.ez.launer.board.model.BoardFileVO;
import com.ez.launer.board.model.BoardService;
import com.ez.launer.common.ConstUtil;
import com.ez.launer.common.FileUploadUtil;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class BoardAPIController {
    private static final Logger logger = LoggerFactory.getLogger(BoardAPIController.class);

    private final BoardService boardService;
    private final FileUploadUtil fileUploadUtil;

    @GetMapping("/board/{no}")
    public BoardDetailDownVO boardDetail (@PathVariable int no) {
        logger.info("글 상세보기 api, no={}", no);

        BoardDetailDownVO boardDetailDownVO = boardService.selectBoardByNo(no);
        logger.info("조회 결과 boardDetailDownVO={}", boardDetailDownVO);

        return boardDetailDownVO;
    }

    @DeleteMapping("/board/{no}/{userNo}")
    @ResponseBody
    public Map<String, Object> boardDelete(@PathVariable int no, @PathVariable int userNo) {
        logger.info("글 삭제 no={}, userNo={}", no, userNo);

        Map<String, Object> resMap = new HashMap<>();
        resMap.put("no", no);
        resMap.put("userNo", userNo);

        int cnt = boardService.deleteBoard(resMap);
        logger.info("글 삭제 결과 cnt={}", cnt);

        boolean bool = false;
        String msg = "삭제 실패";
        if(cnt > 0) {
            bool = true;
            msg = "삭제 성공";
        }

        resMap.clear();
        resMap.put("SUCCESS", bool);
        resMap.put("message", msg);

        return resMap;
    }
}
