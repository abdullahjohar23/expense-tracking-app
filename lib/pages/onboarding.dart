import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
    const Onboarding({super.key});

    @override
    State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
    @override
    Widget build(BuildContext context) {
        final deviceWidth = MediaQuery.of(context).size.width;
        final deviceHeight = MediaQuery.of(context).size.height;
        
        return Scaffold(
            backgroundColor: Color(0xfff8edc2),
            
            body: Column(
                children: [
                    SizedBox(height: deviceHeight * 0.08),

                    Image.asset('asset/onboarding.png', width: deviceWidth*0.7),

                    SizedBox(height: deviceHeight * 0.08),

                    Expanded(
                        child: Container(
                            width: deviceWidth,
                            margin: EdgeInsets.only(left: deviceWidth * 0.02, right: deviceWidth * 0.02, bottom: deviceWidth * 0.02),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(60)),
                            
                            child: Column(
                                children: [
                                    SizedBox(height: deviceHeight * 0.05),
                                    
                                    Text(
                                        'Manage Your Daily\nLife Expenses',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: deviceHeight * 0.035,
                                            fontWeight: FontWeight.bold
                                        ),
                                    ),

                                    SizedBox(height: deviceHeight * 0.05),

                                    Padding(
                                        padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.065),
                                        child: Text(
                                            'Expense Tracker is a simple and efficient personal finance management app that allows you to track your daily expenses and income with ease.',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: deviceHeight * 0.02,
                                                fontWeight: FontWeight.w500,
                                            ),
                                        ),
                                    ),

                                    SizedBox(height: deviceHeight * 0.05),

                                    Container(
                                        margin: EdgeInsets.symmetric(horizontal: deviceWidth * 0.15),
                                        
                                        child: Material(
                                            elevation: 3.0,
                                            borderRadius: BorderRadius.circular(12),
                                        
                                            child: Container(
                                                width: deviceHeight,
                                                height: deviceHeight * 0.07,
                                                decoration: BoxDecoration(color: Color(0xffee6856), borderRadius: BorderRadius.circular(12)),
                                                
                                                child: Center(
                                                    child: Text(
                                                        'Get Started',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: deviceWidth*0.06,
                                                            fontWeight: FontWeight.bold,
                                                        ),
                                                    ),
                                                ),
                                            ),
                                        ),
                                    ),
                                ],
                            ),
                        ),
                    ),
                ],
            ),
        );
    }
}
