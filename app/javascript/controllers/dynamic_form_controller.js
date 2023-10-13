import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="dynamic-form"
export default class extends Controller {
  static targets = ['selector', 'options'];
  selectorValues = ['select', 'checkboxes', 'radio_buttons'];

  connect() {
    if (this.selectorValues.includes(this.selectorTarget.value)) {
      this.optionsTarget.classList.remove('hidden');
    }
  }

  toggleOptions() {
    if (this.selectorValues.includes(this.selectorTarget.value)) {
      this.optionsTarget.classList.remove('hidden');
    } else {
      this.optionsTarget.classList.add('hidden');
    }
  }
}
