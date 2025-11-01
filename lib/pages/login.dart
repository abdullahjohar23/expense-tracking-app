import 'package:flutter/material.dart';
import 'package:expense_tracking/pages/signup.dart';
import 'package:expense_tracking/services/reusable_designs.dart';

class LoginPage extends StatefulWidget {
    const LoginPage({super.key});

    @override
    State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    bool obscurePassword = true;

    @override
    Widget build(BuildContext context) {
        final deviceWidth = MediaQuery.of(context).size.width;
        final deviceHeight = MediaQuery.of(context).size.height;
        
        return Scaffold(
            body: Stack(
                children: [
                    Image.asset(
                        'asset/loginbackground.jpg',
                        height: deviceHeight,
                        width: deviceWidth,
                        fit: BoxFit.cover,
                    ),

                    Padding(
                        padding: EdgeInsets.only(top: deviceHeight * 0.05, left: deviceWidth * 0.05, right: deviceWidth * 0.05),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                        Text(
                                            'Welcome\nBack!',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: deviceWidth * 0.1,
                                                fontWeight: FontWeight.w500,
                                            ),
                                        ),
                                    ],
                                ),

                                SizedBox(height: deviceHeight * 0.17),

                                //* Mail Section Starts
                                LabelName(label: 'Mail'),
                                
                                SizedBox(height: deviceHeight * 0.01),

                                TextFieldDesign(hintMessage: 'Enter Gmail', iconName: Icons.mail),
                                //* Mail Section Ends

                                SizedBox(height: deviceHeight * 0.04),

                                //* Password Section Starts
                                LabelName(label: 'Password'),

                                SizedBox(height: deviceHeight * 0.01),

                                PasswordFieldDesign(obsPass: obscurePassword, hintMessage: 'Enter Password'),
                                //* Password Section Ends
                                
                                SizedBox(height: deviceHeight * 0.04),

                                //* Go To Next
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                        Text(
                                            'Login',
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
                                        ),
                                    ],
                                ),

                                SizedBox(height: deviceHeight * 0.02),
                                
                                //* Don't have an account? Label
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        Text(
                                            "Don't have an account?  ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: deviceWidth * 0.05,
                                            ),
                                        ),
                                        
                                        GestureDetector(
                                            onTap: () {
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                                            },
                                            child: Text(
                                                'Signup',
                                                style: TextStyle(
                                                    color: Color(0xffe8c5a5),
                                                    fontSize: deviceWidth * 0.05,
                                                    fontWeight: FontWeight.bold,
                                                ),
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
