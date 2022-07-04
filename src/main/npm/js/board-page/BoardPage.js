import React, {useEffect, useState} from 'react';
import BoardList from "./components/BoardList";
import BoardTitle from "./components/BoardTitle";

const BoardPage = () => {
    console.log(boardClass);
    const [userInfo, setUserInfo] = useState();

    //유저 정보 받아오기

    const ajaxUser = () => {
        $.ajax({
            url: "/launer/board/userInfo",
            type: "JSON",
            method: "GET",
            success: (res) => {
                console.log(`resMap : ${res.name}`);
                setUserInfo(res);
            },
            error: (xhr, status, error) => alert(`error : ${error}`)
        });
    }

    useEffect(() => {
        ajaxUser();
    }, []);

    return (
        <div className="board-wrap">
            <BoardTitle userInfo={userInfo} boardClass={boardClass}></BoardTitle>
            <BoardList userInfo={userInfo}></BoardList>
        </div>
    );
};

export default BoardPage;