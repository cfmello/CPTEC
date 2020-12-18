import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'content', 'city', 'results', 'practitioner', 'accept' ];
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
    fetch(`/experts?city=${this.cityTarget.value}&practitioner=${this.practitionerTarget.value}&accept=${this.acceptTarget.value}`,
          { headers: { accept: 'application/json' } })
      .then(response => response.json())
      .then(data => {
        this.resultsTarget.innerHTML = data.results.join('');
      })
  }
}
