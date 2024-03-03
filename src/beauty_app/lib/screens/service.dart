import 'package:beauty_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:beauty_app/models/service.dart';
import 'package:beauty_app/data/dummy_shoplist.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen(
      {super.key, required this.serviceItem, required this.formatCurrent});
  final Service serviceItem;
  final Function formatCurrent;
  Shop? getShop(Service service) {
    for (Shop item in dummy_shop) {
      if (item.id == service.shopID) {
        return item;
      }
    }
    return null;
  }

  @override
  Widget build(context) {
    const TextStyle common = TextStyle(
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      // các thuộc tính khác của TextStyle có thể được thiết lập tại đây
    );
    const TextStyle title = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
    );
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(serviceItem.img, fit: BoxFit.fitWidth)),
            const SizedBox(
              height: 10,
            ),
            Text(
              serviceItem.name,
              style: title.copyWith(color: Colors.black),
            ),
            Text(formatCurrent(serviceItem.price),
                style: title.copyWith(color: Colors.red)),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Mô tả: ",
              style: title,
            ),
            Text(
              serviceItem.description,
              style: common,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    child: Image.asset(
                      getShop(serviceItem)!.shopImg,
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(
                          getShop(serviceItem)!.shopName,
                          style: title.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                        Text(
                          getShop(serviceItem)!.location,
                          style: common,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 90,
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () {}, child: Text("ĐẶT LỊCH",style: title.copyWith(color: Theme.of(context).colorScheme.onPrimary,fontSize: 18),), style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.secondary,padding: EdgeInsets.all(15)),)
        ],
      )),
    );
  }
}
