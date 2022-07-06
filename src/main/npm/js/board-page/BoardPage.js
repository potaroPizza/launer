import React, {useCallback, useEffect, useState} from 'react';
import BoardList from "./components/BoardList";
import BoardTitle from "./components/BoardTitle";

document.body.style.backgroundColor = "#F4F4F4";

const BoardPage = () => {
    const [userInfo, setUserInfo] = useState("");   //유저 정보
    const [contentData, setContentData] = useState(""); //게시글 관련 Json객체를 넣어줌
    const [page, setPage] = useState([1, 2, 3, 4, 5]);
    const [currentPage, setCurrentPage] = useState(1);

    /*console.log(boardClass);
    console.log(categoryNo);*/

    useEffect(() => {
        //유저 정보 받아오기
        $.ajax({
            url: "/launer/board/userInfo",
            type: "JSON",
            method: "GET",
            success: (res) => {
                setUserInfo(res);
                console.log("res : " + res);
            },
            error: (xhr, status, error) => alert(`error : ${error}`)
        });

        contentList();
    }, []);

    const contentList = useCallback(() => {
        const formData = new FormData();

        const data = {
            "categoryNo": categoryNo,
            "currentPage": currentPage
        }

        $.ajax({
           url: "/launer/board/searchList",
           type: "JSON",
           method: "GET",
           data: `categoryNo=${categoryNo}`,
           success: (res) => {
               if(res.SUCCESS) {
                   console.log(res.jsonData);
                   setContentData(res.jsonData);
               }
           },
           error: (xhr, status, error) => console.log(`error : ${error}`)
        });
    });

    const currentPageEvent = (e) => {
        setCurrentPage(e);
    }

    return (
        <div className="board-wrap">
            <BoardTitle userInfo={userInfo} boardClass={boardClass} page={page} currentPage={currentPage} currentPageEvent={currentPageEvent}></BoardTitle>
            <BoardList userInfo={userInfo} contentData={contentData} contentList={contentList}></BoardList>
        </div>
    );
};

export default BoardPage;