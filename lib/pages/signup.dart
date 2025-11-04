import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:random_string/random_string.dart';
import 'package:expense_tracking/pages/login.dart';
import 'package:expense_tracking/pages/home_page.dart';
import 'package:expense_tracking/services/database.dart';
import 'package:expense_tracking/services/reusable_designs.dart';
import 'package:expense_tracking/services/shared_preference.dart';

class SignUpPage extends StatefulWidget {
    const SignUpPage({super.key});

    @override
    State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
    bool obscurePassword = true;
    String name = "", email = "", password = "";

    TextEditingController nameController = new TextEditingController();
    TextEditingController mailController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();

    Future<void> registration() async {        
        if (nameController.text != "" && mailController.text != "" && passwordController.text != "") {
            try {
                // UserCredential userCredential = [uncomment this if you need to use userCredential]
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: mailController.text.trim(),
                    password: passwordController.text.trim(),
                );
                
                String id = randomAlphaNumeric(10);

                Map<String, dynamic> userInfoMap = {
                    "Name": nameController.text,
                    "Email": mailController.text,
                    "Id": id,
                };

                await DatabaseMethods().addUserInfo(userInfoMap, id);
                await SharedPreferenceHelper().saveUserId(id);
                await SharedPreferenceHelper().saveUserName(nameController.text.trim());
                await SharedPreferenceHelper().saveUserEmail(mailController.text.trim());

                ScaffoldMessenger.of(context).showSnackBar(
                    ScaffoldText.show('Registered Successfully!', Colors.green, context),
                );

                // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                );
            } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                    ScaffoldMessenger.of(context).showSnackBar(
                        ScaffoldText.show('Password provided is too weak', Colors.orangeAccent, context),
                    );
                } else if (e.code == 'email-already-in-use') {
                    ScaffoldMessenger.of(context).showSnackBar(
                        ScaffoldText.show('Account already exists', Colors.red, context),
                    );
                }
            } catch (e) {
                print('Unexpected error: $e');
                ScaffoldMessenger.of(context).showSnackBar(
                    ScaffoldText.show('Something went wrong: $e', Colors.red, context),
                );
            }
        }
    }

    @override
    Widget build(BuildContext context) {
        final deviceWidth = MediaQuery.of(context).size.width;
        final deviceHeight = MediaQuery.of(context).size.height;
        
        return Scaffold(
            body: Stack(
                children: [
                    Image.asset(
                        'asset/signupbackground.jpg',
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

                                //* Name Section Starts
                                LabelName(label: 'Name'),
                                
                                SizedBox(height: deviceHeight * 0.01),

                                TextFieldDesign(hintMessage: 'Enter Name', iconName: Icons.person, controller: nameController),
                                //* Name Section End

                                SizedBox(height: deviceHeight * 0.04),

                                //* Mail Section Starts
                                LabelName(label: 'Mail'),
                                
                                SizedBox(height: deviceHeight * 0.01),

                                TextFieldDesign(hintMessage: 'Enter Gmail', iconName: Icons.mail, controller: mailController),
                                //* Mail Section Ends

                                SizedBox(height: deviceHeight * 0.04),

                                //* Password Section Starts
                                LabelName(label: 'Password'),

                                SizedBox(height: deviceHeight * 0.01),

                                PasswordFieldDesign(obsPass: obscurePassword, hintMessage: 'Enter Password', controller: passwordController),
                                //* Password Section Ends
                                
                                SizedBox(height: deviceHeight * 0.04),

                                //* Go To Next
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

                                        GestureDetector(
                                            onTap: () {
                                                if (mailController.text != "" && nameController.text != "" && passwordController.text != "") {
                                                    setState(() {
                                                        name = nameController.text;
                                                        email = mailController.text;
                                                        password = passwordController.text;
                                                    });

                                                    registration();
                                                }
                                            },
                                            
                                            child: Container(
                                                height: deviceHeight * 0.055,
                                                width: deviceHeight * 0.055,
                                                decoration: BoxDecoration(
                                                    color: Color(0xffdf815f),
                                                    borderRadius: BorderRadius.circular(60),
                                                ),
                                            
                                                child: Icon(Icons.arrow_forward, color: Colors.white,),
                                            ),
                                        ),
                                    ],
                                ),

                                SizedBox(height: deviceHeight * 0.02),
                                
                                //* Already have an account? Label
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
                                        
                                        GestureDetector(
                                            onTap: () {
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                                            },
                                            child: Text(
                                                'Login',
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
