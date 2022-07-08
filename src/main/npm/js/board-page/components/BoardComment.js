import React, { useEffect, useState } from 'react';
import BoardService from "../BoardService";

const BoardComment = ({detailNo, userInfo, dateReturn}) => {
	const initialCommentData = {
        no: null,
        boardNo: null,
        content: "",
        step: null,
        groupNo: null,
        sortNo: null,
        regdate: "",
        delFlag: "",
        usersNo: null
    }

    const [comment, setComment] = useState("");
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


    const apiCommentInsert = (groupNO) => {
        const commentsVO = {
            boardNo: detailNo,
            usersNo: userInfo.no,
            content: comment,
            groupNo: groupNO,
        }

        BoardService.commentsInsert(commentsVO)
            .then(response => {
                // alert(response.data);
                if(response.data) {
                    apiCommments();
                    setComment("");
                }else {
                    window.location.reload();
                }
            });
    }


    const commentContents = comments.map((item, index) => {
        console.log(item);

        return (
            <div className="comments-component" key={item.NO}>
                <div className="out-of-step">
                    <div className="comment-info">
                        <span className="name">{item.NAME}</span>
                    </div>
                    <div className="comment">
                        <p className="content">{item.CONTENT}</p>
                    </div>
                    <div className="comment-info-btn">
                        <span className="regdate">{dateReturn(new Date(item.REGDATE))}</span>
                        <span className="reply">답글 달기</span>
                        {parseInt(userInfo.no) === item.USERS_NO ? (<span className="delete">삭제</span>) : ""}
                    </div>
                </div>
            </div>
        )
    })
	
    return (
        <div id="reply-component">
            <h3 className="title">댓글</h3>
            <div>
                <div className="comment-input-part">
                    <div className="left">
                        <div className="comment-input">
                            <h3 className="comment-name">{userInfo.name}</h3>
                            <input type="text" value={comment} onChange={e => setComment(e.target.value)} name="content" />
                        </div>
                    </div>
                    <div className="right">
                        <button onClick={() => apiCommentInsert(0)}>등록</button>
                    </div>
                </div>
                <div className="comment-list-part">
                    {commentContents}
                </div>
            </div>
        </div>
    );
};

export default BoardComment;