import 'package:flutter/material.dart';

class Catagogy extends StatelessWidget {
  const Catagogy({super.key, required this.Name, required this.image});
  final String image;
  final String Name;
  @override
  Widget build(context) {
    return Container(
      width: 20,
      height: 20,
      child: InkWell(borderRadius: BorderRadius.all(Radius.circular(50))),
    );
  }
}
