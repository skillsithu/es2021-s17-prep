import logo from "../elements/logo.png";

export function Ranking({ startGame, ranks }) {
  return (
    <div className="off-game-screen">
      <div className="content">
        <img src={logo} alt="logo" className="logo" />
        <h2>Ranking</h2>
      </div>

      <div className="content">
        <div className="left">
          <table className="ranking-table">
            <thead>
              <tr>
                <th>Position</th>
                <th>Name</th>
                <th>Score</th>
                <th>Time</th>
              </tr>
            </thead>
            <tbody>
              {ranks.map((row, idx) => (
                <tr key={idx}>
                  <td># {idx + 1}</td>
                  <td>{row.name}</td>
                  <td>{row.score} points</td>
                  <td>{row.time} s</td>
                </tr>
              ))}
            </tbody>
          </table>
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
