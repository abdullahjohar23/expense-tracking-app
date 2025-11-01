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

class PasswordFieldDesign extends StatefulWidget {
    final bool obsPass;
    final String hintMessage;

    const PasswordFieldDesign({
        required this.obsPass,
        required this.hintMessage,
        super.key,
    });

    @override
    State<PasswordFieldDesign> createState() => _PasswordFieldDesignState();
}

class _PasswordFieldDesignState extends State<PasswordFieldDesign> {
    late bool _obscurePassword;

    @override
    void initState() {
        super.initState();
        _obscurePassword = widget.obsPass; // initialize local state
    }

    @override
    Widget build(BuildContext context) {
        final deviceWidth = MediaQuery.of(context).size.width;

        return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
            ),
            
            child: TextField(
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                    border: InputBorder.none,

                    hintText: widget.hintMessage,
                    hintStyle: TextStyle(
                        fontSize: deviceWidth * 0.05,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                    ),
                    
                    prefixIcon: Icon(
                        Icons.lock,
                        size: deviceWidth * 0.07,
                        color: const Color(0xffdf815f),
                    ),
                    
                    suffixIcon: IconButton(
                        icon: Icon(
                            _obscurePassword ? Icons.visibility_off : Icons.visibility,
                            color: const Color(0xffdf815f),
                        ),
                        
                        onPressed: () {
                            setState(() {
                                _obscurePassword = !_obscurePassword;
                            });
                        },
                    ),
                ),
            ),
        );
    }
}
