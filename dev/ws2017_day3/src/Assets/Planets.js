import { Moving } from "./config";
import { GenericItem } from "./Generic";

export class PlanetSize1 extends GenericItem {
  width = 250;
  height = 250;
  speed = 1;
  direction = Moving.Left;
  automove = true;

  constructor(assets) {
    const asset = assets.planets_size1[0];
    super(asset);
    this.start();
  }
}

export class PlanetSize2 extends GenericItem {
  width = 200;
  height = 200;
  speed = 2;
  direction = Moving.Left;
  automove = true;

  constructor(assets) {
    const asset = assets.planets_size2[0];
    super(asset);
    this.start();
  }
}

export class PlanetSize3 extends GenericItem {
  width = 150;
  height = 150;
  speed = 3;
  direction = Moving.Left;
  automove = true;

  constructor(assets) {
    const asset = assets.planets_size3[0];
    super(asset);
    this.start();
  }
}

export class PlanetSize4 extends GenericItem {
  width = 100;
  height = 100;
  speed = 4;
  direction = Moving.Left;
  automove = true;

  constructor(assets) {
    const asset = assets.planets_size4[0];
    super(asset);
    this.start();
  }
}

export class PlanetSize5 extends GenericItem {
  width = 50;
  height = 50;
  speed = 5;
  direction = Moving.Left;
  automove = true;

  constructor(assets) {
    const asset = assets.planets_size5[0];
    super(asset);
    this.start();
  }
}
