import 'package:beauty_app/models/service.dart';
import 'package:beauty_app/screens/service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ServiceGridItem extends StatelessWidget {
  ServiceGridItem({super.key, required this.serviceItem});
  Service serviceItem;

  void _openService(BuildContext context, Service service) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => ServiceScreen(serviceItem: service, formatCurrent:formatCurrency)));
  }

  String formatCurrency(int amount) {
    final formatter = NumberFormat.currency(
      locale: 'vi_VN', // Use Vietnamese locale for VND symbol
      symbol: '₫', // VND symbol
      decimalDigits: 0, // No decimal for VND
    );
    return formatter.format(amount);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _openService(context, serviceItem);
      },
      child: Container(
        color:Colors.white,
        padding: EdgeInsets.all(5),
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              serviceItem.img,
              fit: BoxFit.cover,
              width: 200,
              height: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              serviceItem.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            formatCurrency(serviceItem.price),
            style:
                TextStyle(color: Colors.red[600], fontWeight: FontWeight.w600),
          )
        ]),
      ),
    );
  }
}
