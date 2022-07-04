import React, {useCallback, useEffect, useState} from 'react';
import BoardAdd from "./BoardAdd";

const BoardList = ({userInfo}) => {
    console.log("BoardList 컴포넌트");
    const[addBtn, setAddBtn] = useState(false);
    const[boardBool, setBoardBool] = useState(false);
    const[boardList, setBoardList] = useState([
        {no: 10, content: "귀찮고 어렵다", name: "너굴맨", regdate: "2022-07-01"},
        {no: 9, content: "취업 할 수 있겠지", name: "로켓맨", regdate: "2022-07-01"},
        {no: 8, content: "나는 독서실에서 하는중", name: "나일론머스크", regdate: "2022-07-01"},
        {no: 7, content: "집에서는 집중이 안된다", name: "너굴맨", regdate: "2022-07-01"},
        {no: 6, content: "집에서하면 30분하고 1시간 쉬고 반복", name: "너굴맨", regdate: "2022-07-01"},
        {no: 5, content: "더 이상 쓸 말이 없다", name: "너굴맨", regdate: "2022-07-01"},
        {no: 4, content: "리액트로 게시판 만들기", name: "너굴맨", regdate: "2022-07-01"},
        {no: 3, content: "귀찮고 어렵다", name: "너굴맨", regdate: "2022-07-01"},
        {no: 2, content: "귀찮고 어렵다", name: "너굴맨", regdate: "2022-07-01"},
        {no: 1, content: "귀찮고 어렵다", name: "너굴맨", regdate: "2022-07-01"},
    ]);

    console.log("userInfo.userCode : " + userInfo.userCode);
    const [userClass, setUserClass] = useState(false);
    const [userCode, setUserCode] = useState();
    console.log("userCode : " + userCode);
    console.log("boardClass : " + boardClass);

    const setUserSet = () => {
        if(((boardClass === 1) && (parseInt(userCode) === 3 || parseInt(userCode) === 4))) {
            setUserClass(true);
            console.log(`userClass : ${userClass}`);
        }
    }

    useEffect(() => {
        setUserCode(userInfo.userCode);
        setUserSet();
    });

    const conList = boardList.map(item => (
        <div key={item.no} className="list-line">
            <div className="list-col-1">{item.no}</div>
            <div className="list-col-2">{item.content}</div>
            <div className="list-col-3">{item.name}</div>
            <div className="list-col-4">{item.regdate}</div>
        </div>
    ));

    const addBtnOnClickEvent = () => {
        if(addBtn) {
            setBoardBool(!boardBool);
            setTimeout(() => setAddBtn(!addBtn), 460);
        }else {
            setBoardBool(!boardBool);
            setAddBtn(!addBtn);
        }
    }

    const btnComponent = (
        <div className="add-btn">
            <button className={addBtn ? "on" : ""} onClick={addBtnOnClickEvent}><i className="fa-solid fa-plus"></i></button>
        </div>
    );


    return (
        <div className="board-list-component">
            <div className="title-wrap">
                <div className="search-part">
                    <h2>Filter</h2>
                    <form name="search">
                        <select name="search-type">
                            <option value="title">제목</option>
                            <option value="content">내용</option>
                        </select>
                        <input name="search-text" />
                        <button><i className="fa-solid fa-magnifying-glass"></i></button>
                    </form>
                </div>
                {(boardClass === 1 && (parseInt(userCode) === 1 || parseInt(userCode) === 2)) ||
                    (boardClass === 2 && (parseInt(userCode) === 1 || parseInt(userCode) === 2)) ||
                    (boardClass === 3 && (parseInt(userCode) === 3 || parseInt(userCode) === 4)) ? "" : btnComponent}
            </div>
            {addBtn && <BoardAdd animateClass={boardBool}/>}
            {/*<BoardAdd/>*/}
            <div className="list-part">
                <form>
                    <div className="list-title">
                        <div className="list-col-1">번호</div>
                        <div className="list-col-2">제목</div>
                        <div className="list-col-3">등록자</div>
                        <div className="list-col-4">등록일</div>
                    </div>
                    {conList}
                    {/*
                    <div className="list-line">
                        <div className="list-col-1">10</div>
                        <div className="list-col-2">귀찮고 어렵다</div>
                        <div className="list-col-3">너굴맨</div>
                        <div className="list-col-4">2022-07-01</div>
                    </div>
                    <div className="list-line">
                        <div className="list-col-1">9</div>
                        <div className="list-col-2">취업 할 수 있겠지</div>
                        <div className="list-col-3">로켓맨</div>
                        <div className="list-col-4">2022-07-01</div>
                    </div>
                    <div className="list-line">
                        <div className="list-col-1">8</div>
                        <div className="list-col-2">나는 독서실에서 하는중</div>
                        <div className="list-col-3">로켓맨</div>
                        <div className="list-col-4">2022-07-01</div>
                    </div>
                    <div className="list-line">
                        <div className="list-col-1">7</div>
                        <div className="list-col-2">집에서는 집중이 안된다</div>
                        <div className="list-col-3">로켓맨</div>
                        <div className="list-col-4">2022-07-01</div>
                    </div>
                    <div className="list-line">
                        <div className="list-col-1">6</div>
                        <div className="list-col-2">집에서하면 30분하고 1시간 쉬고 반복</div>
                        <div className="list-col-3">로켓맨</div>
                        <div className="list-col-4">2022-07-01</div>
                    </div>
                    <div className="list-line">
                        <div className="list-col-1">5</div>
                        <div className="list-col-2">목 아프넹</div>
                        <div className="list-col-3">너굴맨</div>
                        <div className="list-col-4">2022-07-01</div>
                    </div>
                    <div className="list-line">
                        <div className="list-col-1">4</div>
                        <div className="list-col-2">더 이상 쓸 말이 없다</div>
                        <div className="list-col-3">로켓맨</div>
                        <div className="list-col-4">2022-07-01</div>
                    </div>
                    <div className="list-line">
                        <div className="list-col-1">3</div>
                        <div className="list-col-2">아무말 대잔치</div>
                        <div className="list-col-3">로켓맨</div>
                        <div className="list-col-4">2022-07-01</div>
                    </div>
                    <div className="list-line">
                        <div className="list-col-1">2</div>
                        <div className="list-col-2">리액트로 게시판 만들기</div>
                        <div className="list-col-3">로켓맨</div>
                        <div className="list-col-4">2022-07-01</div>
                    </div>
                    <div className="list-line">
                        <div className="list-col-1">1</div>
                        <div className="list-col-2">리액트로 게시판 만들기</div>
                        <div className="list-col-3">로켓맨</div>
                        <div className="list-col-4">2022-07-01</div>
                    </div>*/}
                </form>
            </div>
        </div>
    );
};

export default BoardList;