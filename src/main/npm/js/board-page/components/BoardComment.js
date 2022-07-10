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
    const [replyClassName, setReplyClassName] = useState("");

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

    const apiCommentInsert = (groupNO, isComment, step, sortNo, no) => {
        const conType = groupNO === 0 ? comment : replyComment;

        const commentsVO = {
            boardNo: detailNo,
            usersNo: userInfo.no,
            content: conType,
            groupNo: groupNO,
            step,
            sortNo
        }

        BoardService.commentsInsert(commentsVO)
            .then(response => {
                // alert(response.data);
                if (response.data) {
                    apiCommments();
                    if (isComment) {
                        setComment("");
                    } else {
                        setReplyComment("");
                        replyPart(no);
                    }
                } else {
                    window.location.reload();
                }
            });
    }

    const onChangeComment = useCallback((e) => setComment(e.target.value));
    const onChangeReplyComment = useCallback((e) => setReplyComment(e.target.value));

    const commentContents = comments.map((item, index) => {
        const replyChk = item.STEP === 1 ? "comments-component" :
            item.STEP === 2 ? "comments-component reply" : "comments-component reply-reply";

        if (item.DEL_FLAG === 'Y') {
            return (
                <div className={replyChk} key={index}>
                    <div className="out-of-step">
                        <div className="comment del">
                            <p className="content">삭제된 댓글입니다.</p>
                        </div>
                    </div>
                </div>
            )
        } else if (item.DEL_FLAG === 'N') {
            return (
                <div className={replyChk} key={index} style={item.STEP > 1 ?
                    {backgroundImage: "url(/launer/images/reply-icon.svg)"} : {}}>
                    {/*<div className="reply-line"></div>*/}
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
                            {parseInt(userInfo.no) === item.USERS_NO ?
                                (<span className="delete" onClick={() => deleteReply(item.NO)}>삭제</span>) : ""}
                        </div>
                        {reply === item.NO &&
                            <BoardCommentInput replyClassName={replyClassName} groupNo={item.GROUP_NO}
                                               userInfo={userInfo}
                                               comment={replyComment}
                                               onChangeComment={onChangeReplyComment}
                                               apiCommentInsert={apiCommentInsert}
                                               step={item.STEP}
                                               sortNo={item.SORT_NO}
                                               no={item.NO}
                            />}
                    </div>
                </div>
            )
        }
    })

    const deleteReply = useCallback((no) => {
        BoardService.commentsDeleteByCommentsNo(no)
            .then(response => {
                // alert(response.data);
                if (response.data) {
                    apiCommments();
                } else {
                    window.location.reload();
                }
            });
    });

    const replyPart = useCallback((e) => {
        if (reply === e) {
            setReplyClassName("comment-input-part reply-dropUp");
            setTimeout(() => {
                setReply(0);
            }, 210);
            clearTimeout();
        } else {
            setReplyClassName("comment-input-part reply-dropDown");
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