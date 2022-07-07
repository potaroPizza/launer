import httpCommon from "./http-common";

const boardNoView = (no) => {
    return httpCommon.get(`/board/${no}`);
}

export default {boardNoView};