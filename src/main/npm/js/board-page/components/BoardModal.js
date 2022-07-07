import React, {useCallback, useEffect, useState} from 'react';
import BoardDetail from "./BoardDetail";

const BoardModal = ({initialModal, detailNo}) => {
    const [modalClass, setModalClass] = useState(true);
    const [modalStatus, setModalStatus] = useState("modal-part");
    const [btnCount, setBtnCount] = useState(0);

    const modalOut = useCallback((e) => {
        if(e.target.getAttribute("class") !== null) {
            if(e.target.getAttribute("class").includes('modal-wrap') ||
                e.target.getAttribute("class").includes('window-close-btn')) {
                setModalClass(false);
                setTimeout(() => {
                    initialModal();
                }, 700);
            }
        }
    });

    useEffect(() => {
        document.body.style.cssText = `
        position: fixed; 
        top: -${window.scrollY}px;
        overflow-y: scroll;
        width: 100%;
        background:#F4F4F4`;
        return () => {
            const scrollY = document.body.style.top;
            document.body.style.cssText = 'background:#F4F4F4';
            window.scrollTo(0, parseInt(scrollY || '0', 10) * -1);
        };
    }, []);


    const modalUp = () => {
        if(btnCount % 2 === 0) {
            setModalStatus("modal-part fullPage");
        }else {
            setModalStatus("modal-part smallPage");
        }

        setBtnCount(btnCount + 1);
    }

    return (
        <div className="detail-modal">
            <div className={modalClass ? "modal-background on" : "modal-background out"}></div>
            <div className={modalClass ? `modal-wrap on` :  `modal-wrap out`} onClick={(e) => modalOut(e)}>
                <div className={modalStatus}>
                    <header>
                        <button><i className="fa-solid fa-circle-xmark window-close-btn" onClick={modalOut}></i></button>
                        <button><i className="fa-solid fa-window-maximize" onClick={modalUp}></i></button>
                    </header>
                    <div className="main-part">
                        <BoardDetail detailNo={detailNo}/>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default BoardModal;