import { useEffect, useMemo, useState } from "react";
import size1_1 from "../elements/001-global.png";
import size2_1 from "../elements/002-travel.png";
import size2_2 from "../elements/006-mars.png";
import size3_1 from "../elements/008-earth-globe.png";
import size3_2 from "../elements/012-jupiter.png";
import size4_1 from "../elements/009-saturn.png";
import size4_2 from "../elements/010-uranus.png";
import size5_1 from "../elements/003-science-2.png";
import size5_2 from "../elements/004-science-1.png";
import size5_3 from "../elements/005-science.png";
import size5_4 from "../elements/007-planet-earth-1.png";
import size5_5 from "../elements/011-planet-earth.png";
import main_ship from "../elements/main-ship.png";
import enemy_ship from "../elements/ship_1.png";
import friendly_ship from "../elements/ship_2.png";
import asteroid from "../elements/aestroid_brown.png";
import fuel from "../elements/fuel.png";
import logo from "../elements/logo-ingame.png";
import shot from "../elements/shot.png";

// Global store due to react scope limitations
window.__assets_count__ = {
  count: 0,
  loaded: 0,
};

export const useAssets = () => {
  const [count, setCount] = useState(0);
  const [loaded, setLoaded] = useState(0);
  const [assets] = useState({
    planets_size1: [new Image()],
    planets_size2: [new Image(), new Image()],
    planets_size3: [new Image(), new Image()],
    planets_size4: [new Image(), new Image()],
    planets_size5: [
      new Image(),
      new Image(),
      new Image(),
      new Image(),
      new Image(),
    ],
    ships: {
      main_ship: new Image(),
      enemy_ship: new Image(),
      friendly_ship: new Image(),
      asteroid: new Image(),
    },
    misc: {
      logo: new Image(),
      fuel: new Image(),
      shot: new Image(),
    },
  });

  const loadAsset = ({ group, item, asset }) => {
    window.__assets_count__.count++;
    setCount(window.__assets_count__.count);

    const elem = assets[group][item];
    elem.src = asset;

    elem.onload = () => {
      window.__assets_count__.loaded++;
      setLoaded(window.__assets_count__.loaded);
    };
  };

  useEffect(() => {
    loadAsset({
      group: "misc",
      item: "logo",
      asset: logo,
    });
    loadAsset({
      group: "misc",
      item: "fuel",
      asset: fuel,
    });
    loadAsset({
      group: "misc",
      item: "shot",
      asset: shot,
    });
    loadAsset({
      group: "ships",
      item: "main_ship",
      asset: main_ship,
    });
    loadAsset({
      group: "ships",
      item: "enemy_ship",
      asset: enemy_ship,
    });
    loadAsset({
      group: "ships",
      item: "friendly_ship",
      asset: friendly_ship,
    });
    loadAsset({
      group: "ships",
      item: "asteroid",
      asset: asteroid,
    });
    loadAsset({
      group: "planets_size1",
      item: 0,
      asset: size1_1,
    });
    loadAsset({
      group: "planets_size2",
      item: 0,
      asset: size2_1,
    });
    loadAsset({
      group: "planets_size2",
      item: 1,
      asset: size2_2,
    });
    loadAsset({
      group: "planets_size3",
      item: 0,
      asset: size3_1,
    });
    loadAsset({
      group: "planets_size3",
      item: 1,
      asset: size3_2,
    });
    loadAsset({
      group: "planets_size4",
      item: 0,
      asset: size4_1,
    });
    loadAsset({
      group: "planets_size4",
      item: 1,
      asset: size4_2,
    });
    loadAsset({
      group: "planets_size5",
      item: 0,
      asset: size5_1,
    });
    loadAsset({
      group: "planets_size5",
      item: 1,
      asset: size5_2,
    });
    loadAsset({
      group: "planets_size5",
      item: 2,
      asset: size5_3,
    });
    loadAsset({
      group: "planets_size5",
      item: 3,
      asset: size5_4,
    });
    loadAsset({
      group: "planets_size5",
      item: 4,
      asset: size5_5,
    });
  }, []);

  const allLoaded = useMemo(() => {
    return count === loaded && loaded > 0;
  }, [count, loaded]);

  return { allLoaded, assets };
};
