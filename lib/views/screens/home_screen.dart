import 'package:flutter/material.dart';
import 'package:nest_reels/constants.dart';
import 'package:nest_reels/views/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIdx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (idx){
          setState(() {
            pageIdx = idx;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: nestBlue,
        selectedFontSize: 16,
        unselectedItemColor: nestBlue,
        unselectedFontSize: 14,
        currentIndex: pageIdx,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 25,),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 25,),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: CustomIcon(),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_fire_department, size: 25,),
              label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 25,),
              label: 'Profile'),
        ],
      ),
      body: pages[pageIdx],
    );
  }
}

