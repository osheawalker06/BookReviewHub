import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "input", "output" ]

  connect() {
    console.log("Counter controller is connected!")
  }

  count() {
    const userInput = this.inputTarget.value;

    let count = 0;

    for (let i = 0; i < userInput.length; i++){
        if (userInput[i] != (" ")){
            count++;
        }
    }
    this.outputTarget.textContent = count;
  }
}