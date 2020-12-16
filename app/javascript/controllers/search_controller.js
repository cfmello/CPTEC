import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'name', 'content' ];
  connect() {
    console.log('Hello!');
  }

  do(event){
    fetch(`/experts/${event.currentTarget.dataset.id}`, { headers: { accept: 'application/json' } })
      .then(response => response.json())
      .then(data => {
        this.contentTarget.innerHTML = data.content;
        this.nameTarget.innerText = data.name;
      });
  }
}
