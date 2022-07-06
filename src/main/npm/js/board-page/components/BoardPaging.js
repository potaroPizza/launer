import React, {useCallback} from 'react';

const BoardPaging = ({page, currentPage, currentPageEvent}) => {
    const pageClickEvent = (e) => {
        console.log(`버튼 클릭 : ${e}`);
        currentPageEvent(e);
    }

    const pageBtnSet = page.map((item, index) => {
        if(item === currentPage) {
            return (
                <button key={index} className="on">{item}</button>
            )
        }else if(item === 0) {
            return (
                <span key={index} className="on">{item}</span>
            )
        }

        return (
            <button key={index} onClick={() => pageClickEvent(item)}>
                {item}
            </button>
        )
    });

    const onClickPageBtn = useCallback((e) => {
        currentPageEvent(currentPage+(e));
    });

    return (
        <div className="paging-part">
            <div className="paging-num">
                <span>{currentPage}</span>
            </div>
            <div className="paging-list">
                <div className="paging-btn">
                    <button onClick={() => onClickPageBtn(-1)}><i className="fa-solid fa-caret-left"></i></button>
                    <button onClick={() => onClickPageBtn(1)}><i className="fa-solid fa-caret-right"></i></button>
                </div>
                <div className="page-list">
                    {pageBtnSet}
                </div>
            </div>
        </div>
    );
};

export default BoardPaging;