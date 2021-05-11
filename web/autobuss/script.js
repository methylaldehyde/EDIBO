import { Busiņš } from "./buss.js";

const buss1 = new Busiņš({
  tips: "Mikroautobus",
  maxIetlipība: 16,
  krāsa: "melns",
  jauda: 100,
  maršruts: "Turcija - Rīga",
  marka: "Inomarka",
  modelis: "SuperLabs3000"
});

const izslēgtPogu = (id) =>
  document.getElementById(id).setAttribute("disabled", "disabled");

izslēgtPogu("izkāpšanasPoga");

const ieslēgtPogu = (id) =>
  document.getElementById(id).removeAttribute("disabled");

document.getElementById("iekāpšanasPoga").addEventListener("click", () => {
  try {
    buss1.iekāpa(atjaunotCilvSkaitu);
    ieslēgtPogu("izkāpšanasPoga");
  } catch (e) {
    console.error(e);
    izslēgtPogu("iekāpšanasPoga");
  }
});

document.getElementById("izkāpšanasPoga").addEventListener("click", () => {
  try {
    buss1.izkāpa(atjaunotCilvSkaitu);
    ieslēgtPogu("iekāpšanasPoga");
  } catch (e) {
    console.error(e);
    izslēgtPogu("izkāpšanasPoga");
  }
});

const atjaunotCilvSkaitu = (autobuss) =>
  (document.getElementById("vietas").innerHTML = autobuss.pasažieruSkaits);
