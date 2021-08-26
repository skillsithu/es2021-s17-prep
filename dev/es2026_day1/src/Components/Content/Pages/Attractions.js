import attraction1 from "../../../img/attraction1.jpg";
import attraction2 from "../../../img/attraction2.jpg";
import attraction3 from "../../../img/attraction3.jpeg";
import attraction4 from "../../../img/attraction4.jpg";
import "./Attractions.scss";

export function Attractions() {
  return (
    <div className="attractions">
      <div className="row" style={{ "--bs-gutter-x": 0 }}>
        <div className="col overflow-hidden mx-1">
          <figure>
            <img src={attraction1} alt="attraction1" />
            <figcaption>Enjoy the night.</figcaption>
          </figure>
        </div>
        <div className="col overflow-hidden mx-1">
          <figure>
            <img src={attraction2} alt="attraction2" />
            <figcaption>Park in birdview</figcaption>
          </figure>
        </div>
      </div>
      <div className="row mt-4" style={{ "--bs-gutter-x": 0 }}>
        <div className="col overflow-hidden mx-1">
          <figure>
            <img src={attraction3} alt="attraction3" />
            <figcaption>Crazy tower!</figcaption>
          </figure>
        </div>
        <div className="col overflow-hidden mx-1">
          <figure>
            <img src={attraction4} alt="attraction4" />
            <figcaption>Roller coster</figcaption>
          </figure>
        </div>
      </div>
    </div>
  );
}
