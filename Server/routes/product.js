const express = require("express");
const productRouter = express.Router();
const { Product } = require("../models/product");

// api/products/category= category selected
productRouter.get("/api/products/",  async (req, res) => {
  try {
    const products = await Product.find({ category: req.query.category });
    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// /api/products/search/i
productRouter.get("/api/products/search/:name",  async (req, res) => {
  try {
    const products = await Product.find({
      name: { $regex: req.params.name, $options: "i" },
    });

    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
module.exports = productRouter;
