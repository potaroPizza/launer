import React from 'react';

const BoardComment = ({detailNo, userInfo}) => {
    return (
        <div id="reply-component">
            <h3 className="title">댓글</h3>
            {detailNo}
        </div>
    );
};

export default BoardComment;