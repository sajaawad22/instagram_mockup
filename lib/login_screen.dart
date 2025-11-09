import 'package:flutter/material.dart';
import 'package:instagram_mockup/feed_screen.dart';


class Login extends StatelessWidget {
   Login({super.key});
  final formkey = GlobalKey<FormState>();
  final TextEditingController passwordCtrl =TextEditingController();

  final String passwordPattern= r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#\$&*~]).+$';


  @override
  Widget build(BuildContext context) {
    RegExp passwordRegex = RegExp(passwordPattern);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child:Form(key: formkey,
            child: Column(
              children: [
                SizedBox(height: 20),
                Image.asset("assets/images/instagramseeklogo.png", scale: 10,),
                SizedBox(height: 30),
                TextField(
                  decoration: InputDecoration(
                    hintText: "asad_khasanov",
                    hintStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                        color: Colors.white,
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      )
                    )
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: passwordCtrl,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      filled: true,
                      fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                        color: Colors.white,
                      )

                    ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          )
                      )

                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password cannot be empty';
                    }
                    if(!passwordRegex.hasMatch(value)){
                      return 'Password must include:\n'
                          '1 uppercase letter\n'
                          '1 lowercase letter\n'
                          '1 special character ';

                    }
                    return null;
                  },
                ),

                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero, // removes extra button padding
                        minimumSize: Size(0, 0),  // makes it hug the text
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap, // no oversized button
                      ),
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: (){
                        if (formkey.currentState!.validate()){
                        Navigator.push( context,
                            MaterialPageRoute(builder: (context) => Feed()),
                        );
                      } else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Invalid password")
                          ,),
                        );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(16.0),
                        backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                      ),
                      ),
                      child: Text("Log in", style: TextStyle( color: Colors.white),)),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.facebook, color: Colors.blue,),
                    TextButton(
                        onPressed: (){},
                        child: Text("Log in with Facebook", style: TextStyle(color: Colors.blue),))
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        endIndent: 11,
                      ),
                    ),
                    Text(
                      "OR",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Expanded(
                      child: Divider(
                        indent: 10,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 0,
                  children: [
                    Text("Don't have an account?", style: TextStyle(color: Colors.grey),),
                    TextButton(
                        onPressed: (){},
                        child: Text("Sign up.", style: TextStyle(color: Colors.blue),
                        ),
                    ),

                  ],
                ),

                

            
            
            
              ],
            ),
            ),
          ),
        ),
      ),
            bottomNavigationBar:
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                Divider(),
                SizedBox(height: 8),
                Text(
                  "Instagram OT Facebook",
                  style: TextStyle(color: Colors.grey),
                ),
                ],
        ),
      ),
    );
  }
}
