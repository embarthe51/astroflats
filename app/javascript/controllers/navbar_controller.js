import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ['nav', 'link']

  connect() {
    console.log('hi');
  }
  navToggle() {
    let pagePosition = window.scrollY
    this.linkTargets.forEach(item => {
      item.style.display = "block"
      if( pagePosition > 50) item.style.display = "none"
    })
  }
}
