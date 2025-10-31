import 'package:flutter/material.dart';

class LabelName extends StatelessWidget {
    final String label;
    
    const LabelName({
        required this.label,
        super.key});

    @override
    Widget build(BuildContext context) {
        final deviceWidth = MediaQuery.of(context).size.width;

        return Text(
            label,
            style: TextStyle(
                color: Colors.white,
                fontSize: deviceWidth * 0.06,
                fontWeight: FontWeight.w500,
            ),
        );
    }
}

class TextFieldDesign extends StatelessWidget {
    final String hintMessage;
    final IconData iconName;

    const TextFieldDesign({
        required this.hintMessage,
        required this.iconName,
        super.key
    });

    @override
    Widget build(BuildContext context) {
        final deviceWidth = MediaQuery.of(context).size.width;

        return Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    
                    hintText: hintMessage,
                    hintStyle: TextStyle(
                        fontSize: deviceWidth * 0.05,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                    ),
                    
                    prefixIcon: Icon(
                        iconName,
                        size: deviceWidth * 0.07,
                        color: Color(0xffdf815f),
                    ),
                ),
            ),
        );
    }
}
