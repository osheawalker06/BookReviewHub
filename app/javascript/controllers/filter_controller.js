import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "query", "book" ]

  search() {
    const query = this.queryTarget.value.toLowerCase()

    this.bookTargets.forEach((book) => {
      const title = book.dataset.title.toLowerCase()
      const author = book.dataset.author.toLowerCase()

      if (title.includes(query) || author.includes(query)) {
        book.classList.remove("hidden")
      } else {
        book.classList.add("hidden")
      }
    })
  }
}