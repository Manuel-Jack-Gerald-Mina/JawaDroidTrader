'use strict'

// when render profile picture,
// it will go thru array of origin and randomly selected and render document.getElementByID("origin")
let origin = document.getElementById("origin")
let place = ["berthing c-1", "berthing c-2","berthing c-3", "berthing c-4","berthing c-5","berthing b-1","berthing b-2","berthing b-3","berthing b-4","berthing b-5","berthing a-1","berthing a-2","berthing a-3","berthing a-4","berthing a-5","berthing a-6","berthing d-1","berthing d-2"]
origin.innerHTML = place[Math.floor(Math.random() * place.length)];

//small function to click on 'profile/edit' pictures and send its data immediatly to the servlet to update
function sendPictureData(pictureId){
    location.href= "/profile/editpic?picId=" + pictureId;
}


// let profilePic=document.getElementById("profilePic")
// let currentUser = document.getElementById('currentUser').innerHTML
//
// //depends on current User, i want to change the profile picture src
// switch(profilePic) {
//     case'adlister':
//         profilePic.setAttribute('src', "../asset/jawaUser/jawa1.png")
//         break;
//
//     case'jawa':
//         profilePic.setAttribute('src', "../asset/jawaUser/jawa2.jpeg")
//         break;
//
//     case'mina':
//         profilePic.setAttribute('src', "../asset/jawaUser/jawa3.png")
//         break;
//
//     case'jack':
//         profilePic.setAttribute('src', "../asset/jawaUser/jawa4.jpeg")
//         break;
//
//     case'geraldo':
//         profilePic.setAttribute('src', "../asset/jawaUser/jawa5.jpeg")
//         break;
//
//     case'alex':
//         profilePic.setAttribute('src', "../asset/jawaUser/jawa6.png")
//         break;
//
//     case'cosmo':
//         profilePic.setAttribute('src', "../asset/jawaUser/jawa7.png")
//         break;
//
//     case'orangeBanana':
//         profilePic.setAttribute('src', "../asset/jawaUser/jawa8.png")
//         break;
//
//     case'PoatatoPeeler':
//         profilePic.setAttribute('src', "../asset/jawaUser/jawa9.jpeg")
//         break;
//
//     case'BlackLagoon':
//         profilePic.setAttribute('src', "../asset/jawaUser/jawa10.png")
//         break;
//
//     case'TwitterUser1':
//         profilePic.setAttribute('src', "../asset/jawaUser/jawa11.png")
//         break;
//
// }