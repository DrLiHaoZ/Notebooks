document.querySelector(".name").addEventListener('click',clickEvent);


var show = document.querySelector("#content");

function clickEvent(e){
    show.innerHTML = e.clientX;
}