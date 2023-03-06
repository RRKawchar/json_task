import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:json_task/controller/home_controller.dart';
import 'package:json_task/view/days_one_screen.dart';
import 'package:json_task/widgets/reusable_text.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;
  TabController? tabController;

  final _homeController = Get.put(HomeController());

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Obx((){
          if(_homeController.isLoading.value){
            return const Center(child: CircularProgressIndicator(),);
          }else if(_homeController.gameData.value.data!.isEmpty){
            return const Center(child: Text("Loading...."),);
          }else{
            return  Column(
              children: [
                Container(
                  height: 100,
                  width: size.width,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.blue,
                        ),
                      ),
                      Expanded(child: Container(
                        child: Text(_homeController.gameData.value.data!.first
                            .days!.first.events!.first.location!.description
                            .toString()),
                      ))
                    ],
                  ),
                ),
                SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TabBar(
                          onTap: (val) {
                            _currentIndex = val;
                          },
                          labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                          isScrollable: true,
                          controller: tabController,

                          tabs: List.generate(
                              _homeController.gameData.value.data!.first.days!
                                  .length, (index) {
                            final data =
                            _homeController.gameData.value.data!.first.days![index];
                            return Tab(
                                child: Card(
                                  elevation: 4,
                                  child: Container(
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Theme.of(context).backgroundColor,
                                            width: 1)),
                                    child: Center(
                                      child: ReusableText(text: "Days ${data.number}",size: 17,),
                                    ),
                                  ),
                                ));
                          }))
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Expanded(child: TabBarView(
                  controller: tabController,
                  children: [
                    DaysOneScreen(),
                    Text('data2'),
                    Text('data3'),
                  ],
                ))
              ],
            );
          }
        })


      ),
    );
  }
}


