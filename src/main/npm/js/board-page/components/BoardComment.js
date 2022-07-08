import React, { useEffect, useState } from 'react';
import BoardService from "../BoardService";

const BoardComment = ({detailNo, userInfo}) => {
	const initialCommentData = {
        no: null,
        boardNo: null,
        content: "",
        step: null,
        groupNo: null,
        sortNo: null,
        regdate: "",
        delFlage: "",
        usersNo: null
    }
    
    const [comment, setComment] = useState();
    const [comments, setComments] = useState([initialCommentData]);
    
    useEffect(() => {
		apiCommments();
	}, []);
	
	const apiCommments = () => {
		BoardService.commentsSelectByBoardNo(parseInt(detailNo))
			.then((response) => {
				console.log(response.data);
                setComments(response.data.commentsList);
			});
	};


    const commentContents = comments.map((item, index) => (
        <div id="comments-component" key={index}>
            <div className="out-of-step">
                <div className="comment-info">
                    <img src=""/>
                    <span className="name">{item.name}</span>|
                    <span className="regdate">{item.regdate}</span>
                    <div className="comment-info-btn">
                        <span className="reply">답글 달기</span>
                        <span className="delete">삭제</span>
                    </div>
                </div>
                <div className="comment">
                    <p className="content">{item.content}</p>
                </div>
            </div>
        </div>
    ))
	
    return (
        <div id="reply-component">
            <h3 className="title">댓글</h3>
            <div>
            	<div className="comments-controll-btn">
            		<span>댓글 등록</span>
		            <button>등록</button>
		        </div>

            	<div className="input">
            		<input type="text" value={comment} onChange={e => setComment(e.target.value)} name="content" />
            	</div>

                {commentContents}
            	{/*<div id="comments-component">
            		<div className="out-of-step">
	            		<div className="comment-info">
	            			<img src=""/>
	            			<span className="name">정지효</span>|
	            			<span className="regdate">2022-07-08 15:29</span>
	            			<div className="comment-info-btn">
		            			<span className="reply">답글 달기</span>
		            			<span className="delete">삭제</span>
	            			</div>
	            		</div>
	            		<div className="comment">
	            			<p className="content">원글</p>
	            		</div>
            		</div>
            	</div>
            	
            	<div id="comments-component">
            		<span className="step"></span>
            		<div className="out-of-step">
	            		<div className="comment-info">
	            			<img src=""/>
	            			<span className="name">정지효</span>|
	            			<span className="regdate">2022-07-08 15:29</span>
	            			<div className="comment-info-btn">
		            			<span className="reply">답글 달기</span>
		            			<span className="delete">삭제</span>
	            			</div>
	            		</div>
	            		<div className="comment">
	            			<p className="content">답글</p>
	            		</div>
            		</div>
            	</div>*/}
            </div>
        </div>
    );
};

export default BoardComment;