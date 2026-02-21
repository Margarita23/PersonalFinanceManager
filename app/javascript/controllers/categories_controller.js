import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "row"]

  filter() {
    const value = this.inputTarget.value.toLowerCase()

    this.rowTargets.forEach(row => {
      row.style.display =
        row.textContent.toLowerCase().includes(value)
          ? ""
          : "none"
    })
  }
}
