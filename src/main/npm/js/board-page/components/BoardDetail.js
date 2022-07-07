import React, {useCallback, useEffect, useState} from 'react';
import BoardService from "../BoardService";


const BoardDetail = ({detailNo}) => {
    const initialData = {
        no : 0,
        usersNo : "",
        title : "제목입니다.",
        content : "",
        regdate : "",
        categoryNo : "",
        name : "",
        viewCount: 0
    }

    const [data, setData] = useState(initialData);

    useEffect(() => {
        apiBoard();
    }, [detailNo]);

    const apiBoard = () => {
        BoardService.boardNoView(parseInt(detailNo))
            .then((response) => {
                console.log(response);
                setData(response.data);
            })
            .catch((e) => {
                console.log(e);
            });
    }


    const dateReturn = useCallback((date) => {
        return `${date.getFullYear()}-${(date.getMonth() + 1) >= 10 ? 
            (date.getMonth() + 1) : ("0" + (date.getMonth() + 1))}-${date.getDate() >= 10 ? 
            date.getDate() : ("0" + date.getDate())}  ${date.getHours()}:${date.getMinutes()}`
    });

    return (
        <div id="board-detail-wrap">
            <div className="title-line">
                <h2 className="title">{data.title}</h2>
                <div className="title-sub">
                    <div className="user-info">
                        <p id="name">{data.name}</p>
                        <span id="regdate">{dateReturn(new Date(data.regdate))}</span>
                        &nbsp;&nbsp; 조회<span id="viewCount">{data.viewCount}</span>
                    </div>
                    <div className="board-controll-btn">
                        <button>수정</button>
                        <button>삭제</button>
                    </div>
                </div>
            </div>
            <div className="content-wrap">
                <div dangerouslySetInnerHTML={{__html: (data.content)}}></div>
            </div>
        </div>
    );
};

export default BoardDetail;