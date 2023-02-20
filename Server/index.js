const express = require("express")
const mongoose = require("mongoose")
const authRouter = require("./routes/auth")
const adminRouter= require("./routes/admin")
const userRouter= require("./routes/user")
const productRouter = require("./routes/product")
const app = express()
const port = 3000;
const dB= "mongodb+srv://nuur:nuur123@cluster0.bmmjnni.mongodb.net/?retryWrites=true&w=majority"
//middleware
 app.use(express.json()); 
 app.use(authRouter)
 app.use(adminRouter)
 app.use(productRouter)
 app.use(userRouter)

//CREATING AN API
// GET,PUT,POST,DELETE,UPDATE
app.get("/hello", (req,res)=>{
res.send("Hello")
})
//connection
mongoose.connect(dB).then(()=>{
console.log ("Connection Success")
}).catch((e)=>{
  console.log(e)
  })
app.listen(port, "0.0.0.0", ()=> {
 console.log(`connected at port ${port}`)

}) //listen for any other connection // zeros mean it can be accessing from anywhere
