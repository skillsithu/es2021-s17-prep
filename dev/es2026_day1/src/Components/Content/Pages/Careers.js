import { useEffect, useState } from "react";
import { api } from "../../../api";
import carpenter from "../../../img/careers/carpenter.jpeg";
import helper from "../../../img/careers/park-helper.jpeg";
import financial from "../../../img/careers/financial-manager.jpeg";
import mobile from "../../../img/careers/mobile-app-developer.jpeg";
import copywriter from "../../../img/careers/copywriter.jpeg";
import "./Careers.scss";

export function Careers() {
  const [careers, setCareers] = useState([]);
  const [imgMap] = useState({
    "carpenter.jpg": carpenter,
    "park-helper.jpg": helper,
    "financial-manager.jpg": financial,
    "mobile-app-developer.jpg": mobile,
    "copywriter.jpg": copywriter,
  });

  useEffect(() => {
    api.get("/career.php").then(({ data }) => {
      setCareers(data);
    });
  }, []);

  return (
    <div className="careers">
      <p>We have {careers.length} jobs opening.</p>
      <div className="row" style={{ "--bs-gutter-x": 0 }}>
        {careers.map((item, idx) => (
          <div className="col-6 overflow-hidden" key={idx}>
            <figure>
              <img src={imgMap[item.image]} alt="attraction1" />
              <figcaption>{item.name}</figcaption>
            </figure>
          </div>
        ))}
      </div>

      <p className="mt-3 fw-bold">
        Please send your cover letter and résumé via email:{" "}
        <a href="mailto:funnyisland@example.com" className="text-body">funnyisland@example.com</a>.
      </p>
      <p className="text-decoration-underline fw-bold">
        Learn more about our benefits.
      </p>
    </div>
  );
}
