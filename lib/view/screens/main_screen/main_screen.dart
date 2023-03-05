import 'package:flutter/material.dart';
import 'package:json_task/view/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  final pages = [
    HomeScreen(),
    const Text("Second Screen"),
    const Text("Favourite Screen")
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: customNavigationBar(),
      body: pages[pageIndex],
    );
  }

  Widget customNavigationBar() {
    return Container(
        height: 80,
        decoration:const BoxDecoration(
          color: Colors.grey,
          borderRadius:  BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  icon: pageIndex == 0
                      ? const Icon(
                    Icons.home_outlined,
                    color: Colors.black,
                    size: 35,
                  )
                      : const Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
                 Text("Home",style: TextStyle(color: pageIndex==0?Colors.black:Colors.white),)
              ],
            ),

            Column(
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  icon: pageIndex == 1
                      ? const Icon(
                    Icons.add_road_outlined,
                    color: Colors.black,
                    size: 35,
                  )
                      : const Icon(
                    Icons.add_road_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
                Text("Ongoing Plan",style: TextStyle(color: pageIndex==1?Colors.black:Colors.white),)
              ],
            ),
            Column(
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 2;
                    });
                  },
                  icon: pageIndex == 2
                      ? const Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 35,
                  )
                      : const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
                Text("Profile",style: TextStyle(color: pageIndex==2?Colors.black:Colors.white),)
              ],
            ),
          ],
        ));
  }
}