import { useCallback, useEffect, useRef, useState } from "react";
import { config, Moving } from "../Assets/config";
import {
  PlanetSize1,
  PlanetSize2,
  PlanetSize3,
  PlanetSize4,
  PlanetSize5,
} from "../Assets/Planets";
import { useAssets } from "../Assets/registry";
import {
  Asteroid,
  EnemyShip,
  FriendlyShip,
  Fuel,
  MainShip,
  Shot,
} from "../Assets/Ships";
import fuelIcon from "../elements/fuel.png";
import timer from "../elements/timer.png";

export function Game({ gameOver, movingShip }) {
  const canvasRef = useRef();
  const { allLoaded, assets } = useAssets();
  const [tick, setTick] = useState(0);
  const [paused, setPaused] = useState(false);
  const [planets] = useState([
    new PlanetSize1(assets),
    new PlanetSize2(assets),
    new PlanetSize3(assets),
    new PlanetSize4(assets),
    new PlanetSize5(assets),
  ]);
  const [mainShip] = useState(new MainShip(assets));
  const [enemies] = useState([new EnemyShip(assets)]);
  const [asteroids] = useState([new Asteroid(assets)]);
  const [friends] = useState([new FriendlyShip(assets)]);
  const [fuels] = useState([new Fuel(assets)]);
  const [shots, setShots] = useState([]);
  const [time, setTime] = useState(0);
  const [fuel, setFuel] = useState(15);
  const [points, setPoints] = useState(0);

  // Render / draw
  const render = useCallback(() => {
    if (!canvasRef || !canvasRef.current || !canvasRef.current.getContext) {
      return;
    }

    // Set moving by mouse
    switch (movingShip) {
      case Moving.Left:
        mainShip.left();
        break;
      case Moving.Right:
        mainShip.right();
        break;
      case Moving.Down:
        mainShip.down();
        break;
      case Moving.Up:
        mainShip.up();
        break;
      default:
        break;
    }

    const ctx = canvasRef.current.getContext("2d");

    ctx.clearRect(0, 0, config.width, config.height);
    ctx.drawImage(assets.misc.logo, 12, 12);

    planets.forEach((item) => {
      ctx.drawImage(item.asset, item.x, item.y);
      item.autoNext();
    });

    ctx.drawImage(mainShip.asset, mainShip.x, mainShip.y);

    friends.forEach((item) => {
      ctx.drawImage(item.asset, item.x, item.y);
      item.autoNext();

      shots.forEach((shot) => {
        if (item.collision(shot)) {
          item.start();
          shot.markedForOut = true;
          setPoints(points - 10);
        }
      });
    });
    enemies.forEach((item) => {
      ctx.drawImage(item.asset, item.x, item.y);
      item.autoNext();

      shots.forEach((shot) => {
        if (item.collision(shot)) {
          item.start();
          shot.markedForOut = true;
          setPoints(points + 5);
        }
      });

      if (item.collision(mainShip)) {
        item.start();
        mainShip.restart();
        setFuel(fuel - 15);
      }
    });
    asteroids.forEach((item) => {
      ctx.drawImage(item.asset, item.x, item.y);
      item.autoNext();

      shots.forEach((shot) => {
        if (item.collision(shot)) {
          if (item.life === 2) {
            item.life = 1;
            shot.markedForOut = true;
          } else {
            item.start();
            item.life = 2;
            shot.markedForOut = true;
            setPoints(points + 10);
          }
        }
      });

      if (item.collision(mainShip)) {
        item.start();
        mainShip.restart();
        setFuel(fuel - 15);
      }
    });
    fuels.forEach((item) => {
      ctx.drawImage(item.asset, item.x, item.y);
      item.autoNext();

      if (item.collision(mainShip)) {
        item.start();
        if (fuel <= 15) {
          setFuel(fuel + 15);
        }
      }
    });
    shots.forEach((item) => {
      ctx.drawImage(item.asset, item.x, item.y);
      item.autoNext();

      if (item.isOut()) {
        setShots(shots.filter(({ id }) => id !== item.id));
      }
    });

    setTick(tick + 1);
  }, [
    tick,
    canvasRef,
    assets,
    planets,
    mainShip,
    enemies,
    asteroids,
    friends,
    fuels,
    shots,
    points,
    fuel,
    movingShip,
  ]);

  // Draw listener
  useEffect(() => {
    let rafId;
    if (allLoaded && !paused) {
      rafId = window.requestAnimationFrame(render);
    }
    if (fuel <= 0) {
      gameOver({ points, time });
    }
    return () => {
      if (rafId) {
        window.cancelAnimationFrame(rafId);
      }
    };
  }, [allLoaded, render, paused, fuel, gameOver, movingShip, points, time]);

  // Handle time
  useEffect(() => {
    let timeoutId;
    if (allLoaded && !paused) {
      timeoutId = setTimeout(() => {
        setTime(time + 1);
        setFuel(fuel - 1);
      }, 1000);
    }
    return () => {
      if (timeoutId) {
        window.clearTimeout(timeoutId);
      }
    };
  }, [allLoaded, paused, time, setTime, fuel, setFuel]);

  // Keyboard listener
  const listener = useCallback(
    (event) => {
      switch (event.which) {
        case 32:
          setShots([
            ...shots,
            new Shot(
              assets,
              mainShip.x + mainShip.width,
              mainShip.y + mainShip.height / 2
            ),
          ]);
          break;
        case 38:
          mainShip.up();
          break;
        case 39:
          mainShip.right();
          break;
        case 40:
          mainShip.down();
          break;
        case 37:
          mainShip.left();
          break;
        case 80:
          setPaused(!paused);
          break;
        default:
          break;
      }
    },
    [shots, assets, mainShip, paused]
  );

  useEffect(() => {
    window.addEventListener("keyup", listener);

    return () => window.removeEventListener("keyup", listener);
  }, [listener]);

  return (
    <div className="game-container">
      <canvas width={config.width} height={config.height} ref={canvasRef} />
      <div className="control-panel">
        <div>
          <img src={fuelIcon} alt="fuel" /> {fuel}
        </div>
        <div>Score: {points} points</div>
        <div>
          <img src={timer} alt="time" /> {time} s
        </div>
        <div>
          <button>Mute sound</button>
        </div>
        <div>
          <button>Font size</button>
        </div>
        <div>
          <button onClick={() => setPaused(!paused)}>
            {paused ? "Continue" : "Pause"} game
          </button>
        </div>
      </div>
    </div>
  );
}
