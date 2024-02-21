import 'package:beauty_app/widgets/textfield_input.dart';
import 'package:flutter/material.dart';

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
            Text('LogoApp'),
            SizedBox(width: 20,),
            Expanded(
              flex: 2,
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 0.5, horizontal: 20),
                    hintText: 'Bạn đang tìm gì ?',
                    hintStyle:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search),
                      color: Theme.of(context).colorScheme.primary,
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
              flex: 2,
              child: GridView(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 4 / 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                children: const [
                  Text('1'),
                  Text('2'),
                  Text('3'),
                  Text('4'),
                  Text('5'),
                  Text('6'),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Hot service'),
                    InkWell(
                      child: Image.asset(
                        'lib/assets/images/icon/filter.png',
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              flex: 5,
              child: ListView.builder(
                itemCount: listText.length,
                itemBuilder: (ctx, index) => ListTile(
                  title: Text(listText[index]),
                ),
              ),
            ),
            BottomNavigationBar(
              selectedItemColor: Theme.of(context).colorScheme.primary,
              unselectedItemColor: Theme.of(context).colorScheme.secondary,
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
