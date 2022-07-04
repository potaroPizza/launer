import React, {useCallback, useRef, useState} from 'react';
import EditorComponent from "./Editor/EditorComponent";
import QuillEditor from "./Editor/QuillEditor";
// import Home from "./Editor/Home";

// 에디터 내 이미지가 들어갈 시
// base64 포맷으로 들어감
// 해당 포맷은 용량이 너무 커서 db에 저장이 불가능
// 그래서 텍스터에디터의 움직임을 감지/이미지 경로(태그)를 찾고
// ajax로 이미지 업로드와 업로드 된 이미지의 경로를 써줄 거임

const BoardAdd = (props) => {
    const [desc, setDesc] = useState('');
    const [htmlContent, setHtmlContent] = useState("");
    const quillRef = useRef();

    let cnt = 0;
    function onEditorChange(value) {
        /*if((tempText.includes("<img src=\"data:")) && (cnt % 2 === 0)) {
            let firstTagIdx = value.indexOf("<img src=\"data:");
            let lastTagIdx = value.lastIndexOf(`">`);
            let test = "<img src='/launer/images/logo_1.svg' alt='test'/>";

            console.log("firstTagIdx : " + firstTagIdx);
            console.log(`lastTageIdx : ${lastTagIdx}`);

            let temp = value.substring(firstTagIdx, lastTagIdx+2);
            console.log(temp);

            tempText = value.replace(temp, test);
            console.log(tempText);
        }
        cnt++;*/

        setDesc(value);
        console.log(desc);
    }

    const addBoard = useCallback(() => {

    });

    const fileChange = useCallback((e) => {
        console.log(e.target.value);
    })



    return (
        <div className={props.animateClass === true ? "board-add-component dropdown" : "board-add-component dropUp"}>
            <form onSubmit={addBoard}>
                <input name="title" placeholder="제목을 입력하세요."/>
                {/*<div className="file-box">
                    <input className="upload-name" value="첨부파일" placeholder="첨부파일"/>
                    <label htmlFor="file">파일찾기</label>
                    <input type="file" id="file" onChange={fileChange} multiple/>
                </div>*/}
                {/*<EditorComponent value={desc} onChange={onEditorChange}/>*/}
                <QuillEditor/>
                <input type="hidden" name="content" value={desc}/>
                {/*<QuillEditor quillRef={quillRef} htmlContent={htmlContent} setHtmlContent={setHtmlContent} api={api} />*/}
                <button type="submit"><i className="fa-solid fa-plus"></i></button>
            </form>
        </div>
    );
};

export default BoardAdd;