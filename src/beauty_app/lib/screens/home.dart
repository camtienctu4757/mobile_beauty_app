import 'package:beauty_app/widgets/catagogy.dart';
import 'package:beauty_app/widgets/service.dart';
import 'package:flutter/material.dart';
import 'package:beauty_app/data/dummy_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() {
    return _homeSCreenState();
  }
}

class _homeSCreenState extends State<HomeScreen> {
  List<String> listText = ['1', '2', '3', '4', '5', '1', '2', '3', '4', '5'];
  int _selectedIndex = 0;
  String screenName = 'HomeScreen';
  @override
  Widget build(context) {
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
        //   if (_selectedIndex == 1) {
        //     screenName = 'AppoitmentScreen';
        //   } else if (_selectedIndex == 2) {
        //     screenName = 'rasaScreen';
        //   } else if (_selectedIndex == 3) {
        //     screenName = 'shopScreen';
        //   } else if (_selectedIndex == 4) {
        //     screenName = 'userScreen';
        //   }
        // });
      });
    }

    // if (screenName == 'HomeScreen') {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => const HomeScreen()),
    //   );
    // } else if (screenName == 'appoitmentScreen') {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => const App()));
    // }

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        title: Row(
          children: [
            Image.asset(
              'lib/assets/images/common/logo.png',
              fit: BoxFit.contain,
              width: 110,
              height: 110,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 2,
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 0.5, horizontal: 20),
                    hintText: 'Bạn đang tìm gì ?',
                    hintStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onTertiary,
                        fontWeight: FontWeight.w600),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search),
                      color: Theme.of(context).colorScheme.onTertiary,
                    ),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.tertiary,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        gapPadding: 20,
                        borderSide: BorderSide.none)),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: GridView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 4 / 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                children: const [
                  Catagogy(
                      Name: "Tóc",
                      image: 'lib/assets/images/common/category/hair.jpg'),
                  Catagogy(
                      Name: "Móng",
                      image: 'lib/assets/images/common/category/nail.jpg'),
                  Catagogy(
                      Name: "Chân Mày",
                      image: 'lib/assets/images/common/category/eyebrown.jpg'),
                  Catagogy(
                      Name: "Spa",
                      image: 'lib/assets/images/common/category/spa.jpg'),
                  Catagogy(
                      Name: "Da",
                      image: 'lib/assets/images/common/category/skin.jpg'),
                  Catagogy(
                      Name: "Môi",
                      image: 'lib/assets/images/common/category/lips.jpg'),
                ],
              ),
            ),
            const Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Hot service',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          IconData(0xf86b, fontFamily: 'MaterialIcons'),
                          color: Color.fromARGB(255, 228, 82, 25),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                color: Theme.of(context).colorScheme.secondary,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        childAspectRatio: 3 / 4),
                    itemCount: DummyDetailservices.length,
                    itemBuilder: (cxt, index) {
                      return ServiceGridItem(
                          serviceItem: DummyDetailservices[index]);
                    }),
              ),
            ),
            BottomNavigationBar(
              selectedItemColor: Theme.of(context).colorScheme.onPrimary,
              unselectedItemColor: Theme.of(context).colorScheme.primary,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month),
                  label: 'Appointment',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.abc_outlined),
                  label: 'Rasa',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_rounded),
                  label: 'My shop',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined),
                  label: 'Profile',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
