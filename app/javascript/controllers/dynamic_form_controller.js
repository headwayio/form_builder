import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="dynamic-form"
export default class extends Controller {
  static targets = ['selector', 'options', 'children', 'grid'];
  selectorOptionsValues = ['select', 'checkboxes', 'radio_buttons'];
  selectorGridValues = ['checkbox_grid', 'radio_grid', 'mixed_grid'];

  connect() {
    if (this.selectorOptionsValues.includes(this.selectorTarget.value)) {
      this.optionsTarget.classList.remove('hidden');
    }

    if (this.selectorGridValues.includes(this.selectorTarget.value)) {
      this.gridTarget.classList.remove('hidden');
    }
  }

  toggleOptionalFields() {
    this.toggleOptions();
    this.toggleGrid();
  }

  toggleOptions() {
    if (this.selectorOptionsValues.includes(this.selectorTarget.value)) {
      this.optionsTarget.classList.remove('hidden');
    } else {
      this.optionsTarget.classList.add('hidden');
    }
  }

  toggleGrid() {
    if (this.selectorGridValues.includes(this.selectorTarget.value)) {
      this.gridTarget.classList.remove('hidden');
    } else {
      this.gridTarget.classList.add('hidden');
    }
  }

  toggleChildren(event) {
    if (event.currentTarget.checked) {
      this.childrenTarget.classList.remove('hidden');
    } else {
      this.childrenTarget.classList.add('hidden');
    }
  }
}
