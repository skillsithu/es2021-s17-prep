import { Moving } from "./config";
import { GenericItem } from "./Generic";

export class MainShip extends GenericItem {
  width = 62;
  height = 50;
  speed = 4;
  direction = Moving.Right;
  automove = false;
  stay = true;

  constructor(assets) {
    const asset = assets.ships.main_ship;
    super(asset);
    this.restart();
  }

  restart() {
    this.startVisible();
    this.y = 275;
  }
}

export class EnemyShip extends GenericItem {
  width = 57;
  height = 50;
  speed = 2;
  direction = Moving.Left;
  automove = true;

  constructor(assets) {
    const asset = assets.ships.enemy_ship;
    super(asset);
    this.startVisible();
  }
}

export class FriendlyShip extends GenericItem {
  width = 59;
  height = 50;
  speed = 2;
  direction = Moving.Left;
  automove = true;

  constructor(assets) {
    const asset = assets.ships.friendly_ship;
    super(asset);
    this.startVisible();
  }
}

export class Asteroid extends GenericItem {
  width = 57;
  height = 50;
  speed = 2;
  life = 2;
  direction = Moving.Left;
  automove = true;

  constructor(assets) {
    const asset = assets.ships.asteroid;
    super(asset);
    this.startVisible();
  }
}

export class Fuel extends GenericItem {
  width = 58;
  height = 50;
  speed = 2;
  direction = Moving.Down;
  automove = true;

  constructor(assets) {
    const asset = assets.misc.fuel;
    super(asset);
    this.startVisible();
  }
}

export class Shot extends GenericItem {
  width = 10;
  height = 2;
  speed = 2;
  direction = Moving.Right;
  automove = true;
  once = true;

  constructor(assets, x, y) {
    const asset = assets.misc.shot;
    super(asset);
    this.x = x;
    this.y = y;
  }
}
