import React, {useEffect, useState} from 'react';
import EditorComponent from "./Editor/EditorComponent";
// import Home from "./Editor/Home";


const BoardAdd = (props) => {
    const [desc, setDesc] = useState('');
    const editorCom = <EditorComponent value={desc} onChange={onEditorChange}/>;

    function onEditorChange(value) {
        setDesc(value)
    }
    useEffect(() => {

    }, []);

    return (
        <div className={props.animateClass === true ? "board-add-component dropdown" : "board-add-component dropUp"}>
            {editorCom}
        </div>
    );
};

export default BoardAdd;