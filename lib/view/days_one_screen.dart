import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:json_task/controller/home_controller.dart';
import 'package:json_task/model/game_model.dart';
import 'package:timeline_tile/timeline_tile.dart';

class DaysOneScreen extends StatelessWidget {
  DaysOneScreen({Key? key}) : super(key: key);
  final _homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Obx(() {
      if (_homeController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (_homeController.gameData.value.data!.isEmpty) {
        return const Center(
          child: Text("Not found data"),
        );
      } else {
        return ListView.separated(
          itemCount: _homeController.gameData.value.data!.length,
          itemBuilder: (context, index) {
            Days data = _homeController.gameData.value.data!.first.days![0];
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 70),
                  child: Text('Wake up at 8.00 am'),
                ),
                const SizedBox(height: 10),
                buildTimelineTile(
                  context,
                  size,
                  data,
                  title: data.events!.first.title.toString(),
                  description: data
                      .events!.first.location!.structuredFormatting!.mainText
                      .toString(),
                  time: '9:00 AM'
                ),
                buildTimelineTile(
                    context,
                    size,
                    data,
                    title:"Event 1",
                    description:"Description",
                    time: '10:00 AM'
                ),
                buildTimelineTile(
                    context,
                    size,
                    data,
                    title:"Event 2",
                    description:"Description",
                    time: '11:00 AM'
                ),
                buildTimelineTile(
                    context,
                    size,
                    data,
                    title:"Event 3",
                    description:"Description",
                    time: '12:00 PM'
                ),
                buildTimelineTile(
                    context,
                    size,
                    data,
                    title:"Event 4",
                    description:"Description",
                    time: '1:30 PM'
                ),
                buildTimelineTile(
                    context,
                    size,
                    data,
                    title:"Event 4",
                    description:"Description",
                    time: '1:30 PM'
                ),
                buildTimelineTile(
                    context,
                    size,
                    data,
                    title:"Event 5",
                    description:"Description",
                    time: '1:30 PM'
                ),
                buildTimelineTile(
                    context,
                    size,
                    data,
                    title:"Event 6",
                    description:"Description",
                    time: '1:30 PM'
                ),
                buildTimelineTile(
                    context,
                    size,
                    data,
                    title:"Event 7",
                    description:"Description",
                    time: '1:30 PM'
                ),
                buildTimelineTile(
                    context,
                    size,
                    data,
                    title:"Event 8",
                    description:"Description",
                    time: '2:00 PM'
                ),
                buildTimelineTile(
                    context,
                    size,
                    data,
                    title:"Event 9",
                    description:"Description",
                    time: '2.30 PM'
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
        );
      }
    });
  }

  TimelineTile buildTimelineTile(BuildContext context, Size size, Days data,
      {required String title, description, time}) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.3,
      isFirst: true,
      isLast: true,
      indicatorStyle: IndicatorStyle(
        width: 20,
        color: Colors.green,
        iconStyle: IconStyle(
          iconData: Icons.check,
          color: Colors.white,
        ),
      ),
      endChild: InkWell(
        onTap: () {
          showModalBottomSheet(
              elevation: 4,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              context: context,
              builder: (BuildContext context) {
                return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setModelState) {
                  return ListView.builder(
                      itemCount: _homeController.gameData.value.data!.length,
                      itemBuilder: (context, index) {
                        Data data = _homeController.gameData.value.data![index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: size.width,
                                height: 200,
                                child: Image.network(
                                  "https://img.freepik.com/premium-photo/beeautiful-purple-flowers-garden-autumn-season_73485-3654.jpg",
                                  fit: BoxFit.cover,
                                )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(data.description.toString()),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(data.title.toString()),
                            )
                          ],
                        );
                      });
                });
              });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
              elevation: 5,
              child: Container(
                  height: 50,
                  width: 150,
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(
                        description,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ))),
        ),
      ),
      startChild:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(time),
      ),
    );
  }
}
