import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  static values = {unavailable: Array}

  connect() {
    const today = new Date();
    const formattedDate = today.toISOString().split('T')[0];
    console.log(formattedDate);
    flatpickr(
      this.element,
      {disable: this.unavailableValue, minDate: formattedDate},
    )
  }

}
