import React, {useCallback, useMemo} from 'react';
import ReactQuill from "react-quill";

const EditorComponent = ({onChange, value}) => {
    const imageUrlHandler = useCallback(function() {
        const range = this.quill.getSelection();
        const url = prompt("please copy paste the image url here");

        if(url) {
            this.quill.insertEmbed(range.index, "image", url);
        }
    })

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

    const formats = useMemo(() => [
            //'font',
            'header',
            'bold', 'italic', 'underline', 'strike', 'blockquote',
            'list', 'bullet', 'indent',
            'link', 'image',
            'align', 'color', 'background',
        ]);


    return (
        <div>
            <div style={{height: "500px", borderBottom: "1px solid #ccc"}}>
                <ReactQuill
                    style={{
                        height: "460px"
                    }}
                    theme="snow"
                    modules={modules}
                    formats={formats}
                    defaultValue={value}
                    onChange={(e) => onChange(e)}
                        //에바인게 아래 소스가 라이브러리가 제공하는 메서드임(한글 오류)
                        //근데 이게 이렇게 간단하게 해결이 되네;;


                    /*onChange={    //한글 입력 시, 오류
                        (content, delta, source, editor) => {
                            /!*onChange(editor.getHTML())*!/
                            setValue(editor.getHTML);
                        }
                    }*/ />
            </div>
        </div>
    );
};

export default EditorComponent;