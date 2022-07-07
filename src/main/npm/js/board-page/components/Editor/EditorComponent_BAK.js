import React, { Component } from 'react';
import ReactQuill from 'react-quill';
// import 'react-quill/dist/quill.snow.css';


/*function imageUrlHandler() {
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

        alert("asdfas");
    }
}*/


class EditorComponent_BAK extends Component{
    constructor(props){
        super(props);
    }


    modules = {
        toolbar: [
            //[{ 'font': [] }],
            [{ 'header': [1, 2, false] }],
            ['bold', 'italic', 'underline','strike', 'blockquote'],
            [{'list': 'ordered'}, {'list': 'bullet'}, {'indent': '-1'}, {'indent': '+1'}],
            ['link', 'image'],
            [{ 'align': [] }, { 'color': [] }, { 'background': [] }],          // dropdown with defaults from theme
            ['clean']
        ]
    }

    formats = [
        //'font',
        'header',
        'bold', 'italic', 'underline', 'strike', 'blockquote',
        'list', 'bullet', 'indent',
        'link', 'image',
        'align', 'color', 'background',
    ]

    render(){
        const { value, onChange } = this.props;
        return(
            <div style={{height: "500px"}}>
                <ReactQuill
                    style={{
                        height: "460px"
                    }}
                    theme="snow"
                    modules={this.modules}
                    formats={this.formats}
                    value={value || ''}
                    onChange={
                        (content, delta, source, editor) => {
                            onChange(editor.getHTML())
                        }
                    } />
            </div>
        )
    }
}
export default EditorComponent_BAK