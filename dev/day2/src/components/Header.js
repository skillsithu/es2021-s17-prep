import { Link, useHistory } from "react-router-dom";
import { api } from "../api";

export function Header({ isLoggedIn, setIsLoggedIn }) {
  const history = useHistory();

  const logout = () => {
    api.post("/logout").then(() => {
      setIsLoggedIn(false);
      history.push("/login");
    });
  };

  return (
    <header className="d-flex justify-content-between align-items-center py-2 px-4 bg-white border-bottom shadow-sm">
      <Link to="/" className="text-decoration-none">
        <h3>Event Booking Platform</h3>
      </Link>
      {!isLoggedIn ? (
        <Link to="/login">
          <button type="button" className="btn btn-outline-primary login-btn">
            Login
          </button>
        </Link>
      ) : (
        <div>
          <span className="mr-3">Username</span>
          <button
            type="button"
            className="btn btn-outline-secondary login-btn"
            onClick={logout}
          >
            Logout
          </button>
        </div>
      )}
    </header>
  );
}
