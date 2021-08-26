import { HiddenGem } from "./HiddenGem/HiddenGem";
import "./Footer.scss";

export function Footer() {
  return (
    <>
      <HiddenGem />
      <footer>
        <div className="container-max-width">
          ©2016, Funny Island Company. Attraction photos from Unsplash. Europe
          map from public domain.
        </div>
      </footer>
    </>
  );
}
