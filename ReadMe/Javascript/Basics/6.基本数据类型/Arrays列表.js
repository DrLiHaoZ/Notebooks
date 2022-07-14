let a1 = [1,2,3]
a1[3] = 4

// 另一种建立array的方法
let a2 = new Array("a","b");


//forEach
let text = 0;

function add(value){
    text += value;
}
a1.forEach(add);


// map
/*
The map() method creates a new array by performing a function on each array element.

The map() method does not execute the function for array elements without values.

The map() method does not change the original array.

This example multiplies each array value by 2:
*/

let a3 = [1,2,3];
let a4 = a3.map(myFunction);
function myFunction(value, index, array){
    return value * 2;
}

//输出
console.log(a4);

let a5 = [1,2,3];
const isLessThan5 = (currentValue)=>{
    return currentValue <= 5;
}
let bool = a5.every(isLessThan5);
console.log('the result for a5 is ' + bool);

