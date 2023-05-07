try {
    console.log('start of try runs');
    unicycle;
    console.log('end of try runs,-- never reached');
} catch (error) {
    console.log('error has occured:' + error);   
} finally {
    console.log('this is always run');
}

console.log('then the excution contineus');


// JavaScript will actually create an Error object with two properties: name and message.
// The throw statement allows you to create a custom error.
