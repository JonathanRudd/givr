import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  // static targets = [ 'test' ]

  connect() {
    this.element.scroll(0, this.element.scrollHeight);
  }
}
