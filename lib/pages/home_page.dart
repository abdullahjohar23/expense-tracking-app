import 'package:flutter/material.dart';
import 'package:expense_tracking/services/support_widget.dart';

class HomePage extends StatefulWidget {
    const HomePage({super.key});

    @override
    State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    @override
    Widget build(BuildContext context) {
        final deviceWidth = MediaQuery.of(context).size.width;
        final deviceHeight = MediaQuery.of(context).size.height;
        
        return Scaffold(
            backgroundColor: Colors.white,
            body: Container(
                margin: EdgeInsets.only(top: deviceHeight * 0.07, left: deviceWidth * 0.06, right: deviceWidth * 0.06),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text(
                                            'Welcome Back',
                                            style: TextStyle(color: Colors.grey, fontSize: deviceWidth * 0.045, fontWeight: FontWeight.w500),
                                        ),

                                        Text(
                                            'Random User',
                                            style: AppWidget.headlineTextStyle(deviceWidth*0.06),
                                        ),
                                    ],
                                ),

                                ClipRRect(
                                    borderRadius: BorderRadiusGeometry.circular(60),
                                    child: Image.asset('asset/abdullahprofile.jpg',
                                        width: deviceWidth * 0.17,
                                        fit: BoxFit.cover,
                                    ),
                                ),
                            ],
                        ),

                        SizedBox(height: deviceHeight * 0.05),

                        Text(
                            'Magege Your Expenses',
                            style: AppWidget.headlineTextStyle(deviceWidth * 0.07),
                        ),
                        
                        SizedBox(height: deviceHeight * 0.05),

                        Container(
                            width: deviceWidth,
                            padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.04, vertical: deviceHeight * 0.01),

                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromARGB(82, 0, 0, 0),
                                    width: 2.0
                                ),
                                borderRadius: BorderRadius.circular(12),
                            ),

                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                            Text(
                                                'Expenses',
                                                style: AppWidget.headlineTextStyle(deviceWidth * 0.05),
                                            ),

                                            Text(
                                                '\$300',
                                                style: TextStyle(
                                                    color: Color(0xffee6856),
                                                    fontSize: deviceWidth * 0.05,
                                                    fontWeight: FontWeight.bold
                                                ),
                                            ),
                                        ],
                                    ),

                                    Text(
                                        '1 Sep 2025 - 30 Sep 2025',
                                        style: TextStyle(color: Colors.grey, fontSize: deviceWidth * 0.045, fontWeight: FontWeight.w500),
                                    ),

                                    SizedBox(height: deviceHeight * 0.02),

                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            Text(
                                                'Pie Chart will be here',
                                            ),
                                        ],
                                    ),
                                ],
                            ),  
                        ),
                    ],
                ),
            ),
        );
    }
}
