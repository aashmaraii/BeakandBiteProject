const express = require('express');
const foodRouter = express.Router();
const auth = require("../middlewares/auth");
const { Food }= require('../models/food');


foodRouter.get("/api/products/", auth, async (req, res) => {
    try {
      console.log(req.query.category);
      const foods = await Food.find({ category: req.query.category });
      res.json(foods);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });


  foodRouter.get("/api/products/search/:name", auth, async (req, res) => {
    try {
      console.log(req.query.category);
      const foods = await Food.find({
        name:{$regex: req.params.name, $options: "i"},
      })
      res.json(foods);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });
 

  //rate the product

  foodRouter.post("/api/rate-product", auth, async (req, res) => {
    try {
      const { id, rating } = req.body;
      let food = await Food.findById(id);
  
      for (let i = 0; i < food.ratings.length; i++) {
        if (food.ratings[i].userId == req.user) {
          food.ratings.splice(i, 1);
          break;
        }
      }
  
      const ratingSchema = {
        userId: req.user,
        rating,
      };
  
      food.ratings.push(ratingSchema);
      food = await food.save();
      res.json(food);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });

  // foodRouter.get('api/food-for-you', auth, async (req, res) =>{
  //   try{
  //     let foods = await Food.find({});
  //     foods = foods.sort((k,l)=>{
  //       let kSum = 0;
  //       let lSum = 0;

  //       for(let i=0; i<k.ratings.length;i++){
  //         kSum += k.ratings[i].rating;
  //       }
  //       for(let i=0; i<l.ratings.length;i++){
  //         lSum += l.ratings[i].rating;
  //       }
  //       return kSum < lSum ? 1 : -1;

  //     });
  //     res.json(foods[0]);
  //   }catch (e){
  //     res.status(500).json({ error: e.message});

  //   }
  // });
  foodRouter.get("/api/food-for-you", auth, async (req, res) => {
    try {
      let foods = await Food.find({});
  
      foods = foods.sort((a, b) => {
        let aSum = 0;
        let bSum = 0;
  
        for (let i = 0; i < a.ratings.length; i++) {
          aSum += a.ratings[i].rating;
        }
  
        for (let i = 0; i < b.ratings.length; i++) {
          bSum += b.ratings[i].rating;
        }
        return aSum < bSum ? 1 : -1;
      });
  
      res.json(foods[0]);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });

  module.exports = foodRouter;