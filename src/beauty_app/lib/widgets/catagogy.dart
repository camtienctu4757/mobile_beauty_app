import 'package:flutter/material.dart';

class Catagogy extends StatelessWidget {
  const Catagogy({super.key, required this.Name, required this.image});
  final String image;
  final String Name;
  @override
  Widget build(context) {
    return Container(
      // padding: EdgeInsets.all(10),
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: Column(children: [
        MouseRegion(
          child: ClipOval(
            child: InkWell(
              child:
                  Image.asset(image, height: 70, width: 70, fit: BoxFit.cover),
              mouseCursor: SystemMouseCursors.click,
            ),
          ),
          cursor: SystemMouseCursors.click,
        ),
        Text(
          Name,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 15),
        )
      ]),
    );
  }
}
