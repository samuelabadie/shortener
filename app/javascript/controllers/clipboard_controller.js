import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "source", "copied" ]
  copy() {
    console.log("copy");
    navigator.clipboard.writeText(this.sourceTarget.value)
    this.copiedTarget.classList.toggle("opacity-100")
  }
}
