import { config, Dimension, Moving } from "./config";

export class GenericItem {
  id;
  x = 0;
  y = 0;
  asset;
  moved = false;
  markedForOut = false;

  constructor(asset) {
    this.asset = asset;
    this.id = "asset_" + Math.floor(Math.random() * 100000);
  }

  randomPos(dim) {
    switch (dim) {
      case Dimension.Width:
        return Math.floor(Math.random() * (config.width - this.width));
      case Dimension.Height:
        return Math.floor(Math.random() * (config.height - this.height));
      default:
        return 0;
    }
  }

  randomPlace() {
    this.x = this.randomPos(Dimension.Width);
    this.y = this.randomPos(Dimension.Height);
  }

  start() {
    switch (this.direction) {
      case Moving.Left:
        this.x = config.width;
        this.y = this.randomPos(Dimension.Height);
        break;
      case Moving.Right:
        this.x = -this.width;
        this.y = this.randomPos(Dimension.Height);
        break;
      case Moving.Down:
        this.x = this.randomPos(Dimension.Width);
        this.y = -this.height;
        break;
      case Moving.Up:
        this.x = this.randomPos(Dimension.Width);
        this.y = config.height;
        break;
      default:
        break;
    }
  }

  startVisible() {
    switch (this.direction) {
      case Moving.Left:
        this.x = config.width - this.width;
        this.y = this.randomPos(Dimension.Height);
        break;
      case Moving.Right:
        this.x = 0;
        this.y = this.randomPos(Dimension.Height);
        break;
      case Moving.Down:
        this.x = this.randomPos(Dimension.Width);
        this.y = 0;
        break;
      case Moving.Up:
        this.x = this.randomPos(Dimension.Width);
        this.y = config.height - this.height;
        break;
      default:
        break;
    }
  }

  autoNext() {
    if (this.automove) {
      this.next();

      if (this.isOut() && !this.once) {
        this.start();
      }
    }
  }

  next() {
    this.moved = true;

    switch (this.direction) {
      case Moving.Left:
        this.left();
        break;
      case Moving.Right:
        this.right();
        break;
      case Moving.Down:
        this.down();
        break;
      case Moving.Up:
        this.up();
        break;
      default:
        break;
    }
  }

  up() {
    if (!this.stay || this.y > 0) {
      this.y -= this.speed;
    }
  }

  down() {
    if (!this.stay || this.y < config.height - this.height) {
      this.y += this.speed;
    }
  }

  right() {
    if (!this.stay || this.x < config.width - this.width) {
      this.x += this.speed;
    }
  }

  left() {
    if (!this.stay || this.x > 0) {
      this.x -= this.speed;
    }
  }

  isOut() {
    if (this.markedForOut) {
      return true;
    }

    switch (this.direction) {
      case Moving.Left:
        return this.x < -this.width;
      case Moving.Right:
        return this.x > config.width + this.width;
      case Moving.Down:
        return this.y > config.height + this.height;
      case Moving.Up:
        return this.y < -this.height;
      default:
        return false;
    }
  }

  _collision(a, b) {
    return (
      a.x > b.x && a.x < b.x + b.width && a.y > b.y && a.y < b.y + b.height
    );
  }

  collision(item) {
    if (this._collision(item, this) || this._collision(this, item)) {
      return true;
    }
    return false;
  }
}
