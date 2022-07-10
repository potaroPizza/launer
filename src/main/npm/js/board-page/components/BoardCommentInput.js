import React, {useEffect} from 'react';

const BoardCommentInput = ({no, sortNo, step, replyClassName, onChangeComment, comment, userInfo, apiCommentInsert, groupNo}) => {
    const isComment = groupNo === 0;


    return (
        <div className={isComment ? "comment-input-part" : replyClassName}>
            <div className="left">
                <div className="comment-input">
                    <h3 className="comment-name">{userInfo.name}</h3>
                    <input type="text" value={comment} onChange={e => onChangeComment(e)} name="content"/>
                </div>
            </div>
            <div className="right">
                <button onClick={() => apiCommentInsert(groupNo, isComment, step, sortNo, no)}>등록</button>
            </div>
        </div>
    );
};

export default BoardCommentInput;