import React, {useCallback, useEffect, useState} from 'react';
import BoardService from "../BoardService";


const BoardDetail = ({detailNo, userInfo, contentList, deleteModalOut}) => {
    const initialData = {
        no: 0,
        usersNo: "",
        title: "제목입니다.",
        content: "",
        regdate: "",
        categoryNo: "",
        name: "",
        viewCount: 0
    }

    const [data, setData] = useState(initialData);
    const [files, setFiles] = useState([]);
    const [fileChk, setFileChk] = useState(false);

    /*const fileSet = files.map(item => (
        <div key={item.no} className="file-down" onClick={() => {fileDownload({
            no: item.no,
            boardNo: item.boardNo,
            fileName: item.fileName,
            originalFileName: item.originalFileName,
            fileSize: item.fileSize,
            downCount: item.downCount,
        })}}>
            <h3>{item.originalFileName}</h3>
            <p>{Math.round((item.fileSize/1024.0) * 10) / 10}kb &nbsp;<span><i className="fa-solid fa-download"></i> {item.downCount}</span></p>
        </div>
    ));*/
    const fileSet = files.map((item, index) => (
        /*<div key={item.no} className="file-down" onClick={() => {
            window.open(
                `http://localhost:9095/launer/board/file/download?fileName=${item.fileName}&no=${item.no}`,
                '_blank'
            );
        }}>*/
        <div key={item.no} className="file-down" onClick={() => {
            window.open(
                `http://localhost:9095/launer/board/file/download?fileName=${item.fileName}&no=${item.no}`
            );
        }}>
            <h3>{item.originalFileName}</h3>
            <p>{Math.round((item.fileSize / 1024.0) * 10) / 10}kb &nbsp;<span><i
                className="fa-solid fa-download"></i> {item.downCount}</span></p>
        </div>


        /*<form key={item.no} action="/board/file/download">
            <div key={item.no} className="file-down" onClick={() => {fileDownload(index)}}>
                <h3>{item.originalFileName}</h3>
                <p>{Math.round((item.fileSize/1024.0) * 10) / 10}kb &nbsp;<span><i className="fa-solid fa-download"></i> {item.downCount}</span></p>
            </div>
        </form>*/
    ));
    /*boardNo: 5
    downCount: 0
    fileName: "Muli-Black_20220705231856223.ttf"
    fileSize: 91724
    no: 4
    originalFileName: "Muli-Black.ttf"*/

    useEffect(() => {
        apiBoard();
    }, [detailNo]);

    const apiBoard = () => {
        BoardService.boardNoView(parseInt(detailNo))
            .then((response) => {
                console.log(response.data);
                setData(response.data.boardVO);
                if (response.data.files.length > 0) {
                    setFiles(response.data.files);
                    setFileChk(true);
                }
            })
        // .catch((e) => console.log(e))
    }


    const deleteBoard = useCallback(() => {
        BoardService.boardDeleteNo(detailNo, userInfo.no)
            .then((response) => {
                console.log(response.data);
                alert(response.data.message);
                if (response.data.SUCCESS) {
                    contentList();
                    deleteModalOut();
                } else {
                    window.location.reload();
                }
            })
        // .catch((e) => console.log(e))
    });


    /*const fileDownload = useCallback((index) => {
        const formData = new FormData();
        const data = {...files[index]}

        formData.append('key', new Blob([JSON.stringify(data)], {type: "application/json"}));
        console.log(formData);

        const xhr = new XMLHttpRequest();
        xhr.open("POST", "/launer/board/file/download");
        xhr.send(formData);
    })*/


    const dateReturn = useCallback((date) => {
        return `${date.getFullYear()}-${(date.getMonth() + 1) >= 10 ?
            (date.getMonth() + 1) : ("0" + (date.getMonth() + 1))}-${date.getDate() >= 10 ?
            date.getDate() : ("0" + date.getDate())}  ${date.getHours()}:${date.getMinutes()}`
    });

    const controllerBtn = (
        <div className="board-controll-btn">
            <button>수정</button>
            <button onClick={deleteBoard}>삭제</button>
        </div>
    );

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
                    {parseInt(userInfo.no) === data.usersNo && controllerBtn}
                </div>
                {fileChk &&
                    <div className="file-down-part">
                        {fileSet}
                    </div>
                }
            </div>
            <div className="content-wrap">
                <div dangerouslySetInnerHTML={{__html: (data.content)}}></div>
            </div>
        </div>
    );
};

export default BoardDetail;