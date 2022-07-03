import React from 'react';
import BoardList from "./components/BoardList";
import BoardTitle from "./components/BoardTitle";

const BoardPage = () => {
    return (
        <div className="board-wrap">
            <BoardTitle></BoardTitle>
            <BoardList></BoardList>
        </div>
    );
};

export default BoardPage;