const express=require("express");
const bcryptjs=require("bcryptjs");
const auth=express.Router();
const User=require("../model/user");

auth.post("/createaccount",async(req,res)=>{


const {name,phoneno,email,password,userType}=req.body;

const existingUser=await User.findOne({email})|| await User.findOne({phoneno});
if(existingUser){
return res.status(400).json({"msg":"User Already Exists with Same Email Id or Phone Number","status":"fail"});
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



auth.post("/signin",async(req,res)=>{
    try{
        const {email,password}=req.body;
        const ExistingUser= await User.findOne({email});
        if(!ExistingUser){
            return res.status(400).json({"msg":"User Not Found Please Create a Account","status":"fail"});
        }
       const isMatching= await bcryptjs.compare(password, ExistingUser.password)

    }catch(err){
    }
});
module.exports=auth;