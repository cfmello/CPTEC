import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'content', 'city' ];
  connect() {
  }

  do(event){
    fetch(`/experts/${event.currentTarget.dataset.id}`, { headers: { accept: 'application/json' } })
      .then(response => response.json())
      .then(data => {
        this.contentTarget.innerHTML = data.content;
      });
  }

  dinamic(event){
    console.log(this.cityTarget.value)
  }

  close(event){
    console.log('closing')
  }
}
