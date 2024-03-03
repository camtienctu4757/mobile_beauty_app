import 'dart:ffi';

import 'package:flutter/material.dart';

class Service {
  const Service(
      {required this.id,
      required this.name,
      required this.description,
      required this.categoryID,
      required this.price,
      required this.shopID,
      required this.time,
      required this.img
      });
  final int id;
  final String name;
  final String description;
  final int categoryID;
  final int price;
  final int shopID;
  final double time;
  final String img;
}
