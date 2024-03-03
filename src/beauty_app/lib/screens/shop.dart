import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});
  @override
  State<ShopScreen> createState() {
    return _ShopScreenState();
  }
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(''),
          Text(''),
          OutlinedButton(onPressed: (){}, child: Text(''))
        ],
      ),
    );
  }
}
