import React from 'react';

const BoardDetail = ({detailNo}) => {
    return (
        <div id="board-detail-wrap">
            <div className="title-line">
                <h2 className="title">제목입니다.</h2>
                <div className="title-sub">
                    <div className="user-info">
                        <p id="name">로켓맨</p>
                        <span id="regdate">2022. 07. 02. 03:06</span>
                        &nbsp;&nbsp; 조회<span id="viewCount">6</span>
                    </div>
                    <div className="board-controll-btn">
                        <button>수정</button>
                        <button>삭제</button>
                    </div>
                </div>
            </div>
            <div className="content-wrap">

            </div>
        </div>
    );
};

export default BoardDetail;