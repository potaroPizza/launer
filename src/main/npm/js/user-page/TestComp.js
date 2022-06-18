import React from "react";
import ReactDOM from 'react-dom';

function TestComp () {

    return (
        <div>
            REACT가 아래 ID를 찾아서 return 안에 있는 것을 그려준다.
        </div>
    )
}

if(document.getElementById('test-comp')) {
    ReactDOM.createRoot(document.getElementById('test-comp')).render(<TestComp/>);
}