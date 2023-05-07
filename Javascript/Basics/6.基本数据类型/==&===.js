// What is == in JavaScript?
// Double equals (==) is a comparison operator, which transforms the operands having the same type before comparison.

// So, when you compare string with a number, JavaScript converts any string to a number. An empty string is always converts to zero. A string with no numeric value is converts to NaN (Not a Number), which returns false.

// What is === in JavaScript?
// === (Triple equals) is a strict equality comparison operator in JavaScript, which returns false for the values which are not of a similar type. This operator performs type casting for equality. If we compare 2 with “2” using ===, then it will return a false value.

console.log(2 == '2');

console.log(2 === '2');

console.log(isNaN('2b'));