'use strict'

// when render profile picture,
// it will go thru array of origin and randomly selected and render document.getElementByID("origin")
let origin = document.getElementById("origin")
let place = ["berthing c-1", "berthing c-2","berthing c-3", "berthing c-4","berthing c-5","berthing b-1","berthing b-2","berthing b-3","berthing b-4","berthing b-5","berthing a-1","berthing a-2","berthing a-3","berthing a-4","berthing a-5","berthing a-6","berthing d-1","berthing d-2"]
origin.innerHTML = place[Math.floor(Math.random() * place.length)];



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
// ///////////////
// let profilePic=document.getElementById("profilePic")
//
// // let randomProPic = idPic[Math.floor(Math.random()*idPic.length)]
// //  // array list with filepath and
// // console.log(profilePic.getAttribute("src"))
// //
// // profilePic.setAttribute('src',randomProPic)
//
// let form = document.getElementById("loginForm")
// let username = document.getElementById("thisUserName").valueOf().innerHTML
//
// function profilePicHandler(){
//     profilePic.removeAttribute("src");
//         if(username==='adlister'){
//             profilePic.setAttribute("src",jawa1)
//         }else if (username === "jawa"){
//             profilePic.setAttribute("src",jawa2)
//         }else if (username === "mina") {
//             profilePic.setAttribute("src", jawa3)
//         }else if (username === "jack") {
//             profilePic.setAttribute("src", jawa4)
//         }else if (username === "geraldo") {
//             profilePic.setAttribute("src", jawa5)
//         }else if (username === "alex") {
//             profilePic.setAttribute("src", jawa6)
//         }else if (username === "cosmo") {
//             profilePic.setAttribute("src", jawa7)
//         }else if (username === "orangeBanana") {
//             profilePic.setAttribute("src", jawa8)
//         }else if (username === "PotatoPeeler") {
//             profilePic.setAttribute("src", jawa9)
//         }else if (username === "BlackLagoon") {
//             profilePic.setAttribute("src", jawa2)
//         }else if (username === "TwitterUser1") {
//             profilePic.setAttribute("src", jawa2)
//         }
// }
//
//
// let jawa1="../../asset/jawaUser/jawa1.png"
// let jawa2="../../asset/jawaUser/jawa2.jpeg"
// let jawa3="../../asset/jawaUser/jawa3.png"
// let jawa4="../../asset/jawaUser/jawa4.jpeg"
// let jawa5="../../asset/jawaUser/jawa5.jpeg"
// let jawa6="../../asset/jawaUser/jawa6.png"
// let jawa7="../../asset/jawaUser/jawa7.png"
// let jawa8="../../asset/jawaUser/jawa8.png"
// let jawa9="../../asset/jawaUser/jawa9.jpeg"
// let jawa10="../../asset/jawaUser/jawa10.png"
// let jawa11="../../asset/jawaUser/jawa11.png"
//
// let idPic = [jawa1, jawa2,jawa3,jawa4,jawa5,jawa6,jawa7,jawa8,jawa9,jawa10,jawa11];
//
//
//
// //depends on current User, i want to change the profile picture src
// // switch(profilePic) {
// //     case'adlister':
// //         profilePic.setAttribute('src', "../asset/jawaUser/jawa1.png")
// //         break;
// //
// //     case'jawa':
// //         profilePic.setAttribute('src', "../asset/jawaUser/jawa2.jpeg")
// //         break;
// //
// //     case'mina':
// //         profilePic.setAttribute('src', "../asset/jawaUser/jawa3.png")
// //         break;
// //
// //     case'jack':
// //         profilePic.setAttribute('src', "../asset/jawaUser/jawa4.jpeg")
// //         break;
// //
// //     case'geraldo':
// //         profilePic.setAttribute('src', "../asset/jawaUser/jawa5.jpeg")
// //         break;
// //
// //     case'alex':
// //         profilePic.setAttribute('src', "../asset/jawaUser/jawa6.png")
// //         break;
// //
// //     case'cosmo':
// //         profilePic.setAttribute('src', "../asset/jawaUser/jawa7.png")
// //         break;
// //
// //     case'orangeBanana':
// //         profilePic.setAttribute('src', "../asset/jawaUser/jawa8.png")
// //         break;
// //
// //     case'PoatatoPeeler':
// //         profilePic.setAttribute('src', "../asset/jawaUser/jawa9.jpeg")
// //         break;
// //
// //     case'BlackLagoon':
// //         profilePic.setAttribute('src', "../asset/jawaUser/jawa10.png")
// //         break;
// //
// //     case'TwitterUser1':
// //         profilePic.setAttribute('src', "../asset/jawaUser/jawa11.png")
// //         break;
// //
// // }