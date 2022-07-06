import React, {useCallback, useEffect, useState} from 'react';
import BoardList from "./components/BoardList";
import BoardTitle from "./components/BoardTitle";

document.body.style.backgroundColor = "#F4F4F4";

const BoardPage = () => {
    const [userInfo, setUserInfo] = useState("");   //유저 정보
    const [contentData, setContentData] = useState(""); //게시글 관련 Json객체를 넣어줌
    const [page, setPage] = useState([]);
    const [currentPage, setCurrentPage] = useState(1);
    const [pagingInfo, setPagingInfo] = useState("");
    const [searchCondition, setSearchCondition] = useState("title");
    const [searchKeyword, setSearchKeyword] = useState("");
    const blockSize = 5;

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

    useEffect(() => {
        contentList();
    }, [currentPage, searchKeyword, searchCondition]);

    const contentList = useCallback(() => {
        const data = {
            "categoryNo": categoryNo,
            "currentPage": currentPage,
            "searchCondition" : searchCondition,
            "searchKeyword" : searchKeyword
        }

        $.ajax({
           url: "/launer/board/searchList",
           method: "GET",
           data: data,
           success: (res) => {
               if(res.SUCCESS) {
                   console.log(res.jsonData);
                   setContentData(res.jsonData);
                   setPagingInfo(res.pagingInfo);
                   pagingSet(res.pagingInfo);
               }
           },
           error: (xhr, status, error) => console.log(`error : ${error}`)
        });
    });

    const currentPageEvent = useCallback((e) => {
        console.log(`받아온 e=${e}`);
        if(pagingInfo.firstPage-1 < e && e < pagingInfo.totalPage+1) setCurrentPage(e);
    });

    const pagingSet = useCallback((jSonpagingInfo) => {
        let tempPage = [];
        for(let i = jSonpagingInfo.firstPage; i < (jSonpagingInfo.firstPage + jSonpagingInfo.blockSize); i++) {
            if(i > jSonpagingInfo.lastPage) {
                tempPage.push(0);
            }else {
                tempPage.push(i);
            }
        }
        setPage(tempPage);
    });

    const searchProccess = useCallback((keyword, condition) => {
        setSearchKeyword(keyword);
        setSearchCondition(condition);
        setCurrentPage(1);
    });

    return (
        <div className="board-wrap">
            <BoardTitle userInfo={userInfo} boardClass={boardClass} page={page} currentPage={currentPage} currentPageEvent={currentPageEvent} contentList={contentList}></BoardTitle>
            <BoardList searchProccess={searchProccess} userInfo={userInfo} contentData={contentData} contentList={contentList}></BoardList>
        </div>
    );
};

export default BoardPage;