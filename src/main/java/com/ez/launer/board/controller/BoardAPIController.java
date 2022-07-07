package com.ez.launer.board.controller;

import com.ez.launer.board.model.BoardService;
import com.ez.launer.board.model.BoardVO;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.websocket.server.PathParam;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class BoardAPIController {
    private static final Logger logger = LoggerFactory.getLogger(BoardAPIController.class);

    private final BoardService boardService;

    @GetMapping("/board/{no}")
    public BoardVO boardDetail (@PathVariable int no) {
        logger.info("글 상세보기 api, no={}", no);

        BoardVO boardVO = boardService.selectBoardByNo(no);
        logger.info("조회 결과 boardVo={}", boardVO);

        return boardVO;
    }
}
