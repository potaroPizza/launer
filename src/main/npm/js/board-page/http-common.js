import axios from "axios";
export default axios.create({
    //baseURL : "http://localhost:9095/launer/api",
    baseURL : "http://192.168.0.118:9095/launer/api",	// 지효 학원컴 주소
    headers:{
        "Content-type":"application/json",
        //'Access-Control-Allow-Origin': 'http://localhost:9095' // 서버 domain
         'Access-Control-Allow-Origin': 'http://192.168.0.118:9095'	// 지효 학원컴 도메인
    },
    withCredentials: true
});

// "Content-Type": "multipart/form-data",