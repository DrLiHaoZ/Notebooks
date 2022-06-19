//var => create fcuntion-scoped variable
//let => create block-scoped variable

function start(){
    for (var i = 1; i< 5 ; i++){
        console.log(i)
    }
    console.log(i)

}

start();



function start_err(){
    for (let i = 1; i< 5 ; i++){
        console.log(i)
    }
    console.log(i)

}



