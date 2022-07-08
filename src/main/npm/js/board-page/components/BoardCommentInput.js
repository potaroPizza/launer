import React from 'react';

const BoardCommentInput = ({onChangeComment, comment, userInfo, apiCommentInsert, groupNo}) => {
    const isComment = groupNo === 0;

    return (
        <div className="comment-input-part">
            <div className="left">
                <div className="comment-input">
                    <h3 className="comment-name">{userInfo.name}</h3>
                    <input type="text" value={comment} onChange={e => onChangeComment(e)} name="content" />
                </div>
            </div>
            <div className="right">
                <button onClick={() => apiCommentInsert(groupNo, isComment)}>등록</button>
            </div>
        </div>
    );
};

export default BoardCommentInput;