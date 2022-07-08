import httpCommon from "./http-common";

const boardNoView = (no) => {
    return httpCommon.get(`/board/${no}`);
}

const boardDeleteNo = (no, userNo) => {
    return httpCommon.delete(`/board/${no}/${userNo}`)
}

/*const fileDownload = (data) => {
    return httpCommon.get("/board/file/download", data);
}*/

export default {boardNoView, boardDeleteNo};