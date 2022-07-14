const {checkInventory} = require('./library.js');

const order = [['sunglasses',10],['pants',20]];

const handleSuccess = (resolve)=> {
    console.log(resolve);
}

const handleFailure = (failure)=> {
    console.log(failure);
}

checkInventory(order).then(handleSuccess, handleFailure);