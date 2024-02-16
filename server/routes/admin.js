const express = require('express');
const adminRouter = express.Router();
const admin = require('../middlewares/admin');
const Food = require('../models/food');

// Add product
adminRouter.post("/admin/add-product", admin, async (req, res) => {
    try {
      const { name, description, images, quantity, price, category } = req.body;
      let food = new Food({
        name,
        description,
        images,
        quantity,
        price,
        category,
      });
      food = await food.save();
      res.json(product);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });

  // Get all your products

  // adminRouter.get('/admin/get/products',admin,async(req,res)=>{
  //   try{
  //     const foods = await Food.find({});
  //     res.json(foods);
  //   }catch{
  //     res.status(500).json({error:e.message});
  //   }
  // })
  adminRouter.get("/admin/get-products", admin, async (req, res) => {
    try {
      const foods = await Food.find({});
      res.json(foods);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });

  // Delete the food
  // adminRouter.get("/admin/delete-product", admin, async (req, res) => {
  //   try {
  //     const {id} = req.body;
  //     let food = await Food.findByIdAndDelete(id);
  //     // food = await food.save();
  //     res.json(food);
  //   } catch (e) {
  //     res.status(500).json({ error: e.message });
  //   }
  // });
  adminRouter.post("/admin/delete-product", admin, async (req, res) => {
    try {
      const { id } = req.body;
      let food = await Food.findByIdAndDelete(id);
      res.json(food);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });

// adminRouter.post('/admin/add-product',admin,async(res,req)=>{
//     try{
//         const {name,description,images,category,quantity,price} = req.body;
//      let food = new Food({
        
//         name,
//         description,
//         images,
//         category,
//         quantity,
//         price,
       
//      });
//      food = await food.save();
//      res.json(food);
//     }catch(e){
//         res.status(500).json({error:e.message});
//     }
// });
module.exports = adminRouter;