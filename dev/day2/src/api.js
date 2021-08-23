import axios from "axios";

export const api = axios.create({
  baseURL: "http://localhost/day2/HU_JS-PHP_A/api/v1"
});
