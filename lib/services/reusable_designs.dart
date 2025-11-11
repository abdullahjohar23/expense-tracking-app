import 'package:flutter/material.dart';

//* Label
class LabelName extends StatelessWidget {
    final String label;
    
    const LabelName({
        required this.label,
        super.key
    });

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

//* Text Field
class TextFieldDesign extends StatelessWidget {
    final String hintMessage;
    final IconData iconName;
    final TextEditingController controller;

    const TextFieldDesign({
        required this.hintMessage,
        required this.iconName,
        required this.controller,
        super.key
    });

    @override
    Widget build(BuildContext context) {
        final deviceWidth = MediaQuery.of(context).size.width;

        return Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: TextField(
                controller: controller,

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

//* Password Field
class PasswordFieldDesign extends StatefulWidget {
    final bool obsPass;
    final String hintMessage;
    final TextEditingController controller;

    const PasswordFieldDesign({
        required this.obsPass,
        required this.hintMessage,
        required this.controller,
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
                controller: widget.controller,
                
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

//* Snackbar Message
class ScaffoldText {
    static SnackBar show(String message, Color color, BuildContext context) {
        final deviceWidth = MediaQuery.of(context).size.width;

        return SnackBar(
            backgroundColor: color,
            behavior: SnackBarBehavior.floating,
            
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
            ),
            
            content: Text(
                message,
                style: TextStyle(
                    fontSize: deviceWidth * 0.045,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                ),
            ),
            
            duration: const Duration(seconds: 2),
        );
    }
}

//* Profile Info Tile
class ProfileInfoTile extends StatelessWidget {
    final String text;
    final IconData prefixicon;
    final IconData? suffixicon;
    final VoidCallback? onTap;
    final Widget? navigateTo;

    const ProfileInfoTile({
        required this.text,
        required this.prefixicon,
        this.suffixicon,
        this.onTap,
        this.navigateTo,
        super.key
    });

    @override
    Widget build(BuildContext context) {
        final deviceWidth = MediaQuery.of(context).size.width;
        final deviceHeight = MediaQuery.of(context).size.height;

        return GestureDetector(
            onTap: () {
                // If custom onTap is given, use that
                if (onTap != null) {
                    onTap!();
                }
                
                // Otherwise, navigate if navigateTo is provided
                else if (navigateTo != null) {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 200), // speed of animation
                            reverseTransitionDuration: Duration(milliseconds: 200), // backward
                            pageBuilder: (context, animation, secondaryAnimation) => navigateTo!,
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                const begin = Offset(1.0, 0.0); // start from right side
                                const end = Offset.zero; // end at center
                                final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeInOut));

                                return SlideTransition(
                                    position: animation.drive(tween),
                                    child: child,
                                );
                            },
                        ),
                    );
                }
            },
            
            child: Container(
                height: deviceHeight * 0.06,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.04),
                margin: EdgeInsets.only(bottom: deviceWidth * 0.05),
                
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xffee6856),
                ),
            
                child: Row(
                    children: [
                        Icon(prefixicon, color: Colors.white, size: deviceWidth * 0.08),
                    
                        SizedBox(width: deviceWidth * 0.04),
                    
                        Expanded(
                            child: Text(
                                text,
                                style: TextStyle(fontSize: deviceWidth * 0.05, color: Colors.white, fontWeight: FontWeight.w500),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                            ),
                        ),
                    
                        if (suffixicon != null) ...[
                            SizedBox(width: deviceWidth * 0.02),
                            
                            Icon(suffixicon, color: Colors.white, size: deviceWidth * 0.08),
                        ],
                    ],
                ),
            ),
        );
    }
}
