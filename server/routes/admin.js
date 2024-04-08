const express = require('express');
const adminRouter = express.Router();
const admin = require('../middlewares/admin');
const { Food } = require('../models/food');
const Order = require('../models/orderfood');
const auth = require('../middlewares/auth');

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
  adminRouter.get("admin/get-products", auth, async (req, res) => {
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

  // adminRouter.get("/admin/get-user-orders", admin, async (req, res) => {
  //   try {
  //     const orders = await Order.find({});
  //     res.json(orders);
  //   } catch (e) {
  //     res.status(500).json({ error: e.message });
  //   }
  // });
  adminRouter.get("/admin/get/my-orders", admin, async (req, res) => {
    try {
      const orders = await Order.find({});
      res.json(orders);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });

  adminRouter.post("/admin/change-food-order-status", admin, async (req, res) => {
    try {
      const { id, status } = req.body;
      let order = await Order.findById(id);
      order.status = status;
      order = await order.save();
      res.json(order);
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

adminRouter.get("/admin/earning", admin, async (req, res) => {
try {
  const orders = await Order.find({});
  let totalOrderEarnings = 0;

  for(let i = 0; i < orders.length; i++){
    for(let j = 0; j <orders[i].foods.length; j++){
      totalOrderEarnings +=
      orders[i].foods[j].quantity * orders[i].foods[j].food.price;
    }
  }
  // category wise order fetching
  let momoEarnings = await fetchCategoryWiseFood("Momo");
  let noodlesEarnings = await fetchCategoryWiseFood("Noodles");
  let totalEarnings = {
    totalOrderEarnings,
    momoEarnings,
    noodlesEarnings,

  };
  res.json(totalEarnings);
} 
catch (e) {
  res.json(500).json({ error: e.message});

}
});

async function fetchCategoryWiseFood(category){
  let totalEarnings = 0;
  let categoryFoodOrders = await Order.find({
    "foods.food.category": category,
  });
  for(let i = 0; i < categoryFoodOrders.length; i++){
    for(let j = 0; j < categoryFoodOrders[i].foods.length; j++) {
      totalEarnings +=
      categoryFoodOrders[i].foods[j].quantity * categoryFoodOrders[i].foods[j].food.price;
    }
  }
  return totalEarnings;
}

module.exports = adminRouter;