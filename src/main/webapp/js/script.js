'use strict'

// when render profile picture,
// it will go thru array of origin and randomly selected and render document.getElementByID("origin")
let origin = document.getElementById("origin")
let place = ["berthing c-1", "berthing c-2","berthing c-3", "berthing c-4","berthing c-5","berthing b-1","berthing b-2","berthing b-3","berthing b-4","berthing b-5","berthing a-1","berthing a-2","berthing a-3","berthing a-4","berthing a-5","berthing a-6","berthing d-1","berthing d-2"]
origin.innerHTML = place[Math.floor(Math.random() * place.length)];



