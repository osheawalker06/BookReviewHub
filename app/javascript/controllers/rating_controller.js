import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "input", "star" ]

  connect() {
    console.log("Rating controller connected!")
  }

  select(event) {
    
    const selectedValue = event.currentTarget.dataset.value
    this.inputTarget.value = selectedValue;
    this.starTargets.forEach((star) => {
    const starValue = star.dataset.value

    if (starValue <= selectedValue) {
      star.classList.add("text-yellow-400")
      star.classList.remove("text-gray-300")
    } else {
      star.classList.remove("text-yellow-400")
      star.classList.add("text-gray-300")
    }
  })
  }
}