const mongoose=require("mongoose");
const userSchema=mongoose.Schema({
    name:{
        type:String,
        required:true,
        trim:true,

    },
    phoneno:{
    type:String,
    required:true,
    unique:true,
    trim:true,



    },
    email:{
        type:String,
        required:true,
        unique:true,
        trim:true,
        validate:{
        validator:(value)=>{
        const re=/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
         value.match(re);
         return value;


        },
        message:"Enter a valid email address",

        }

    },
    password:{
    required:true,
    type:String,
    trim:true,
    minlength:6,

    },
    userType:{
    required:true,
    type:String,
    default:"user"
    }




});
module.exports = mongoose.model("User", userSchema);
