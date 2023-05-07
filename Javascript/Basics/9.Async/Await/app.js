const fs = require('fs');
const { listenerCount } = require('process');
const promisifiedReadFile = require('./promisifiedReadFile.js')

const path = __dirname;
const file1 = path + '/text1.txt';
const file2 = path + '/text2.txt';

// first we use callback function of readFile

fs.readFile(file1,'utf-8',(err,data)=>{
    if (err) throw err;
    let firstSetence = data;
    fs.readFile(file2,'utf-8',(err,data)=>{
        if (err) throw err;
        let secondSetence = data;
        console.log(firstSetence,secondSetence);
    });
});

// here we use native promise to solve the callback hell
let firstSetence;
let secondSetence
promisifiedReadFile(file1,'utf-8')
    .then((data)=>{
        firstSetence = data;
        return promisifiedReadFile(file2,'utf-8');
    })
    .then((data)=>{
        secondSetence = data;
        console.log(firstSetence+" from promise\n",secondSetence + ' from promise\n');
    })
    .catch((err)=>{
        console.log(err)
    })


    // use async await which is syntactic sugar

    async function readFileAsync (){
        let firstSetence = await promisifiedReadFile(file1,'utf-8');
        let secondSetence = await promisifiedReadFile(file2,'utf-8');
        console.log(firstSetence + ' from await\n',secondSetence + ' from await\n');
    }
    readFileAsync();