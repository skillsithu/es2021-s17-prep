import promotion from "../../../img/promotion.jpg";
import "./Promotion.scss";

export function Promotion() {
  return (
    <div>
      <img className="promotion-img" src={promotion} alt="promotion" />
    </div>
  );
}
