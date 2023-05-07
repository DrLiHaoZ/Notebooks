const fs = require('fs');

const promisifiedReadFile = (file,encoding) => new Promise((resolve,reject)=> {
    fs.readFile(file,encoding,(err,data)=>{
        if (err) {
            return reject(err);
        }
        resolve(data);
    });
});

module.exports = promisifiedReadFile;