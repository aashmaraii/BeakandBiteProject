const express = require("express");
const userRouter = express.Router();
const auth = require('../middlewares/auth');
const { Food } = require("../models/food");
const User = require("../models/user");

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

  // userRouter.post("/api/toggle-favourite", auth, async (req, res) => {
  //   try {
  //     const { id } = req.body;
  //     const food = await Food.findById(id);
  //     let user = await User.findById(req.user);
  
  //     const index = user.favourites.findIndex(fav => fav._id.equals(food._id));
  
  //     if (index === -1) {
  //       // Food not found in favourites, so add it
  //       user.favourites.push(food);
  //     } else {
  //       // Food found in favourites, so remove it
  //       user.favourites.splice(index, 1);
  //     }
  
  //     user = await user.save();
  //     res.json(user);
  //   } catch (e) {
  //     res.status(500).json({ error: e.message });
  //   }
  // });
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
  

  userRouter.put("/api/add-to-favourites", auth, async (req,res)=>{
    try {
      // const userId = req.user.id;
      // const foodId = req.params.id;
      const { id } = req.body;
      const foodId = await Food.findById(id);
      let user = await User.findById(req.user);
  
      // Find the user by ID
      // const user = await User.findById(userId)
      //.populate("favourites", "_id name");
      if (!user) {
        return res.status(404).json({ message: "User not found" });
      }
  
      // Check if the food is already in favorites
      const indexToRemove = user.favourites.findIndex(fav => fav._id.equals(foodId));
  
      if (indexToRemove === -1) {
        // If not in favorites, add it
        const food = await food.findById(foodId);
        if (!food) {
          return res.status(404).json({ message: "food not found" });
        }
  
        // Add food ID to user's favourites
        user.favourites.push(foodId);
  
        // Save the updated user
        await user.save();
  
         return res.status(200).json({favourites : user.favourites});
        //return res.status(200).json({message: "Added To Favourites"})
      } else {
        // If in favorites, remove it
        user.favourites.splice(indexToRemove, 1);
  
        // Save the updated user
        await user.save();
  
        return res.status(200).json({favourites : user.favourites});
        //return res.status(200).json({message: "Removed from Favourites"})
      }
    } catch (e) {
      next(e);
      console.log(e),
      console.error(e);
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

//   userRouter.post("/api/order", auth, async (req, res)=>{
//     try{
//       const {cart, totalPrice} = req.body;
//       let foods = [];
//       for(let i =0; i<cart.length;i++){
//         let food = await Food.findById(cart[i].food._id);
//       }
//       res.json(user);
//     }catch (e)
// {
//   res.status(500).json({error:e.message});
// }  })

  module.exports = userRouter;