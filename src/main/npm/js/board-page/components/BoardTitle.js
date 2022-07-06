import React, {useEffect, useState} from 'react';
import BoardPaging from "./BoardPaging";

const BoardTitle = ({userInfo, boardClass, page, currentPage, currentPageEvent, contentList}) => {
    console.log("BoardTitle 컴포넌트");
    const[stateUser, setStateUser] = useState("사용자명");
    const[boardTitle, setBoardTitle] = useState("BOARD")


    useEffect(() => {
        setStateUser(userInfo.name);
        setBoardTitle(boardClass === 1 || boardClass === 2 ? "공지사항" : boardClass === 3 ? "후기" : "BOARD");
    });

    const resPageList = page.filter(item => item !== currentPage);

    return (
        <div className="board-title-component">
            <h1>{boardTitle}</h1>
            <div className="sub-part">
                <h2>접속된 사용자</h2>
                <div className="user-name">{stateUser}</div>
            </div>
            <BoardPaging contentList={contentList} currentPageEvent={currentPageEvent} page={page} currentPage={currentPage}/>
        </div>
    );
};

export default BoardTitle;