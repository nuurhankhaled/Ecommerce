const express = require("express")
const adminRouter = express.Router();
const { Product } = require("../models/product");
const admin = require("../middleware/admin");

// add
adminRouter.post("/admin/add-product",  async (req, res) => {
    try {
      const { name, description, images, quantity, price, category } = req.body;
      let product = new Product({
        name,
        description,
        images,
        quantity,
        price,
        category,
      });
      product = await product.save();
      res.json(product);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });
  
  // Get products
  adminRouter.get("/admin/get-products",  async (req, res) => {
    try {
      const products = await Product.find({});
      res.json(products);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });
  
  // Delete the product
  adminRouter.post("/admin/delete-product",  async (req, res) => {
    try {
      const { id } = req.body;
      let product = await Product.findByIdAndDelete(id);
      res.json(product);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });
  module.exports = adminRouter;