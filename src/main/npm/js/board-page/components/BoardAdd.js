import React, {useCallback, useEffect, useRef, useState} from 'react';
import EditorComponent from "./Editor/EditorComponent";
import QuillEditor from "./Editor/QuillEditor";
// import Home from "./Editor/Home";

// 에디터 내 이미지가 들어갈 시
// base64 포맷으로 들어감
// 해당 포맷은 용량이 너무 커서 db에 저장이 불가능
// 그래서 텍스터에디터의 움직임을 감지/이미지 경로(태그)를 찾고
// ajax로 이미지 업로드와 업로드 된 이미ㄴ의 경로를 써줄 거임
// 응 실패 => QuillEditor에서 관련된 이벤트를 제공함, 그걸 활용

const BoardAdd = (props) => {
    const [value, setValue] = useState("");
    const [maxiumText, setMaxiumText] = useState("");
    const quillRef = useRef();
    const maxTextByte = 4000;

    let cnt = 0;
    /*function onEditorChange(value) {
        /!*if((tempText.includes("<img src=\"data:")) && (cnt % 2 === 0)) {
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
        cnt++;*!/

        setDesc(value);
        console.log(desc);
    }*/

    const getByteLengthOfString = function(s,b,i,c){
        for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
        return b;
    };

    /*function sliceByByte(str, maxByte) {
        let b;
        let i;
        let c;
        for(b=i=0;c=str.charCodeAt(i);) {
            b+=c>>7?2:1;
            if (b > maxByte)
                break;
            i++;
        }

        return str.substring(0,i);

    }

    const cutStr = useCallback((str, limit) => {
        let strLength = 0;
        let strTitle = "";
        let strPiece = "";
        for (let i = 0; i < str.length; i++){
            let code = str.charCodeAt(i);
            const ch = str.substr(i, 1).toUpperCase();
            //체크 하는 문자를 저장
            strPiece = str.substr(i,1)
            code = parseInt(code);

            if ((ch < "0" || ch > "9") && (ch < "A" || ch > "Z") && ((code > 255) || (code < 0))){
                strLength = strLength + 3; //UTF-8 3byte 로 계산
            }else{
                strLength = strLength + 1;
            }

            if(strLength>limit){ //제한 길이 확인
                break;
            }else{
                strTitle = strTitle+strPiece; //제한길이 보다 작으면 자른 문자를 붙여준다.
            }
        }
        return strTitle;
    });*/

    const addBoard = useCallback((e) => {
        const formData = $("form[name=board-form]").serialize();
        console.log(formData);
        e.preventDefault();
        $.ajax({
            url: "/launer/board/upload",
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            success: (res) => {
                alert(res);

                return false;
            },
            error: (xhr, status, error) => alert(`error : ${error}`)
        });
    });

    const onChangeText = useCallback((e) => {
        setValue(e);
    });

    const maximumTextUpdate = useCallback(() => {
        const currentByte = getByteLengthOfString(value);
        setMaxiumText(`${currentByte} / ${maxTextByte} Byte`);
    });

    /*const maxiumumFind = useCallback(() => {
        const currentByte = getByteLengthOfString(value);
        if(currentByte > maxTextByte) {
            const tempText = sliceByByte(value, maxTextByte);
            setValue(tempText);
        }
    })*/

    useEffect(() => {
        maximumTextUpdate();
        // maxiumumFind();
    }, [value]);


    return (
        <div className={props.animateClass === true ? "board-add-component dropdown" : "board-add-component dropUp"}>
            <form name="board-form" onSubmit={addBoard}>
                <input name="title" placeholder="제목을 입력하세요."/>
                <input className="upload-name" type="file" placeholder="첨부파일" multiple/>
                {/*<EditorComponent value={desc} onChange={onEditorChange}/>*/}
                <QuillEditor value={value} onChangeText={onChangeText}/>
                <input type="hidden" name="content" value={value}/>
                {/*<QuillEditor quillRef={quillRef} htmlContent={htmlContent} setHtmlContent={setHtmlContent} api={api} />*/}
                <span>{maxiumText}</span>
                <button type="submit"><i className="fa-solid fa-plus"></i></button>
            </form>
        </div>
    );
};

export default BoardAdd;