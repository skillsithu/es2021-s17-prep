import "./Header.scss";
import { Banner } from "./Banner/Banner";
import { Navigation } from "./Navigation/Navigation";

export function Header() {
  return (
    <>
      <header>
        <Navigation />
      </header>
      <Banner />
    </>
  );
}
