import httpCommon from "./http-common";
import httpFileCommon from "./http-file-common";

const boardNoView = (no) => {
    return httpCommon.get(`/board/${no}`);
}

const boardDeleteNo = (no, userNo) => {
    return httpCommon.delete(`/board/${no}/${userNo}`)
}

/*const fileDownload = (data) => {
    return httpCommon.get("/board/file/download", data);
}*/

const boardUpdate = (fileChk, boardVo) => {
    return httpFileCommon.post(`/board/${fileChk}`, boardVo);
}

export default {boardNoView, boardDeleteNo, boardUpdate};