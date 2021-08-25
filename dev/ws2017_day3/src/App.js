import axios from "axios";
import { useState } from "react";
import { Moving } from "./Assets/config";
import { Game } from "./Screens/Game";
import { Introduction } from "./Screens/Introduction";
import { Ranking } from "./Screens/Ranking";

function App() {
  const [screen, setScreen] = useState(0);
  const [movingShip, setMovingShip] = useState(Moving.Stay);
  const [ranks, setRanks] = useState([]);

  const startGame = () => {
    setScreen(1);
  };

  const gameOver = ({ points, time }) => {
    let name;
    while (!name) {
      name = window.prompt("Name");
    }

    const form_data = new FormData();
    form_data.append("name", name);
    form_data.append("score", points);
    form_data.append("time", time);

    axios
      .post("http://localhost/ws2017_day3/register.php", form_data)
      .then(({ data }) => {
        setRanks(data.sort((a, b) => b.score - a.score));
      })
      .catch((e) => {
        alert(e?.response?.data?.error ?? "Error happened during API request");
      });
    setScreen(2);
  };

  return (
    <div className="app">
      <div
        className="area-up"
        onMouseOver={() => setMovingShip(Moving.Up)}
        onMouseOut={() => setMovingShip(Moving.Stay)}
      ></div>
      <div className="area-center">
        <div
          className="area-left"
          onMouseOver={() => setMovingShip(Moving.Left)}
          onMouseOut={() => setMovingShip(Moving.Stay)}
        ></div>
        <div className="area-game">
          {screen === 0 && <Introduction startGame={startGame} />}
          {screen === 1 && <Game gameOver={gameOver} movingShip={movingShip} />}
          {screen === 2 && <Ranking startGame={startGame} ranks={ranks} />}
        </div>
        <div
          className="area-right"
          onMouseOver={() => setMovingShip(Moving.Right)}
          onMouseOut={() => setMovingShip(Moving.Stay)}
        ></div>
      </div>
      <div
        className="area-down"
        onMouseOver={() => setMovingShip(Moving.Down)}
        onMouseOut={() => setMovingShip(Moving.Stay)}
      ></div>
    </div>
  );
}

export default App;
