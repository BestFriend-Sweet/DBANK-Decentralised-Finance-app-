import { dbank_backend as dbank } from '../../declarations/dbank_backend';

window.addEventListener("load", async () => {
  // console.log("Finished Loading...")
  update();
});

document.querySelector('form').addEventListener("submit", async ()=>{
  event.preventDefault();
  // console.log("Submitted.");
  const button = event.target.querySelector('#submit-btn');

  const inputAmount = parseFloat(document.getElementById('input-amount').value);
  const withdrawalAmount = parseFloat(document.getElementById('withdrawal-amount').value);

  button.setAttribute("disabled", true);

  if(document.getElementById("input-amount").value.length != 0){
    await dbank.topUp(inputAmount);
  }
  if(document.getElementById("withdrawal-amount").value.length != 0){
    await dbank.withdrawal(withdrawalAmount);
  }

  await dbank.compound();

  update();

  document.getElementById("input-amount").value = "";
  document.getElementById("withdrawal-amount").value = "";

  button.removeAttribute("disabled");
});

async function update() {
  const currentAmount = await dbank.checkBalance();
  document.getElementById('value').innerText = Math.round(currentAmount * 100) / 100;
}

