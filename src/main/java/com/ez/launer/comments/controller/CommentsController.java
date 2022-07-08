package com.ez.launer.comments.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ez.launer.board.model.BoardVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import com.ez.launer.comments.model.CommentsService;
import com.ez.launer.comments.model.CommentsVO;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class CommentsController {
	private static final Logger logger = LoggerFactory.getLogger(CommentsController.class);

	private final CommentsService commentsService;
	
	@GetMapping("/comments/{boardNo}")
	@ResponseBody
	public Map<String, Object> commentsView(@PathVariable int boardNo) {
		logger.info("댓글 조회 api, boardNo={}", boardNo);

		
		List<Map<String, Object>> commentsList = commentsService.selectComments(boardNo);
		logger.info("댓글 조회 결과 commentsList.size={}", commentsList.size());

		Map<String, Object> resMap = new HashMap<>();
		resMap.put("SUCCESS", true);
		resMap.put("commentsList", commentsList);
		
		return resMap;
	}
	
	/*@PostMapping("/comments/{boardNo}/{usersNo}/{content}/{groupNo}")
	public CommentsVO commentsInsert(@PathVariable int boardNo, 
    		@PathVariable int usersNo, @PathVariable int groupNo,
    		@PathVariable int step, @PathVariable String content) {
		logger.info("댓글 등록 boardNo={}, userNo={}", boardNo, usersNo);
		
		//int step = commentsService.selectStep(boardNo);
		
		CommentsVO commentsVo = new CommentsVO();
		commentsVo.setStep(step);
		commentsVo.setBoardNo(boardNo);
		commentsVo.setUsersNo(usersNo);
		commentsVo.setGroupNo(groupNo);
		commentsVo.setContent(content);
		
		int cnt = commentsService.insertComments(commentsVo);
		
		return commentsVo;
	}*/
	@PostMapping("/comments")
	@ResponseBody
	public String commentsInsert(@RequestBody CommentsVO commentsVO) {
		logger.info("댓글 등록 commentsVO={}", commentsVO);

		//int step = commentsService.selectStep(boardNo);

		/*CommentsVO commentsVo = new CommentsVO();
		commentsVo.setStep(step);
		commentsVo.setBoardNo(boardNo);
		commentsVo.setUsersNo(usersNo);
		commentsVo.setGroupNo(groupNo);
		commentsVo.setContent(content);

		int cnt = commentsService.insertComments(commentsVo);*/

		return "test";
	}
	
	@DeleteMapping("/comments/{commentsNo}")
    @ResponseBody
    public Map<String, Object> commentsDelete(@PathVariable int commentsNo) {
        logger.info("댓글 삭제 no={}", commentsNo);

        int cnt = commentsService.deleteComments(commentsNo);
        logger.info("댓글 삭제 결과 cnt={}", cnt);

        boolean bool = false;
        String msg = "삭제 실패";
        
        if(cnt > 0) {
            bool = true;
            msg = "삭제 성공";
        }
        
        Map<String, Object> resMap = new HashMap<>();

        resMap.put("SUCCESS", bool);
        resMap.put("message", msg);

        return resMap;
    }
	
	
}
