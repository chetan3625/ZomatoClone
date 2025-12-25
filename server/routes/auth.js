const express=require("express");
const bcryptjs=require("bcryptjs");
const auth=express.Router();
const User=require("../model/user");

auth.post("/createaccount",async(req,res)=>{


const {name,phoneno,email,password,userType}=req.body;

const existingUser=await User.findOne({email});
if(existingUser){
return res.status(400).json({"msg":"User Already Exists","status":"fail"});
}

const hashedpassword= await bcryptjs.hash(password,5);




var user = new User({
name,
email,
password:hashedpassword,
phoneno,
userType
});
user=await user.save();
res.json(user);
console.log(user);


});
module.exports=auth;