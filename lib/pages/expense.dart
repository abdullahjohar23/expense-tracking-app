import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracking/services/database.dart';
import 'package:expense_tracking/services/support_widget.dart';
import 'package:expense_tracking/services/reusable_designs.dart';
import 'package:expense_tracking/services/shared_preference.dart';

class ExpensePage extends StatefulWidget {
    const ExpensePage({super.key});

    @override
    State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
    String? id;

    getTheSharedPref() async {
        id = await SharedPreferenceHelper().getUserId();
        setState(() {
        });
    }

    @override
    void initState() {
        super.initState();
        getTheSharedPref();
    }

    DateTime selectedDate = DateTime.now();

    Future<void> _selectedDate(BuildContext context) async {
        final DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
        );

        if (pickedDate != null) {
            setState(() {
                selectedDate = pickedDate;
            });
        }
    }

    String get formattedDate {
        return DateFormat('dd-MM-yyyy').format(selectedDate);
    }

    String? value;

    final List<String> quizItems = [
        'Shopping',
        'Grocery',
        'Others',
    ];

    TextEditingController amountController = new TextEditingController();

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
                    'Add Expense',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: deviceWidth*0.06,
                        fontWeight: FontWeight.bold,
                    ),
                ),
                centerTitle: true,
            ),

            body: Container(
                margin: EdgeInsets.only(top: deviceWidth * 0.03),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Center(
                            child: Image.asset('asset/expenselogo.png', height: deviceHeight * 0.23, width: deviceHeight * 0.23,),
                        ),

                        SizedBox(height: deviceHeight * 0.03),

                        Padding(
                            padding: EdgeInsets.only(left: deviceWidth * 0.05),
                            child: Text('Enter Amount', style: AppWidget.headlineTextStyle(deviceWidth*0.055)),
                        ),

                        SizedBox(height: deviceWidth * 0.03),

                        Container(
                            width: deviceWidth,
                            margin: EdgeInsets.only(left: deviceWidth * 0.05, right: deviceWidth * 0.05),
                            padding: EdgeInsets.symmetric(horizontal: deviceWidth*0.04),
                            
                            decoration: BoxDecoration(
                                color: Color(0xffececf8),
                                borderRadius: BorderRadius.circular(10),
                            ),

                            child: TextField(
                                controller: amountController,
                                
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Amount',
                                    hintStyle: TextStyle(
                                        color: Colors.black54,
                                        fontSize: deviceWidth*0.043,
                                        fontWeight: FontWeight.w600,
                                    ),
                                ),
                            ),
                        ),

                        SizedBox(height: deviceWidth * 0.06),

                        Padding(
                            padding: EdgeInsets.only(left: deviceWidth * 0.05),
                            child: Text('Select Category', style: AppWidget.headlineTextStyle(deviceWidth*0.055)),
                        ),

                        SizedBox(height: deviceWidth * 0.03),

                        Container(
                            width: deviceWidth,
                            margin: EdgeInsets.symmetric(horizontal: deviceWidth*0.05),
                            padding: EdgeInsets.symmetric(horizontal: deviceWidth*0.04),

                            decoration: BoxDecoration(
                                color: Color(0xffececf8),
                                borderRadius: BorderRadius.circular(10),
                            ),

                            child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                    items: quizItems.map((item) => DropdownMenuItem(
                                        value: item,
                                        child: Text(item, style: TextStyle(color: Colors.black, fontSize: deviceWidth*0.043)),
                                    )).toList(),

                                    onChanged: ((value) => setState(() {
                                        this.value = value;
                                    })),

                                    dropdownColor: Colors.white,
                                    hint: Text('Select Category', style: TextStyle(color: Colors.black54, fontSize: deviceWidth*0.043)),
                                    iconSize: deviceWidth*0.1,
                                    icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                                    value: value,
                                ),
                            ),
                        ),

                        SizedBox(height: deviceWidth * 0.07),

                        Padding(
                            padding: EdgeInsets.only(left: deviceWidth * 0.05),
                            child: Row(
                                children: [
                                    GestureDetector(
                                        onTap: () {
                                            _selectedDate(context);
                                        },

                                        child: Material(
                                            elevation: 1.0,
                                            borderRadius: BorderRadius.circular(60),
                                            
                                            child: Container(
                                                padding: EdgeInsets.all(deviceWidth*0.03),
                                                decoration: BoxDecoration(color: Color(0xffee6856), borderRadius: BorderRadius.circular(12)),
                                                child: Icon(Icons.calendar_today, color: Colors.white),
                                            ),
                                        ),
                                    ),

                                    SizedBox(width: deviceWidth * 0.03),

                                    Text(
                                        formattedDate,
                                        style: AppWidget.headlineTextStyle(22.0),
                                    ),
                                ],
                            ),
                        ),

                        SizedBox(height: deviceWidth * 0.1),

                        GestureDetector(
                            onTap: () async {
                                Map<String, dynamic> addExpense = {
                                    'Amount': amountController.text,
                                    'Category': value,
                                    'Date': formattedDate,
                                };

                                await DatabaseMethods().addUserExpense(addExpense, id!);

                                setState(() {
                                    amountController.text = ""; // so that user can add another expense
                                });

                                ScaffoldMessenger.of(context).showSnackBar(
                                    ScaffoldText.show('Expenes Added Successfully!', Colors.green, context),
                                );
                            },

                            child: Center(
                                child: Container(
                                    height: deviceHeight * 0.053,
                                    width: deviceWidth * 0.5,
                            
                                    decoration: BoxDecoration(
                                        color: Color(0xffee6856),
                                        borderRadius: BorderRadius.circular(12),
                                    ),
                            
                                    child: Center(
                                        child: Text('Submit', style: TextStyle(color: Colors.white, fontSize: deviceWidth*0.055, fontWeight: FontWeight.bold)),
                                    ),
                                ),
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}
