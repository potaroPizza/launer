import React, {useCallback, useEffect, useState} from 'react';
import BoardAdd from "./BoardAdd";
import BoardModal from "./BoardModal";
document.body.style.backgroundColor = "#F4F4F4";

const BoardList = ({userInfo, contentData, contentList, searchProccess}) => {
    console.log("BoardList 컴포넌트");
    const[addBtn, setAddBtn] = useState(false);
    const[boardBool, setBoardBool] = useState(false);
    /*const[boardList, setBoardList] = useState([
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
    ]);*/
    const [boardList, setBoardList] = useState([]);
    const [userClass, setUserClass] = useState(false);
    const [userCode, setUserCode] = useState();
    const [modalOn, setModalOn] = useState(false);
    const [detailNo, setDetailNo] = useState(0);

    /*console.log("userInfo.userCode : " + userInfo.userCode);
    console.log("userCode : " + userCode);
    console.log("boardClass : " + boardClass);*/

    useEffect(() => conDataSet(), [contentData]);  //contentData가 update될 때만 실행
    useEffect(() => setUserCode(userInfo.userCode), [userInfo]);  //userInfo가 update될 때만 실행

    useEffect(() => {
        setUserSet();
        conDataSet();
    }, [userCode]); //컴포넌트 변경될 때마다 실행

    const setUserSet = () => {
        if(((boardClass === 1) && (parseInt(userCode) === 3 || parseInt(userCode) === 4))) {
            setUserClass(true);
            console.log(`userClass : ${userClass}`);
        }
    }

    //props에서 받은 리스트 json객체를 임시 변수에 넣어주고 set해주는 함수
    const conDataSet = () => {
        const tempConDate = [...contentData];
        setBoardList(tempConDate);
    }

    const dateReturn = useCallback((date) => {
        return `${date.getFullYear()}-${(date.getMonth() + 1) >= 10 ? (date.getMonth() + 1) : ("0" + (date.getMonth() + 1))}-${date.getDate() >= 10 ? date.getDate() : ("0" + date.getDate())}`
    });

    const onDetailModal = (no) => {
        setDetailNo(no);
        setModalOn(true);
    }

    // 실제적으로 list가 되는 div 요소 셋팅
    // console.log("boardList : " +  boardList);
    const conList = boardList.map(item => {
        const date = new Date(item.REGDATE);
        return (
            <div key={item.NO} className="list-line">
                <div className="list-col-1">{item.NO}</div>
                <div className="list-col-2"><button onClick={(e) => {
                    e.preventDefault();
                    onDetailModal(item.NO);
                }}>{item.TITLE}</button></div>
                <div className="list-col-3">{item.NAME}</div>
                <div className="list-col-4">{dateReturn(date)}</div>
            </div>
        )
    });

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

    const searchSubmit = useCallback((e) => {
        e.preventDefault();

        const selectType = document.querySelector("select[name=search-type]")
            .options[document.querySelector("select[name=search-type]").selectedIndex]
            .value;
        const selectText = document.querySelector("input[name=search-text]").value;
        searchProccess(selectText, selectType);
    })

    const initialModal = useCallback(() => {
        setModalOn(false);
    });

    return (
        <div className="board-list-component">
            {modalOn && <BoardModal initialModal={initialModal} detailNo={detailNo}/>}
            <div className="title-wrap">
                <div className="search-part">
                    <h2>Filter</h2>
                    <form name="search" onSubmit={searchSubmit}>
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
            {addBtn && <BoardAdd contentList={contentList} addBtnOnClickEvent={addBtnOnClickEvent} userInfo={userInfo} animateClass={boardBool}/>}
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