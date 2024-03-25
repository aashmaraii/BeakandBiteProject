const mongoose = require('mongoose');
const { foodSchema } = require('./food');
// const { foodSchema } = require('./food');

const userSchema = mongoose.Schema({
    name:{
        required: true,
        type: String,
        trim:true,
    },
    email:{
        required: true,
        type:String,
        trim:true,
        validate: {
            validator: (value) => {
               const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
               return value.match(re);
            },
            message: 'Please enter a valid email address'
        },
    },
    password:{
        required: true,
        type: String,
    },
    address:{
        type:String,
        default:'',
    },
    favourites:[{
        type:mongoose.Types.ObjectId, ref: "Food"
    }],
    type:{
        type:String,
        default:'user',
    },
    cart:
        [{food: foodSchema,
            quantity:{
                type:Number,
                required:true,
            }
        },],
        
    

});
const User = mongoose.model('User', userSchema);
module.exports = User;