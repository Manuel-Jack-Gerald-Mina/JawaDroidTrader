/*

'use strict'

function Search() {
    let input, filter, searchtype, Adcards, i, txtValue, div;
    input = document.getElementById('searchinput');
    filter = input.value.toUpperCase();
    searchtype = document.getElementById('searchtype');
    Adcards = document.getElementsByClassName('AdCards');

    // Loop through all list items, and hide those who don't match the search query
console.log(searchtype);
    for (i = 0; i < Adcards.length; i++) {

        txtValue = Adcards[i].id;  // textvalue of the card

        if (txtValue.toUpperCase().indexOf(filter) > -1) {
            div = document.getElementById(Adcards[i].id);
            div.style.display = "";

        } else {
            div = document.getElementById(Adcards[i].id);
            div.style.display = "none";
        }
    }
}
*/
