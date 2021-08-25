import logo from "../elements/logo.png";

export function Introduction({ startGame }) {
  return (
    <div className="off-game-screen">
      <div className="content">
        <img src={logo} alt="logo" className="logo" />
        <h2>How to Play Star Battle.</h2>
      </div>

      <div className="content">
        <div className="left">
          <p>
            1. Move the spaceship using the sensible areas in the screen;
            <br />
            2. The timer present the time lapsed;
            <br />
            3. The fuel counter show the remain fuel;
            <br />
            4. During the flight, the spaceship needs to destroy the asteroids
            and enemy spaceships that are presented in the space;
            <br />
            5. You can shoot pressing Space Bar;
            <br />
            6. If the spaceship hits a asteroid or another spaceship, you lose
            15 points of fuel;
            <br />
            7. Enemy spaceship needs 1 shot to be destroyed, you will get 5
            points for each enemy destroyed;
            <br />
            8. Asteroid needs 2 shots to be destroyed, you will get 10 points
            for each asteroid destroyed;
            <br />
            9. If you destroy a friendly spaceship, you lose 10 points;
            <br />
            10. During the flight, the spaceship needs to collect fuel in the
            space;
            <br />
            11. You can pause the game clicking in a button pause, or pressing
            the letter "p";
            <br />
            12. Go beyond all limits;
            <br />
            Battle in Space with Star Battle Championship...
          </p>
        </div>
        <div className="right">
          <button className="start-btn" onClick={startGame}>
            <span>Start Game</span>
          </button>
        </div>
      </div>
    </div>
  );
}
