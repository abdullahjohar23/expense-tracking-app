import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
    const SignUpPage({super.key});

    @override
    State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                                                color: Color(0xff3d3e67),
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
                                                color: Color(0xff3d3e67),
                                            ),
                                        ),
                                    ),
                                ),

                                SizedBox(height: deviceHeight * 0.04),

                                Text('Password', style: TextStyle(color: Colors.white, fontSize: deviceWidth * 0.06, fontWeight: FontWeight.w500),),

                                SizedBox(height: deviceHeight * 0.01),

                                Container(
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                                    child: TextField(
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
                                                color: Color(0xff3d3e67),
                                            ),
                                        ),
                                    ),
                                ),
                            ],
                        ),
                    ),
                ],
            ),
        );
    }
}
