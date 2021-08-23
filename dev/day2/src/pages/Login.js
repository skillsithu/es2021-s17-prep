import { useState } from "react";
import { useHistory } from "react-router-dom";
import { api } from "../api";

export function Login({ setIsLoggedIn }) {
  const history = useHistory();
  const [lastname, setLastname] = useState("");
  const [code, setCode] = useState("");

  // Login api call
  const login = (e) => {
    e.preventDefault();
    e.stopPropagation();

    if (lastname && code) {
      api.post("/login", { lastname, registration_code: code }).then(() => {
        setIsLoggedIn(true);
        history.push("/");
      });
    }
  };

  return (
    <div className="container-fluid">
      <div className="row">
        <main className="col-md-6 mx-sm-auto px-4 card">
          <div className="pt-3 pb-2 mb-3 border-bottom text-center">
            <h1 className="h2">Login</h1>
          </div>

          <form className="form-signin" onSubmit={login}>
            <label htmlFor="lastname">Lastname</label>
            <input
              type="text"
              id="lastname"
              name="lastname"
              className="form-control mb-3"
              placeholder="Lastname"
              autoFocus
              required
              onChange={(e) => setLastname(e.target.value)}
            />

            <label htmlFor="registration_code">Registration Code</label>
            <input
              type="text"
              id="registration_code"
              name="registration_code"
              className="form-control mb-3"
              placeholder="Registration Code"
              required
              onChange={(e) => setCode(e.target.value)}
            />

            <button
              className="btn btn-lg btn-primary btn-block mb-3"
              id="login"
              type="submit"
            >
              Sign in
            </button>
          </form>
        </main>
      </div>
    </div>
  );
}
