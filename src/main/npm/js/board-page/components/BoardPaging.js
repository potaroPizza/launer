import React from 'react';

const BoardPaging = ({page, currentPage, currentPageEvent}) => {
    const pageClickEvent = (e) => {
        console.log(`버튼 클릭 : ${e}`);
        currentPageEvent(e);
    }

    const pageBtnSet = page.map(item => {
        if(item === currentPage) {
            return (
                <button key={item} className="on">{item}</button>
            )
        }

        return (
            <button key={item} onClick={event => pageClickEvent(item)}>
                {item}
            </button>
        )
    });

    return (
        <div className="paging-part">
            <div className="paging-num">
                <span>{currentPage}</span>
            </div>
            <div className="paging-list">
                <div className="paging-btn">
                    <button><i className="fa-solid fa-caret-left"></i></button>
                    <button><i className="fa-solid fa-caret-right"></i></button>
                </div>
                <div className="page-list">
                    {pageBtnSet}
                </div>
            </div>
        </div>
    );
};

export default BoardPaging;