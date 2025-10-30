import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
    const SignUpPage({super.key});

    @override
    State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
    bool _obscurePassword = true;

    @override
    Widget build(BuildContext context) {
        final deviceWidth = MediaQuery.of(context).size.width;
        final deviceHeight = MediaQuery.of(context).size.height;
        
        return Scaffold(
            body: Stack(
                children: [
                    Image.asset(
                        'asset/background.jpg',
                        height: deviceHeight,
                        width: deviceWidth,
                        fit: BoxFit.cover,
                    ),

                    Padding(
                        padding: EdgeInsets.only(top: deviceHeight * 0.05, left: deviceWidth * 0.05, right: deviceWidth * 0.05),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text(
                                    'Create\nAccount!',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: deviceWidth * 0.1,
                                        fontWeight: FontWeight.w500,
                                    ),
                                ),

                                SizedBox(height: deviceHeight * 0.07),

                                Text('Name', style: TextStyle(color: Colors.white, fontSize: deviceWidth * 0.06, fontWeight: FontWeight.w500),),
                                
                                SizedBox(height: deviceHeight * 0.01),

                                Container(
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                                    child: TextField(
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            
                                            hintText: 'Enter Name',
                                            hintStyle: TextStyle(
                                                fontSize: deviceWidth * 0.05,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w400,
                                            ),
                                            
                                            prefixIcon: Icon(
                                                Icons.person,
                                                size: deviceWidth * 0.08,
                                                color: Color(0xffdf815f),
                                            ),
                                        ),
                                    ),
                                ),

                                SizedBox(height: deviceHeight * 0.04),

                                Text('Gmail', style: TextStyle(color: Colors.white, fontSize: deviceWidth * 0.06, fontWeight: FontWeight.w500),),

                                SizedBox(height: deviceHeight * 0.01),

                                Container(
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                                    child: TextField(
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            
                                            hintText: 'Enter Gmail',
                                            hintStyle: TextStyle(
                                                fontSize: deviceWidth * 0.05,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w400,
                                            ),
                                            
                                            prefixIcon: Icon(
                                                Icons.mail,
                                                size: deviceWidth * 0.07,
                                                color: Color(0xffdf815f),
                                            ),
                                        ),
                                    ),
                                ),

                                SizedBox(height: deviceHeight * 0.04),

                                Text('Password', style: TextStyle(color: Colors.white, fontSize: deviceWidth * 0.06, fontWeight: FontWeight.w500),),

                                SizedBox(height: deviceHeight * 0.01),

                                Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                    ),
                                    
                                    child: TextField(
                                        obscureText: _obscurePassword, // hides the text
                                        decoration: InputDecoration(
                                            border: InputBorder.none,

                                            hintText: 'Enter Password',
                                            hintStyle: TextStyle(
                                                fontSize: deviceWidth * 0.05,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w400,
                                            ),
                                                
                                            prefixIcon: Icon(
                                                Icons.lock,
                                                size: deviceWidth * 0.07,
                                                color: Color(0xffdf815f),
                                            ),
                                            
                                            suffixIcon: IconButton(
                                                icon: Icon(
                                                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                                    color: Color(0xffdf815f),
                                                ),
                                                
                                                onPressed: () {
                                                    setState(() {
                                                        _obscurePassword = !_obscurePassword;
                                                    });
                                                },
                                            ),
                                        ),
                                    ),
                                ),
                            
                                SizedBox(height: deviceHeight * 0.04),

                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                        Text(
                                            'Next',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: deviceWidth * 0.06,
                                            ),
                                        ),

                                        SizedBox(width: deviceWidth * 0.07),

                                        Container(
                                            height: deviceHeight * 0.055,
                                            width: deviceHeight * 0.055,
                                            decoration: BoxDecoration(
                                                color: Color(0xffdf815f),
                                                borderRadius: BorderRadius.circular(60),
                                            ),

                                            child: Icon(Icons.arrow_forward, color: Colors.white,),
                                        )
                                    ],
                                ),

                                SizedBox(height: deviceHeight * 0.02),
                                
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        Text(
                                            'Already have an account?  ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: deviceWidth * 0.05,
                                            ),
                                        ),
                                        
                                        Text(
                                            'Login',
                                            style: TextStyle(
                                                color: Color(0xffe8c5a5),
                                                fontSize: deviceWidth * 0.05,
                                                fontWeight: FontWeight.bold,
                                            ),
                                        ),
                                    ],
                                ),
                            ],
                        ),
                    ),
                ],
            ),
        );
    }
}
