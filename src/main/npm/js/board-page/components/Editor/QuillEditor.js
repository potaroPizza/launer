import React, {useMemo, useState} from 'react';
import ReactQuill from "react-quill";

const QuillEditor = () => {
    function imageUrlHandler() {
        const range = this.quill.getSelection();
        const url = prompt("please copy paste the image url here");

        if(url) {
            this.quill.insertEmbed(range.index, "image", url);
        }
    }

    function imageHandler() {
        const input = document.createElement("input");
        input.setAttribute("type", "file");
        input.setAttribute("accept", ".png,.jpg,.jpeg");
        input.click();

        input.onchange = (e) => {
            const files = e.target.files;
            const formData = new FormData();
            formData.append("files", files[0]);

            const range = this.quill.getSelection();
            const fileSrno = "logo_4.svg";
            this.quill.insertEmbed(range.index, "image", "http://localhost:9095/launer/images/" + fileSrno);
        }
    }

    const[value, setValue] = useState("");

    const modules = useMemo(() => ({
       toolbar: {
           container: [
               [{header: [1, 2, false]}],
               ["bold", "italic", "underline"],
               [{list: "ordered"}, {list: "bullet"}],
               ["imageUrl", "image", "code-block"]
           ],
           handlers: {
               imageUrl: imageUrlHandler,
               image: imageHandler
           }
       }
    }), []);

    console.log(value);

    return (
        <ReactQuill theme='snow' value={value} modules={modules} onChange={setValue} />
    );
};

export default QuillEditor;