import CustomToolbar from "./CustomToolbar";
import ReactQuill from "react-quill";
import {useState} from "react";


function Home() {
    const modules = {
        toolbar: {
            container: "#toolbar",
        },
    };

    const formats = [
        "header",
        "font",
        "size",
        "bold",
        "italic",
        "underline",
        "list",
        "bullet",
        "align",
        "color",
        "background",
        "image",
    ];

    const [text, setText] = useState("");

    /*const handleText = (value: any) => {
        console.log(value);
        setText(value);
    };*/
    return (
        <div>
            <div className="text-editor">
                <CustomToolbar/>
                <ReactQuill modules={modules} formats={formats} value={text}/>
            </div>
        </div>
    );
}

export default Home;