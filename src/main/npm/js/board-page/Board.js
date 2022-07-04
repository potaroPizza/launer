import ReactDOM from "react-dom/client";
import React from "react";
import BoardPage from "./BoardPage";

if(document.getElementById('board-component')) {
    ReactDOM.createRoot(document.getElementById('board-component')).render(<BoardPage/>);
}