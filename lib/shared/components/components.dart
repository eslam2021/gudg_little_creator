import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  double radius = 18.0,
  bool isUpperCase = true,
   double? width,
  double? hight,
  required Color background,
  required Color textDD,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: hight,
      child: MaterialButton(
        onPressed: function(),
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: textDD,
            fontWeight: FontWeight.bold,
            fontFamily: 'ElMessiri',
          ),
        ),
        color: Colors.black.withOpacity(0.2),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,

      ),
    );







Widget defaultFormField({
  TextEditingController? controller,
   TextInputType? type,
  Function(String title)? onSubmit,
  Function(String title)? onChange,
   Function(String? title)? validate,
  bool isPassword = false,
  int? Maxlength,
   String? label,
  String? hint,
   IconData? prefix,
  Function()? suffixPressed,
  IconData? suffix,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      maxLength: Maxlength,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      validator: (T) => validate!(T),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint ,
        labelStyle: TextStyle(
          color: Color(0xff951a49),
          fontFamily: 'ElMessiri',
          fontWeight: FontWeight.bold,
        ),
        prefixIcon: Icon(
          prefix,
          color: Color(0xff951a49),
        ),

        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(suffix, color: Color(0xff951a49)),
        )
            : null,
        enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Color(0xff951a49), width: 3.0), borderRadius: BorderRadius.circular(18.0), ),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff951a49), width: 3.0),borderRadius: BorderRadius.circular(18.0),),
      ),
    );

class IconItem {
  final String urlImage;
  const IconItem({required this.urlImage});
}
