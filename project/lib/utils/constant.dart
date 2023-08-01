import 'package:flutter/material.dart';

void pushScreen(BuildContext context, dynamic route){
  Navigator.push(context, MaterialPageRoute(builder: (context) => route));
}

void backScreen(BuildContext context, dynamic route){
  Navigator.pop(context);
}

void pusReplaceScreen(BuildContext context, dynamic route){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> route));
}