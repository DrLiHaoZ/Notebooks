function sum(a,b){
    return a + b
}

console.log(sum(1,2))

let sum2 = (a,b) => a + b

console.log(sum2(1,2))

function isPositive(num){
    return num > 0 
}
console.log(isPositive(-1))

let isPositive2 = num =>  num > 0

console.log(isPositive2(-1))
