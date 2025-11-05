import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
    const ProfilePage({super.key});

    @override
    Widget build(BuildContext context) {
        final deviceWidth = MediaQuery.of(context).size.width;
        final deviceHeight = MediaQuery.of(context).size.height;
        
        return Scaffold(
            backgroundColor: Colors.white,

            appBar: AppBar(
                // backgroundColor: Colors.transparent, // make it overlay your background
                backgroundColor: Colors.white,
                elevation: 0, // remove shadow
                
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
                padding: EdgeInsets.only(top: deviceWidth * 0.08),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Column(
                            children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(60),
                                    child: Image.asset('asset/abdullahprofile.jpg',
                                        height: deviceHeight * 0.17,
                                        fit: BoxFit.cover,
                                    ),
                                ),

                                
                            ],
                        ),
                    ],
                ),
            ),
        );
    }
}
