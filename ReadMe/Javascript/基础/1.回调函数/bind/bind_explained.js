let person = {
    name: 'John Doe',
    getName: function() {
        console.log(this.name);
    }
};


// When you pass a method an object is to another function as a callback, 
// the this is lost. For example:

//setTimeout(person.getName, 1000);


/*As you can see clearly from the output, 
the person.getName() returns undefined instead of 'John Doe'.
This is because setTimeout() received the function person.getName 
separately from the person object. */


// solotion 1: you can wrap the call to the person.getName method in an anonymous function:
setTimeout(function () {
    person.getName();
}, 1000);


// solution 2: use bind:
let f = person.getName.bind(person);
setTimeout(f, 1000);