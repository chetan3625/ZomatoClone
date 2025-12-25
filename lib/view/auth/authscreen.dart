import 'package:flutter/material.dart';
import 'package:iosandandroid/view/auth/email.dart';
class Authscreen extends StatefulWidget {
  static const String routeName="/auth-screen";
  const Authscreen({super.key});

  @override
  State<Authscreen> createState() => _AuthscreenState();
}

class _AuthscreenState extends State<Authscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),

      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
            Color(0xFFE23744),
            Color(0xFFFF6F61)

        ])
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset("assets/AuthLogo.png"),
          SizedBox(height: 70,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(

              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25
              ),
             cursorColor: Colors.black,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
               hintStyle: TextStyle(
                 color: Colors.black,
                 fontWeight: FontWeight.w400,
                 height: 1.5
               ),
               hintText: "Phone No",
               prefixStyle: TextStyle(
                 fontSize: 25,
                color: Colors.blueGrey,
               ),
               filled: true,
                fillColor: Colors.white,


                border: OutlineInputBorder(

                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.white
                  ),

                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.white
                  ),


                )

              ),

            ),
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: (){
            },
            child: Container(
              width: 390,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: Text("Get OTP",style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),),
              ),
            
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(child: Divider(
                thickness: 1,
                color: Colors.white,
              )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 0),
                child: Text("OR",style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),),

              ),
              Expanded(child: Divider(
                thickness: 1,
                color: Colors.white,
              )),


            ],
          ),
          SizedBox(
            height: 30,
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Builder(
                builder: (context) {
                  return InkWell(
                    onTap: (){
                    Navigator.pushNamed(context, SignInWithEmail.routename);
                    },
                    child: Container(
                      width: 390,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(

                          children: [

                            Icon(Icons.email,color: Colors.black,size: 40,),
                            SizedBox(
                              width: 70,
                            ),
                            Text("Continue with email",style: TextStyle(
                                fontSize: 20,
                                color: Colors.black
                            ),)
                          ],
                        ),

                      ),
                    ),
                  );
                }
              ),

            ],
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(

                        children: [

                          Icon(Icons.email,color: Colors.black,size: 40,),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Facebook",style: TextStyle(
                              fontSize: 20,
                              color: Colors.black
                          ),)
                        ],
                      ),

                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(

                        children: [

                          Icon(Icons.network_check,color: Colors.black,size: 40,),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Google",style: TextStyle(
                              fontSize: 20,
                              color: Colors.black
                          ),)
                        ],
                      ),

                    ),
                  ),
                ),


              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text("By continuing , you agree to our",style: TextStyle(
            fontSize: 15,
            color: Colors.white
          ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: (){}, child: Text("Terms of Service")),
              TextButton(onPressed: (){}, child: Text("Privacy Policy")),
              TextButton(onPressed: (){}, child: Text("Content Policy")),

            ],
          ),








        ],
      ),
    ),
    );
  }
}
