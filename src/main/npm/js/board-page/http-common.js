import axios from "axios";
export default axios.create({
    baseURL : "http://192.168.137.1:9095/launer/api",
    headers:{
        "Content-type":"application/json",
        'Access-Control-Allow-Origin': 'http://192.168.137.1:9095' // 서버 domain
    },
    withCredentials: true
});

// "Content-Type": "multipart/form-data",