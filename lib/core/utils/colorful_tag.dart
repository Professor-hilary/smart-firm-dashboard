import 'package:flutter/material.dart';

Color getRoleColor(String? role) {
  if (role == "Doctor") {
    return Colors.green;
  } else if (role == "Software Architect") {
    return Colors.red;
  } else if (role == "Software Engineer") {
    return Colors.blueAccent;
  } else if (role == "Premium") {
    return Colors.amberAccent;
  } else if (role == "Plus") {
    return Colors.cyanAccent;
  } else if (role == "Business Analyst") {
    return Colors.deepPurpleAccent;
  } else if (role == "Standard") {
    return Colors.indigoAccent;
  }
  return Colors.black38;
}
