export class Busiņš {
  tips = "nezināms";
  maxIetlipība = "nezināms";
  krāsa = "nezināms";
  jauda = "nezināma";
  maršruts = "nezināms";
  marka = "nezināms";
  modelis = "nezināms";
  pasažieruSkaits = 0;

  constructor(cfg) {
    this.tips = cfg.tips;
    this.maxIetlipība = cfg.maxIetlipība;
    this.krāsa = cfg.krāsa;
    this.jauda = cfg.jauda;
    this.maršruts = cfg.maršruts;
    this.marka = cfg.marka;
    this.modelis = cfg.modelis;
  }

  iekāpa(callback) {
    if (this.pasažieruSkaits < this.maxIetlipība) {
      this.pasažieruSkaits++;
      callback(this);
    } else {
      throw new Error("NAV VIETAS!!!!!");
    }
    return this.pasažieruSkaits;
  }

  izkāpa(callback) {
    if (this.pasažieruSkaits > 0) {
      this.pasažieruSkaits--;
      callback(this);
    } else {
      throw new Error("Jau tukšs!");
    }
    return this.pasažieruSkaits;
  }
}
