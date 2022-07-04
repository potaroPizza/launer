import React, {useState} from 'react';

const BoardTitle = () => {
    const[stateUser, setStateUser] = useState("사용자명");
    const[boardTitle, setBoardTitle] = useState("BOARD")
    const[currentPage, setCurrentPage] = useState(1);
    const[pageList, setPageList] = useState([1, 2, 3, 4, 5, 6, 7, 8, 9]);

    const resPageList = pageList.filter(item => item !== currentPage);
    console.log(resPageList);

    return (
        <div className="board-title-component">
            <h1>{boardTitle}</h1>
            <div className="sub-part">
                <h2>접속된 사용자</h2>
                <div className="user-name">{stateUser}</div>
            </div>
            <div className="paging-part">
                <div className="paging-num">
                    <span>{currentPage}</span>
                </div>
                <div className="paging-list">
                    <div className="paging-btn">
                        <button><i className="fa-solid fa-caret-left"></i></button>
                        <button><i className="fa-solid fa-caret-right"></i></button>
                    </div>
                    <div className="page-list">

                    </div>
                </div>
            </div>
        </div>
    );
};

export default BoardTitle;