import { Controller } from "stimulus";
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = [ 'content' ];
  connect() {
  }

  delete(event){
    event.preventDefault();
    const form = event.currentTarget.form;
    fetch(form.action, { 
      method: 'delete',
      headers: {
        accept: "application/json",
        "X-CSRF-Token": csrfToken()
      }
    })
      .then(response => response.json)
      .then(data => console.log(data))
    debugger;
  }
}