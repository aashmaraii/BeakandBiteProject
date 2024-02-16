// Imports from packages
const express = require('express');
const mongoose = require('mongoose');

// Imports from other files
const authRouter = require('./routes/auth');
const adminRouter = require('./routes/admin');
const foodRouter = require('./routes/product');
// Init
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://aashma:SOLONGLONDONN@cluster0.lny4ilt.mongodb.net/?retryWrites=true&w=majority";

//middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(foodRouter);

mongoose.connect(DB).then(()=>{
    console.log('Connection Successful');
}).catch(e => {
    console.log(e);
});


// CREATING AN API
// GET, PUT, POST, DELETE, UPDATE -> CRUD

app.listen(PORT, "0.0.0.0" , () => {
    console.log(`connected at port ${PORT} `);
});
module.exports = authRouter;