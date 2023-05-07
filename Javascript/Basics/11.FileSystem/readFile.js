const fs = require('fs');

path = __dirname;

const file = path + '/hello.txt'

fs.readFile(file, 'utf-8',(err,data)=>{
    if (err) throw err;
    setTimeout(()=>{
        console.log(data);
    },3000); 
});

console.log("hello, i am below the read func");


// so this time i may understand the call back hell 