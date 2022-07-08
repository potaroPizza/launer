import React, {useCallback, useEffect, useState} from 'react';
import BoardService from "../BoardService";
import BoardCommentInput from "./BoardCommentInput";

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
    const [reply, setReply] = useState(0);
    const [replyComment, setReplyComment] = useState("");

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


    const apiCommentInsert = (groupNO, isComment) => {
        const commentsVO = {
            boardNo: detailNo,
            usersNo: userInfo.no,
            content: comment,
            groupNo: groupNO,
        }

        BoardService.commentsInsert(commentsVO)
            .then(response => {
                // alert(response.data);
                if (response.data) {
                    apiCommments();
                    if(isComment) {
                        setComment("");
                    }else {
                        setReplyComment("");
                    }
                } else {
                    window.location.reload();
                }
            });
    }

    const onChangeComment = useCallback((e) => setComment(e.target.value));
    const onChangeReplyComment = useCallback((e) => setReplyComment(e.target.value));

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
                        <span className="reply"
                              onClick={() => replyPart(item.NO)}>{reply === item.NO ? "답글 취소" : "답글 달기"}</span>
                        {parseInt(userInfo.no) === item.USERS_NO ? (<span className="delete">삭제</span>) : ""}
                    </div>
                    {reply === item.NO && <BoardCommentInput groupNo={item.NO} userInfo={userInfo} comment={replyComment}
                                                             onChangeComment={onChangeReplyComment}
                                                             apiCommentInsert={apiCommentInsert}/>}
                </div>
            </div>
        )
    })


    const replyPart = useCallback((e) => {
        if (reply === e) {
            setReply(0);
        } else {
            setReply(e);
        }
    });


    return (
        <div id="reply-component">
            <h3 className="title">댓글</h3>
            <div>
                <BoardCommentInput groupNo={0} userInfo={userInfo} comment={comment} onChangeComment={onChangeComment}
                                   apiCommentInsert={apiCommentInsert}/>
                <div className="comment-list-part">
                    {commentContents}
                </div>
            </div>
        </div>
    );
};

export default BoardComment;