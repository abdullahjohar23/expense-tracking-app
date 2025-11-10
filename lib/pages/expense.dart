import 'package:expense_tracking/services/support_widget.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class ExpensePage extends StatefulWidget {
    const ExpensePage({super.key});

    @override
    State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
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
                margin: EdgeInsets.only(top: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Center(
                            child: Image.asset('asset/expenselogo.png', height: 200, width: 200,),
                        ),

                        SizedBox(height: 24),

                        Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text('Enter Amount', style: AppWidget.headlineTextStyle(20)),
                        ),

                        SizedBox(height: 10),

                        Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            width: deviceWidth,
                            
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
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                    ),
                                ),
                            ),
                        ),

                        SizedBox(height: 24),

                        Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text('Select Category', style: AppWidget.headlineTextStyle(20)),
                        ),

                        SizedBox(height: 10),

                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: deviceWidth,

                            decoration: BoxDecoration(
                                color: Color(0xffececf8),
                                borderRadius: BorderRadius.circular(10),
                            ),

                            child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                    items: quizItems.map((item) => DropdownMenuItem(
                                        value: item,
                                        child: Text(item, style: TextStyle(fontSize: 18, color: Colors.black)),
                                    )).toList(),

                                    onChanged: ((value) => setState(() {
                                        this.value = value;
                                    })),

                                    dropdownColor: Colors.white,
                                    hint: Text('Select Category'),
                                    iconSize: 36,
                                    icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                                    value: value,
                                ),
                            ),
                        ),

                        SizedBox(height: 30),

                        Padding(
                            padding: EdgeInsets.only(left: 20),
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
                                                padding: EdgeInsets.all(8.0),
                                                decoration: BoxDecoration(color: Color(0xffee6856), borderRadius: BorderRadius.circular(12)),
                                                child: Icon(Icons.calendar_today, color: Colors.white),
                                            ),
                                        ),
                                    ),

                                    SizedBox(width: 10),

                                    Text(
                                        formattedDate,
                                        style: AppWidget.headlineTextStyle(22.0),
                                    ),
                                ],
                            ),
                        ),

                        SizedBox(height: 30),

                        Center(
                            child: Container(
                                height: 50,
                                width: 200,

                                decoration: BoxDecoration(
                                    color: Color(0xffee6856),
                                    borderRadius: BorderRadius.circular(12),
                                ),

                                child: Center(
                                    child: Text('Submit', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                                ),
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}
