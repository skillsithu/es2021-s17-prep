import axios from "axios";

export const api = axios.create({
  baseURL: "http://localhost/ws2017_day2/HU_Server_A/api/v1",
});

export const handleError = (error) => {
  let str;

  if (error.response) {
    str = error.response.data.message;
  } else if (error.request) {
    str = error.request;
  } else {
    str = error.message;
  }

  console.log(error.config, str);

  alert(str);
};
