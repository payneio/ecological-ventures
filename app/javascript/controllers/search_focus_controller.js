import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["query"]

  focus() {
    this.queryTarget.focus()
  }
}
