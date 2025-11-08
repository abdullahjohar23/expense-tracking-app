import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:expense_tracking/pages/login.dart';
import 'package:expense_tracking/services/reusable_designs.dart';

class ProfilePage extends StatefulWidget {
    const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
    // Logout Function
    Future<void> logout() async {
        await FirebaseAuth.instance.signOut();
        
        // if (context.mounted) means “Is this widget still alive and connected to the screen?”
        if (context.mounted) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
            );

            ScaffoldMessenger.of(context).showSnackBar(
                ScaffoldText.show('Successfully Logged Out!', Colors.green, context),
            );
        }
    }

    @override
    Widget build(BuildContext context) {
        final deviceWidth = MediaQuery.of(context).size.width;
        final deviceHeight = MediaQuery.of(context).size.height;
        
        return Scaffold(
            backgroundColor: Colors.white,

            appBar: AppBar(
                // backgroundColor: Colors.transparent, // make it overlay your background
                backgroundColor: Colors.white,
                elevation: 0, // removes shadow
                
                leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                        Navigator.pop(context);
                    },
                ),
                
                title: Text(
                    'Profile',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: deviceWidth*0.06,
                        fontWeight: FontWeight.bold,
                    ),
                ),
                centerTitle: true,
            ),

            body: Padding(
                padding: EdgeInsets.only(top: deviceWidth * 0.08, left: deviceWidth * 0.07, right: deviceWidth * 0.07),
                child: Column(
                    children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(70),
                                    child: Image.asset('asset/abdullahprofile.jpg',
                                        height: deviceHeight * 0.13,
                                        fit: BoxFit.cover,
                                    ),
                                ),
                            ],
                        ),

                        SizedBox(height: deviceWidth * 0.08),

                        // Name
                        ProfileInfoTile(text: 'Abdullah Johar', prefixicon: Icons.person),

                        // Gmail
                        ProfileInfoTile(text: 'abdullah@gmail.com', prefixicon: Icons.mail),

                        // Income
                        ProfileInfoTile(text: 'Add Icome', prefixicon: Icons.attach_money, suffixicon: Icons.chevron_right),

                        // Expense
                        ProfileInfoTile(text: 'Add Expense', prefixicon: Icons.payment, suffixicon: Icons.chevron_right),

                        // Logout
                        ProfileInfoTile(text: 'Logout', prefixicon: Icons.logout, suffixicon: Icons.chevron_right, onTap: logout,),

                        // Delete Account
                        ProfileInfoTile(text: 'Delete Account', prefixicon: Icons.delete, suffixicon: Icons.chevron_right),
                    ],
                ),
            ),
        );
    }
}
