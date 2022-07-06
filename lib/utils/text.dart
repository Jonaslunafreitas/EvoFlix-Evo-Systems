import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class modified_text extends StatelessWidget{
  final String text;
  final double size;

  const modified_text({super.key, required this.text,  required this.size});
  @override
  Widget build(BuildContext context){
    return Text(
      text, style: GoogleFonts.inter(
      fontSize: size
    ),
    );
  }
}