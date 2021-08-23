import { useState } from "react";
import { BrowserRouter as Router, Route } from "react-router-dom";
import { Header } from "./components/Header";
import { Agenda } from "./pages/Agenda";
import { List } from "./pages/List";
import { Login } from "./pages/Login";
import { Register } from "./pages/Register";
import { Session } from "./pages/Session";

function App() {
  // Is logged in state
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  // Main app and router
  return (
    <>
      <Router basename={process.env.PUBLIC_URL.replace('http://localhost/', '')}>
        <Header isLoggedIn={isLoggedIn} setIsLoggedIn={setIsLoggedIn} />
        <main className="p-4">
          <Route path="/login">
            <Login setIsLoggedIn={setIsLoggedIn} />
          </Route>
          <Route path="/agenda/:organizer/:event">
            <Agenda />
          </Route>
          <Route path="/register/:organizer/:event">
            <Register isLoggedIn={isLoggedIn} />
          </Route>
          <Route path="/session/:organizer/:event/:session">
            <Session />
          </Route>
          <Route path="/" exact>
            <List />
          </Route>
        </main>
      </Router>
    </>
  );
}

export default App;
