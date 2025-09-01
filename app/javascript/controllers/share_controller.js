import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="share"
export default class extends Controller {
  static values = {
    title: String,
    text: String,
    url: String
  }

  external() {
    const shareData = {
      title: this.titleValue,
      text: this.textValue,
      url: this.urlValue

    }
    navigator.share(shareData);
  }

  copy(event) {
    navigator.clipboard.writeText(this.urlValue);
    event.currentTarget.innerText = "Copied!"
  }
}
