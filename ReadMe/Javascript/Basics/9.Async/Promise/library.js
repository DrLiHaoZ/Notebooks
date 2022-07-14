const inventory = {
    sunglasses : 1900,
    pants:1088,
    bags:10
};

const checkInventory = (order) => {
    return new Promise((resolve,reject)=>{
        setTimeout(()=>{
            let inStock = order.every(item => {
                inventory[item[0]] >= item[1];
            });
            if (inStock){
                resolve("your order was successful");
            } else {
                reject("the item was sold out");
            }
        },3000);
    });
}
module.exports = {checkInventory};

