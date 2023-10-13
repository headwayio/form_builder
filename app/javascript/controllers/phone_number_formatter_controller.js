import { Controller } from '@hotwired/stimulus';
import { AsYouType } from 'libphonenumber-js';

// Connects to data-controller="phone-number-formatter"
export default class extends Controller {
  format() {
    const formattedNumber = new AsYouType('US').input(this.element.value);

    this.element.value = formattedNumber;
  }
}
