import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'name', 'content' ];
  connect() {
    console.log('Hello!');
  }

  do(event){
    fetch(`/experts/${event.currentTarget.dataset.id}`)
      .then(response => response.text())
      .then(data => {
        this.contentTarget.innerHTML = data;
        // this.nameTarget.innerText = event.currentTarget.dataset.id;
      });
  }
}
