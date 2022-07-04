import React, {useEffect, useState} from 'react';
import BoardList from "./components/BoardList";
import BoardTitle from "./components/BoardTitle";

document.body.style.backgroundColor = "#F4F4F4";

const BoardPage = () => {
    console.log(boardClass);
    const [userInfo, setUserInfo] = useState("");

    useEffect(() => {
        //유저 정보 받아오기
        $.ajax({
            url: "/launer/board/userInfo",
            type: "JSON",
            method: "GET",
            success: (res) => {
                // console.log(`resMap : ${res.name}`);
                setUserInfo(res);
                console.log("userInfo : " + userInfo);
            },
            error: (xhr, status, error) => alert(`error : ${error}`)
        });
    }, []);

    return (
        <div className="board-wrap">
            <BoardTitle userInfo={userInfo} boardClass={boardClass}></BoardTitle>
            <BoardList userInfo={userInfo}></BoardList>
        </div>
    );
};

export default BoardPage;