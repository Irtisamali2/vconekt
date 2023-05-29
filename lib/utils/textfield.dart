// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final Widget prefixIcon;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    this.obscureText = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        labelText: widget.labelText,
        prefixIcon: widget.prefixIcon,
        border: 
       const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black38)
      ),
      enabledBorder:const  OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black38)
      ),
      ),
      validator:(value) {
        if(value!.isEmpty){
          return "Please Enter ${widget.labelText}";
        }
      },
    );
  }
}
