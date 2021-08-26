import "./Navigation.scss";

export function Navigation() {
  return (
    <nav className="d-flex container-max-width">
      <div className="nav-item">About</div>
      <div className="nav-item">Investors</div>
      <div className="nav-item">Careers</div>
      <div className="nav-item">Environment</div>
      <div className="nav-item d-none d-md-block">EN / SE / NO / FI</div>
      <div className="nav-item d-md-none">LANG: EN</div>
    </nav>
  );
}
