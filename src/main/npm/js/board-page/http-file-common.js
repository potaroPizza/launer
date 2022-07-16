import axios from "axios";
export default axios.create({
    baseURL : "http://localhost:9095/launer/api",
    //baseURL : "http://192.168.0.2:9095/launer/api",	// 정인 집 주소
    //baseURL : "http://192.168.0.22:9095/launer/api",	// 정인 학원컴 주소
    //baseURL : "http://192.168.0.118:9095/launer/api",	// 지효 학원컴 주소
    //baseURL : "http://192.168.0.39:9095/launer/api",	// 학원 컴
    //baseURL : "http://192.168.137.1:9095/launer/api",	// 한서현
    headers:{
        "Content-Type": "multipart/form-data",
        'Access-Control-Allow-Origin': 'http://localhost:9095' // 서버 domain
        //'Access-Control-Allow-Origin': 'http://192.168.0.2:9095'	// 정인 집 도메인
        //'Access-Control-Allow-Origin': 'http://192.168.0.22:9095'	// 정인 학원컴 도메인
        //'Access-Control-Allow-Origin': 'http://192.168.0.118:9095'	// 지효 학원컴 도메인
        //'Access-Control-Allow-Origin': 'http://192.168.0.39:9095'	// 학원 컴 
        //'Access-Control-Allow-Origin': 'http://192.168.137.1:9095'	// 한서현
    },
    withCredentials: true
});
