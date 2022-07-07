import React, {useCallback, useMemo, useState} from 'react';
import ReactQuill from "react-quill";

const QuillEditor = ({onChangeText, value}) => {
    const maxTextValue = 4000;

    function imageUrlHandler() {
        const range = this.quill.getSelection();
        const url = prompt("please copy paste the image url here");

        if(url) {
            this.quill.insertEmbed(range.index, "image", url);
        }
    }

    const imageHandler = useCallback(function () {
        const input = document.createElement("input");
        input.setAttribute("type", "file");
        input.setAttribute("accept", ".png,.jpg,.jpeg");
        input.click();

        input.onchange = (e) => {
            const files = e.target.files;
            const formData = new FormData();
            formData.append("files", files[0]);

            $.ajax({
                url: "/launer/board/tempImg",
                type: "POST",
                enctype: "multipart/form-data",
                data: formData,
                contentType: false,
                processData: false,
                success: (res) => {
                    // alert(res);
                    const range = this.quill.getSelection();
                    const fileSrno = res;
                    this.quill.insertEmbed(range.index, "image", "http://localhost:9095/launer/upload/temp_img/" + fileSrno);
                },
                error: (xhr, status, error) => alert(`error : ${error}`)
            });
        }
    }, []);


    const modules = useMemo(() => ({
       toolbar: {
           container: [
               [{ 'header': [1, 2, false] }],
               ['bold', 'italic', 'underline','strike', 'blockquote'],
               [{'list': 'ordered'}, {'list': 'bullet'}, {'indent': '-1'}, {'indent': '+1'}],
               ['link', 'image'],
               [{ 'align': [] }, { 'color': [] }, { 'background': [] }],          // dropdown with defaults from theme
               ['clean']
           ],
           handlers: {
               imageUrl: imageUrlHandler,
               image: imageHandler
           }
       }
    }), []);

    // console.log(value);

    return (
        <div style={{height: "500px"}}>
            <ReactQuill
                style={{
                    height: "460px"
                }}
                theme='snow'
                value={value}
                modules={modules}
                onChange={(e) => onChangeText(e)} />
        </div>
    );
};

export default QuillEditor;