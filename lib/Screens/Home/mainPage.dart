import 'package:book_store/Authentication/firebase_authentication.dart';
import 'package:book_store/Screens/Home/profilePage.dart';
import 'package:book_store/Screens/Home/chatPage.dart';
import 'package:book_store/Screens/Home/explorePage.dart';
import 'package:book_store/Screens/Home/ordersPage.dart';
import 'package:book_store/constantParameters.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'homePage.dart';

class MainPage extends StatefulWidget {
  static String routeName = "/mainScreen";
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    OrdersPage(),
    ExplorePage(),
    ChatPage(),
    ProfilePage()
  ];
  AuthClass authClass = AuthClass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("Flutter Demo"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border_outlined,
                color: Colors.black,
                size: 25,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black,
                size: 25,
              )),
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/originals/b9/33/37/b933376b2af3c1dad244431a9cf64fde.jpg'),
          ),
          SizedBox(
            width: defaultPadding * 0.5,
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: kPrimaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                      radius: 45,
                      backgroundImage: NetworkImage(
                          'https://i.pinimg.com/originals/b9/33/37/b933376b2af3c1dad244431a9cf64fde.jpg')),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    child: Text(
                      'Hi, User',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.info_outline,
                color: Colors.grey[800],
              ),
              title: const Text('About us'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(
                Icons.phone,
                color: Colors.grey[800],
              ),
              title: const Text('Contact Us'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(
                Icons.contact_support_outlined,
                color: Colors.grey[800],
              ),
              title: const Text('FAQs'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(
                Icons.import_contacts_outlined,
                color: Colors.grey[800],
              ),
              title: const Text('Terms & conditions'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(
                Icons.payment,
                color: Colors.grey[800],
              ),
              title: const Text('Payment'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.grey[800],
              ),
              title: const Text('Logout'),
              onTap: () {
                authClass.signOut(context: context);
              },
            ),
          ],
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.home_outlined),
            title: Text('Home'),
            activeColor: kPrimaryColor,
            inactiveColor: kSecondaryColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            title: Text('Order'),
            activeColor: kPrimaryColor,
            inactiveColor: kSecondaryColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.explore_outlined),
            title: Text('Explore'),
            activeColor: kPrimaryColor,
            inactiveColor: kSecondaryColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.chat),
            title: Text(
              'Chat',
            ),
            activeColor: kPrimaryColor,
            inactiveColor: kSecondaryColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person_outline),
            title: Text('Profile'),
            activeColor: kPrimaryColor,
            inactiveColor: kSecondaryColor,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
