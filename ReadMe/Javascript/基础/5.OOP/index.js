let circle = {
    radius:1,
    location:{
        x:1,
        y:2
    },
    draw: function(){
        console.log("here is a circle")
    }
}
circle.draw();

// constructor function
function Circle(radius){
    this.radius = radius;
    this.draw = function(){
        console.log("this is circle from constructor function")
    }
}
let another_circle = new Circle(1);
another_circle.draw();


// factory function 
function create_circle(radius){
    return{
        radius,
        draw: function(){
         console.log("this is a circle from factory function");
        }
    }
}
let circle_2 = create_circle(1);
circle_2.draw();