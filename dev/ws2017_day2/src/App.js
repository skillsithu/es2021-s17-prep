import { useEffect, useState } from "react";
import { api, handleError } from "./api";
import map from "./map.svg";

function App() {
  // Local state
  const [places, setPlaces] = useState([]);
  const [routes, setRoutes] = useState([]);
  const [from, setFrom] = useState(0);
  const [to, setTo] = useState(0);
  const [hours, setHours] = useState("");
  const [minutes, setMinutes] = useState("");
  const [username, setUsername] = useState(
    localStorage.getItem("username") ?? ""
  );
  const [password, setPassword] = useState("");
  const [showDialog, setShowDialog] = useState(false);
  const [apiToken, setApiToken] = useState(
    localStorage.getItem("apiToken") ?? ""
  );
  const [role, setRole] = useState(localStorage.getItem("role") ?? "");
  const [route, setRoute] = useState();

  const isLoggedIn = !!apiToken;
  const isAdmin = role === "ADMIN";

  // Handle to/from inputs
  const setSearch = (value, setter) => {
    const place = places.find(({ name }) => name === value);

    if (place) {
      setter(place.id);
    } else {
      setter(0);
    }
  };

  // Get routes query
  const getRoutes = (event) => {
    event.preventDefault();
    event.stopPropagation();

    if (from > 0 && to > 0) {
      // Use time if set
      let time = "";
      if (hours !== "" && minutes !== "") {
        time = `/${hours}:${minutes}`;
      }

      // GET routes
      api
        .get(`/route/search/${from}/${to}${time}`)
        .then(({ data }) => {
          setRoutes(data);
        })
        .catch(handleError);
    }
  };

  // Login
  const login = (event) => {
    event.preventDefault();
    event.stopPropagation();

    api
      .post("/auth/login", { username, password })
      .then(({ data }) => {
        localStorage.setItem("apiToken", data.token);
        localStorage.setItem("role", data.role);
        localStorage.setItem("username", username);
        setApiToken(data.token);
        setRole(data.role);
        setPassword("");
        setShowDialog(false);
      })
      .catch(handleError);
  };

  // Logout
  const logout = () => {
    api
      .get(`/auth/logout?token=${apiToken}`)
      .then(() => {
        localStorage.removeItem("apiToken");
        localStorage.removeItem("role");
        localStorage.removeItem("username");
        setApiToken("");
        setRole("");
        setUsername("");
      })
      .catch(handleError);
  };

  // Save selection
  const select = (data) => {
    setRoute(data);

    if (isLoggedIn) {
      api
        .post(`/route/selection?token=${apiToken}`, {
          from_place_id: data.from_place_id,
          to_place_id: data.to_place_id,
          schedule_id: data.id,
        })
        .then(() => {})
        .catch(handleError);
    }
  };

  // Load places on page load
  useEffect(() => {
    api
      .get("/place")
      .then(({ data }) => {
        setPlaces(data);
      })
      .catch(handleError);
  }, []);

  return (
    <div className="wrapper">
      {showDialog && (
        <div className="dialog">
          <h2 className="heading">Login</h2>
          <form onSubmit={login}>
            <div className="form-group">
              <input
                type="text"
                name="username"
                placeholder="Username: "
                className="input"
                value={username}
                onChange={(e) => setUsername(e.target.value)}
              />
            </div>
            <div className="form-group">
              <input
                type="password"
                name="password"
                placeholder="Password: "
                className="input"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
              />
            </div>
            <div className="form-group form-content-right">
              <button type="submit" className="btn btn-submit">
                Login
              </button>
              <button
                type="reset"
                className="btn ml-3"
                onClick={() => setShowDialog(false)}
              >
                Cancel
              </button>
            </div>
          </form>
        </div>
      )}
      <div className="container">
        <aside className="side">
          <div className="item action">
            <ul className="nav">
              <li>
                {!isLoggedIn && (
                  <button
                    className="login_btn"
                    onClick={() => setShowDialog(true)}
                  >
                    Login
                  </button>
                )}
                {isLoggedIn && (
                  <>
                    <h4 className="heading">{username}</h4>
                    <button className="login_btn" onClick={logout}>
                      Logout
                    </button>
                    {isAdmin && (
                      <>
                        <button className="login_btn">Create place</button>
                        <button className="login_btn">Update place</button>
                        <button className="login_btn">Delete place</button>
                      </>
                    )}
                  </>
                )}
              </li>
            </ul>
          </div>
          <div className="item form">
            <h1 className="heading">Bani Yas Travel</h1>
            <div className="panel-content">
              <form onSubmit={getRoutes}>
                <div className="form-group">
                  <input
                    type="search"
                    name="from"
                    placeholder="From: "
                    className="input"
                    list="places"
                    onChange={(e) => setSearch(e.target.value, setFrom)}
                  />
                  <datalist id="places">
                    {places.map((place) => {
                      return (
                        <option value={place.name} key={place.id}>
                          {place.id}
                        </option>
                      );
                    })}
                  </datalist>
                </div>
                <div className="form-group">
                  <input
                    type="search"
                    name="target"
                    placeholder="Target: "
                    className="input"
                    list="places"
                    onChange={(e) => setSearch(e.target.value, setTo)}
                  />
                </div>
                <div className="form-group">
                  <input
                    type="number"
                    name="hours"
                    placeholder="Hours: "
                    className="input"
                    min={0}
                    max={24}
                    value={hours}
                    onChange={(e) => setHours(e.target.value)}
                  />
                </div>
                <div className="form-group">
                  <input
                    type="number"
                    name="minutes"
                    placeholder="Minutes: "
                    className="input"
                    min={0}
                    max={60}
                    value={minutes}
                    onChange={(e) => setMinutes(e.target.value)}
                  />
                </div>
                <div className="form-group form-content-right">
                  <button type="submit" className="btn btn-submit">
                    Get Routes
                  </button>
                </div>
              </form>
            </div>
          </div>
          <div className="item panel-list">
            <ul className="result-list">
              {routes.map((route, idx) => {
                const data = route.schedules[0];
                return (
                  <li key={idx} onClick={() => select(data)}>
                    <ul className="result-detail">
                      <li>
                        <label>From: </label>
                        <p>
                          {data.from_place.name} at {data.departure_time}
                        </p>
                      </li>
                      <li>
                        <label>To: </label>
                        <p>
                          {data.to_place.name} at {data.arrival_time}
                        </p>
                      </li>
                      <li>
                        <label>Time Schedule: </label>
                        <p>
                          {data.departure_time} - {data.arrival_time} (
                          {data.travel_time} minutes)
                        </p>
                      </li>
                      <li>
                        <label>Lines: </label>
                        <p>
                          {data.type_name} Line {data.line},{" "}
                          {route.schedules.length - 1} transfer
                        </p>
                      </li>
                    </ul>
                  </li>
                );
              })}
            </ul>
          </div>
        </aside>
        <main className="map">
          <div className="map-container">
            <img src={map} alt="map" />
            {places.map((place) => {
              const isSelected =
                place.id === route?.from_place_id ||
                place.id === route?.to_place_id;
              return (
                <div
                  className={`dot ${isSelected ? "selected" : ""}`}
                  style={{ top: place.y, left: place.x }}
                >
                  <span>{place.name}</span>
                </div>
              );
            })}
          </div>
        </main>
      </div>
    </div>
  );
}

export default App;
