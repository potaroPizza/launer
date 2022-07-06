import React, {useCallback, useEffect, useState} from 'react';
import BoardList from "./components/BoardList";
import BoardTitle from "./components/BoardTitle";

document.body.style.backgroundColor = "#F4F4F4";

const BoardPage = () => {
    const [userInfo, setUserInfo] = useState("");
    const [contentData, setContentData] = useState("");

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

    return (
        <div className="board-wrap">
            <BoardTitle userInfo={userInfo} boardClass={boardClass}></BoardTitle>
            <BoardList userInfo={userInfo} contentData={contentData}></BoardList>
        </div>
    );
};

export default BoardPage;