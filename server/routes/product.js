const express = require('express');
const foodRouter = express.Router();
const auth = require("../middlewares/auth");
const Food = require('../models/food');


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
 

  module.exports = foodRouter;