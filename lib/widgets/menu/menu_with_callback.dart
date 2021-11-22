import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuWidgetCallBack extends StatelessWidget {
  final String menuName;
  final Function(BuildContext context) callback;
  final IconData icon;

  const MenuWidgetCallBack({
    Key? key,
    required this.callback,
    required this.icon,
    required this.menuName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => callback(context),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            SizedBox(width: 30),
            Text(
              menuName,
              style: GoogleFonts.jetBrainsMono(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            )
          ],
        ),
      ),
    );
  }
}
