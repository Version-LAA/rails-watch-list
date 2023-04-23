import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="movie-card"
export default class extends Controller {
  static targets = ["description"]
  connect() {
    console.log("hello from movie-card controller");
  }

  show_info(){
    console.log("photo clicked");
    console.dir(this.descriptionTarget);
    console.log(this.descriptionTarget.classList.value === "description");
    if(this.descriptionTarget.classList.value === "description"){
      this.descriptionTarget.classList.remove("description")
      this.descriptionTarget.focus()
    } else {
      this.descriptionTarget.classList.add("description")
    }
  }
}
