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
    fetch(`/experts?city=${this.cityTarget.value}`, { headers: { accept: 'application/json' } })
      .then(response => response.json())
      .then(data => console.log(data))
  }

  close(event){
    console.log('closing')
  }
}
