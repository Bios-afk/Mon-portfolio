import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="text-animation"
export default class extends Controller {
  static targets = ["sousTitre"];

  connect() {
    this.wordflick();
  }

  wordflick() {
    let words = ["{ Développeur Full-Stack }"],
      part,
      i = 0,
      offset = 1,
      len = words.length,
      forwards = true,
      skip_count = 0,
      skip_delay = 15,
      speed = 125;

    setInterval(() => {
      if (forwards) {
        if (offset >= words[i].length) {
          ++skip_count;
          if (skip_count == skip_delay) {
            forwards = false;
            skip_count = 0;
          }
        }
      } else {
        if (offset == 1) {
          forwards = true;
          i++;
          offset = 1;
          if (i >= len) {
            i = 0;
          }
        }
      }
      part = words[i].substr(0, offset);
      if (skip_count == 0) {
        if (forwards) {
          offset++;
        } else {
          offset--;
        }
      }

      this.sousTitreTarget.textContent = part;
    }, speed);
  }
}
