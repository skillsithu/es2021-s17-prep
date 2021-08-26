import { useState } from "react";
import map from "../../../img/map.png";
import "./AboutCompany.scss";

export function AboutCompany() {
  const [marked, setMarked] = useState();

  return (
    <div className="about">
      <div className="text-container">
        <p>We have 3 theme parks in Scandinavia.</p>
        <ol>
          <li
            onMouseOver={() => setMarked("a")}
            onMouseOut={() => setMarked("")}
          >
            Stockholm
          </li>
          <li
            onMouseOver={() => setMarked("b")}
            onMouseOut={() => setMarked("")}
          >
            Gothenburg
          </li>
          <li
            onMouseOver={() => setMarked("c")}
            onMouseOut={() => setMarked("")}
          >
            Oslo
          </li>
        </ol>
      </div>
      <div className="img-container">
        <div className={`city city-a ${marked === "a" ? "marked" : ""}`}></div>
        <div className={`city city-b ${marked === "b" ? "marked" : ""}`}></div>
        <div className={`city city-c ${marked === "c" ? "marked" : ""}`}></div>
        <img src={map} alt="map" />
      </div>
    </div>
  );
}
