import axios from 'axios';
import {getToken} from "../auth";

const service = axios.create({
    baseURL: process.env.REACT_APP_API_URL || "//localhost:8000",
})

service.interceptors.request.use(config => {
    if (getToken()) {
        config.headers['Authorization'] = 'Bearer ' + getToken() || '';
    }
    return config;
});

export default service