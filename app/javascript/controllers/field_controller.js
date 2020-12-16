import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'content' ];
  connect() {
  }

  delete(event){
    event.preventDefault();
    const form = event.currentTarget.form;
    fetch(form.action, )
    debugger;
  }
}