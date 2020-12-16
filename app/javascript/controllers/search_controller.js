import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'name', 'content' ];
  connect() {
    console.log('Hello!');
  }

  do(event){
    this.contentTarget.innerText = event.currentTarget.dataset.id;
    this.nameTarget.innerText = event.currentTarget.dataset.id;
  }
}
