const mongoose = require('mongoose');
const { foodSchema } = require('../models/food');


const orderSchema = mongoose.Schema({
    foods: [
        {
            food: foodSchema,
            quantity:{
                type: Number,
                required: true,
            }
        }
    ],
    totalPrice:{
        type: Number,
        required: true,
    },
    userId: {
        required:true,
        type: Number,
    },
    orderedAt: {
        type:Number,
        required:true,
    },
    status:{
        type:Number,
        default: 0,
    }

});

const Order = mongoose.model('Order', orderSchema);
module.exports = Order;