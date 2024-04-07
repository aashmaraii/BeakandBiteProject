const express = require("express");
const userRouter = express.Router();
const auth = require('../middlewares/auth');
const { Food } = require("../models/food");
const User = require("../models/user");
const Order = require("../models/orderfood");

  userRouter.post("/api/add-to-cart", auth, async (req, res) => {
    try {
      const { id } = req.body;
      const food = await Food.findById(id);
      let user = await User.findById(req.user);
  
      if (user.cart.length == 0) {
        user.cart.push({ food, quantity: 1 });
      } else {
        let isFoodFound = false;
        for (let i = 0; i < user.cart.length; i++) {
          if (user.cart[i].food._id.equals(food._id)) {
            isFoodFound = true;
          }
        }
  
        if (isFoodFound) {
          let foodd = user.cart.find((foodd) =>
            foodd.food._id.equals(food._id)
          );
          foodd.quantity += 1;
        } else {
          user.cart.push({ food, quantity: 1 });
        }
      }
      user = await user.save();
      res.json(user);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });

  userRouter.put("/api/toggle-favourite/:id", auth, async (req, res) => {
    try {
      const { id } = req.params;
      const food = await Food.findById(id);
      let user = await User.findById(req.user);
      const index = user.favourites.findIndex(fav => fav._id.equals(food._id));
      if (index === -1) {
        // Food not found in favourites, so add it
        user.favourites.push(food);
      } else {
        // Food found in favourites, so remove it
        user.favourites.splice(index, 1);
      }
      user = await user.save();
      res.json(user);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });
  userRouter.get("/api/get-favourite/:id", auth, async (req, res) => {
    try {
              const userId = req.params.userId;
              const user = await User.findById(userId).populate('favourites');
              if (!user) {
                  return res.status(404).json({ message: 'User not found' });
              }
              const favorites = user.favourites;
              res.json(favorites);
          } catch (error) {
              console.error(error);
              res.status(500).json({ message: 'Internal Server Error' });
          }
  });

  userRouter.delete("/api/remove-from-cart/:id", auth, async (req, res) => {
    try {
      const { id } = req.params;
      const food = await Food.findById(id);
      let user = await User.findById(req.user);
  
      for (let i = 0; i < user.cart.length; i++) {
        if (user.cart[i].food._id.equals(food._id)) {
          if (user.cart[i].quantity == 1) {
            user.cart.splice(i, 1);
          } else {
            user.cart[i].quantity -= 1;
          }
        }
      }
      user = await user.save();
      res.json(user);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  })
  exports.toggleFavourite = async (req, res, next) => {
    
  };

userRouter.get("/api/my/orders", auth, async (req, res) => {
  try {
    const orders = await Order.find({ userId: req.user });
    res.json(orders);
  } catch (e){
    res.status(500).json({ error: e.message });
  }
});

userRouter.post("/api/order-food", auth, async (req, res) => {
  try {
    const { cart, totalFoodPrice, address, cutlery } = req.body;
    let foods = [];

    for (let i = 0; i< cart.length; i++) {
      let food = await Food.findById(cart[i].food._id);
      if (food.quantity >= cart[i].quantity) {
        food.quantity -= cart[i].quantity;
        foods.push({food, quantity: cart[i].quantity });
        await food.save();
      } else {
        return res
          .status(400)
          .json({ msg: `${food.name} is out of stock!` });
      }
    }

    let user = await User.findById(req.user);
    user.cart = [];
    user = await user.save();

    let order = new Order({
      foods,
      totalFoodPrice,
      userId: req.user,
      orderedFoodAt: new Date().getTime(),
      address,
      cutlery,
    });
    order = await order.save();
    res.json(order);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// user address
userRouter.post('/api/user-address', auth, async (req, res)=>{
  try{
    const {address} = req.body;
    let user = await User.findById(req.user);
    user.address = address;
    user = await user.save();
    res.json(user);
  } catch (e){
    res.status(500).json({error: e.message});

  }
});

  module.exports = userRouter;