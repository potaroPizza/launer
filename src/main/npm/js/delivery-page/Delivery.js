import React, { useEffect } from "react";
import ReactDOM from 'react-dom/client';
import DeliverySlide from './components/DeliverySlide';

const { kakao } = window;
function DeliveryPage () {

    function viewMap(lat=33.450701, lng=126.570667) {
        let container = document.getElementById("map");
        let options = {
          center: new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
          level: 3 // 지도의 확대 레벨
        };
        let map = new window.kakao.maps.Map(container, options);

    }
    useEffect(() => {
        viewMap();
    }, []);

    return (
        <div>
            <div id="map"/>
            <DeliverySlide viewMap={viewMap}/>
        </div>
    )
}

if(document.getElementById('delivery-delivery')) {
    ReactDOM.createRoot(document.getElementById('delivery-delivery')).render(<DeliveryPage/>);
}

/*

1) HTML to React
HTML 을 return 에 넣은 후 class => className으로 변경
style 사용법은 따로 있음 (확인해보거나 그냥 clsss 쓰세요)

2) useState
[변수명, 변수 바꾸는 함수] = useState(초기값);
state(변수명)가 바뀌면 해당 컴포넌트를 새로 render함, 이 때 setState(변수 바꾸는 함수)를 이용해야함

2) props
props 부모 컴포넌트에서 자식으로 변수, 함수 등을 보낼 수 있음

3) useEffect 
화면이 그려진 후 동작하는 것
매개변수로 한 번만하거나 그려질때마다 하거나 설정 가능함

4) 데이터를 가져오거나 보낼 때 restController를 이용하면 됨
json으로 받거나, json을 보내거나 할 수 있음
ajax 사용하면 됨

function FuncA (param) {
    detail
}
이
FuncA = (param) => {detail}
이 되는 이유를 대충 아는 개념에서 설명하면

변수 -> 메모리에 올라간다.
함수 -> 메모리에 올라간다
그럼 함수는 변수인가?

함수 이름은 변수 이름이네?

FuncA라는 변수는 (param)을 매개변수로 가지는 함수이자 변수이고
내용이 { detail } 이니까 

FuncA = (param) => {detail} 될 것 같다.

onClick={함수 이름}
인데

a = 5;
b = a;
---
b = 5;

위 코드 2개가 같은 결과니까

함수 이름 버리고
onClick={ (param) => {detail} }
해도 될 것 같다.


*/