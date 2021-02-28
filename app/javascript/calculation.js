function calculation (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const calculationVal = itemPrice.value * 0.1;
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${calculationVal}`
    const calculationPro = itemPrice.value * (1 - 0.1);
    const profit = document.getElementById("profit")
    profit.innerHTML = `${calculationPro}`
  });
}

window.addEventListener('load', calculation);