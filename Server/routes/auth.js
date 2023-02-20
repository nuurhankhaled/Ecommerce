const express = require("express");
const User = require("../models/user");
const bcryptjs = require("bcryptjs");
const authRouter = express.Router();
const jwt = require("jsonwebtoken");
const auth = require("../middleware/auth");

// Sign Up
authRouter.post("/api/signup", async (req, res) => {
  try {
    // email , name , phone , password
    // get the data from client
    const { name, email, phone, password } = req.body
    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(400).json({ msg: "Email Address already exist" })
    }
    if (password.length < 6) {
      return res.status(400).json({ msg: "Password should be more than 6 characters" })
    }
    const hashedpassword = await bcryptjs.hash(password, 8)
    let user = new User({
      email, password: hashedpassword, name, phone
    });
    user = await user.save();
    res.json({ user });
    // post that data in database
    // return the data to the user as well
  } catch (error) {
    res.status(500).json({
      error: error.message
    })
  }
});


// Sign in 
authRouter.post("/api/signin", async (req, res) => {
  try { 
    const {email , password} = req.body;
    const user = await User.findOne({email : email});
    if(!user){
      return res.status(400).json({ msg: "Please enter an existing email!" })
    }

   const isMatch = await bcryptjs.compare(password, user.password);
   if(!isMatch){
    return res.status(400).json({ msg: "Incorrect password!" })

   }
   const token = jwt.sign({id : user.id}, "passwordKey");
   res.json({token,...user._doc}); 
   
   //three dots to take every properety seperately  *name alone and email alone and other things *
   //and add an token 
   // {
   // "name": "nuur",
   // "email": "nn@gmail.com"
   //}
  }
  catch (e) {
    res.status(500).json({ error: e.message })
  }
}
);
module.exports = authRouter







