import React, { useEffect, useState } from "react";
import ReactDOM from 'react-dom/client';

const ShippingPanel = (props) => {
    return (
        <div>
            {props.title} 
            배송 X
        </div>
    )
}

const PickUpPanel = (props) => {
    const [items, setItems] = useState(null);
    const loadItems = () => { //서버에서 데이터 받아오기
        $.ajax({
            url: "/launer/api/delivery/pickup/items", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
            method: "GET",   // HTTP 요청 메소드(GET, POST 등)
            dataType: "json" // 서버에서 보내줄 데이터의 타입
        })
        .done(function(json) {
            console.log(json);
            setItems(json);
        })
        .fail(function(xhr, status, errorThrown) {
        })
    }
    if(items == null) {
        loadItems();
        return null;
    }
    const PickUp = (itemNo) => {
        //서버로 데이터 보내기 예시
        $.ajax({
            url: "/launer/api/delivery/pickup/item-test", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
            data: { id: itemNo},  // HTTP 요청과 함께 서버로 보낼 데이터
            method: "PUT",   // HTTP 요청 메소드(GET, POST 등)
            //dataType: "json" // 서버에서 보내줄 데이터의 타입
        })
        // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.
        .done(function(json) {
            console.log(json);
            /*
            $("<h1>").text(json.title).appendTo("body");
            $("<div class=\"content\">").html(json.html).appendTo("body");
            */
        })
        // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
        .fail(function(xhr, status, errorThrown) {
            /*
            $("#text").html("오류가 발생했다.<br>")
            .append("오류명: " + errorThrown + "<br>")
            .append("상태: " + status);
            */
        })
        .always(function(xhr, status) {
            /*
            $("#text").html("요청이 완료되었습니다!");
            */
        });
        let newItems = [];

        for(let i = 0; i<items.length; ++i) { //일부로 for로도 보여줌
            if(items[i].no != itemNo) {
                newItems.push(items[i]);
            }
        }
        console.log(newItems);

        console.log("수거", itemNo);

        setItems(newItems);

    }
    return (
        <div id="orders-list">
            {
                items.map((item, index) => {
                    return (
                        <div key={index} className="order-box">
                        <h3>{item.name}</h3>
                        <div className="order-text-box">
                            <div className="left">
                                <div className="order-text-list">
                                    <p>신청자 <strong>{item.applicant}</strong></p>
                                    <p>위치 <strong>{item.address}</strong></p>
                                </div>
                                <div className="order-text-list">
                                    <p>위치 <strong onClick={(event) => {
                                        props.viewMap(item.lat, item.lng)
                                    }}>{item.fullAddress}</strong></p>
                                </div>
                            </div>
                            <div className="right">
                                <button onClick={(event) => {
                                    PickUp(item.no);
                                }}>수거하기</button>
                            </div>
                        </div>
                    </div>
                    )
                })
            }
        </div>
    )
}

const DeliverySlide = (props) => {
    const [viewMode, setViewMode] = useState('수거');
    const [isView, setIsView] = useState(null);

    function view수거(event) {
        setViewMode('수거');
    }
    return (
        <div id={"list-part"} className={"main-width " +(isView == null?'':(isView==false?'non-active':'active'))}>
            <div className={'on-off-section'} onClick={(event) => {
                if(isView == null) {
                    setIsView(true);
                    return;
                }
                setIsView(!isView);
            }}>
                {
                    (isView == null || isView == false)?'▲':'▼'
                }
            </div>
            <div id="list-box"><div className="line"></div></div>
            <div id="order-tab-box">
                <div className={"pickup-tab "+(viewMode=='수거'?' on':'')} onClick={view수거}>수거</div>
                <div className={"delivery-tab "+(viewMode=='배송'?' on':'')} onClick={(event) => {setViewMode('배송')}}>배송</div>
            </div>
            {
                viewMode == '수거'?
                <PickUpPanel viewMap={props.viewMap}/>
                :
                <ShippingPanel title="하이"/>
            }
        </div>
    )
}

export default  DeliverySlide;