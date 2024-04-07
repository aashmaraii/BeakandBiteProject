const mongoose = require('mongoose');
const { foodSchema } = require('./food');
const orderSchema = mongoose.Schema({

    foods: [
        {
            food: foodSchema,
            quantity: {
                type: Number,
                required: true,
            }
        }
    ],
    totalFoodPrice: {
        type: Number,
        required: true,
    },
    userId: {
        required: true,
        type: String,
    },
    orderedFoodAt: {
        type: Number,
        required: true,
    },
    status: {
        type: Number,
        default: 0,
    },
    address: {
        type: String,
        required: true,

    },
    cutlery: {
        type: Boolean,
        required: true,
    }

});

const Order = mongoose.model('Order', orderSchema);
module.exports = Order;