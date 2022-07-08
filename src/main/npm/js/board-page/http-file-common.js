import axios from "axios";
export default axios.create({
    baseURL : "http://localhost:9095/launer/api",
    headers:{
        "Content-Type": "multipart/form-data",
        'Access-Control-Allow-Origin': 'http://localhost:9095' // 서버 domain
    },
    withCredentials: true
});
