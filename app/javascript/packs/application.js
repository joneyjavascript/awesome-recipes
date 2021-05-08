// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

function deleteRecipe(id) {

}

function browserBack(){
    window.history.back();
}

function favoriteRecipe(recipeId) {
    alert(`Adicionado a lista de favoritos! (id: ${ recipeId })`);
}

window.addEventListener("load", () => {
    var backButtons = document.querySelectorAll("[data-back-button]");
    backButtons.forEach(clickable => {
        clickable.addEventListener("click", (event) => {
            browserBack()
            event.preventDefault();
        })
    });

    var favoriteButtons = document.querySelectorAll("[data-favorite-recipe]");
    favoriteButtons.forEach(clickable => {
        clickable.addEventListener("click", (event) => {
            favoriteRecipe(parseInt(clickable.dataset.favoriteRecipe));
            event.preventDefault();
        })
    });

    
})
