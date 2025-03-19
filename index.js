const express = require('express'); // load express module, store the function
const app = express() // call the function, returns object of type: Express, store in app obj

//decided not to use app.use(express.json()) because i read in w3 documen its overkill for only GET op
app.get("/api", (req,res) => { // defining the route
    res.json({
        message: "My name is Anthony Dang",
        message: "Test 1",
        message: "Test 2",
        timestamp: Date.now() // dynamic timestamp method, thank you stack overflow
    })
})


// pass a function when the app is listening on given port
app.listen(3000, () => console.log('Curr listening on Port 3000')); //standard for 3000, i actually dont know why we use 3000 specifically
