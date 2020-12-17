import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'content', 'city', 'results', 'options' ];
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
      .then(data => {
        this.resultsTarget.innerHTML = data.results.join('');
        this.optionsTarget.innerHTML = data.cities.join('');
        this.optionsTarget.removeAttribute('hidden');
      })
  }

  close(event){
  }
  
  fillCity(event){
    this.cityTarget.value = event.currentTarget.innerText;
    this.optionsTarget.setAttribute('hidden',true);
    this.optionsTarget.focus();
  }
}
