import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:json_task/controller/home_controller.dart';
import 'package:json_task/model/game_model.dart';
import 'package:json_task/widgets/reusable_text.dart';
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
          padding: const EdgeInsets.all(10),
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
                buildTimelineTile(context, size, data,
                    title: data.events!.first.title.toString(),
                    description: data
                        .events!.first.location!.structuredFormatting!.mainText
                        .toString(),
                    time: '9:00 AM'),
                buildTimelineTile(context, size, data,
                    title: "Event 1",
                    description: "Description",
                    time: '10:00 AM',
                    containerColor: Colors.green),
                buildTimelineTile(context, size, data,
                    title: "Event 2",
                    description: "Description",
                    time: '11:00 AM'),
                buildTimelineTile(context, size, data,
                    title: "Event 3",
                    description: "Description",
                    time: '12:00 PM'),
                buildTimelineTile(context, size, data,
                    title: "Event 4",
                    description: "Description",
                    time: '1:30 PM'),
                buildTimelineTile(context, size, data,
                    title: "Event 4",
                    description: "Description",
                    time: '1:30 PM'),
                buildTimelineTile(context, size, data,
                    title: "Event 5",
                    description: "Description",
                    time: '1:30 PM'),
                buildTimelineTile(context, size, data,
                    title: "Event 6",
                    description: "Description",
                    time: '1:30 PM'),
                buildTimelineTile(context, size, data,
                    title: "Event 7",
                    description: "Description",
                    time: '1:30 PM'),
                buildTimelineTile(context, size, data,
                    title: "Event 8",
                    description: "Description",
                    time: '2:00 PM'),
                buildTimelineTile(context, size, data,
                    title: "Event 9",
                    description: "Description",
                    time: '2.30 PM'),
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
      {required String title, description, time, containerColor}) {
    return TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0.3,
        beforeLineStyle: const LineStyle(color: Colors.grey, thickness: 2),
        afterLineStyle: const LineStyle(color: Colors.grey, thickness: 2),
        indicatorStyle: IndicatorStyle(
          width: 25,
          color: Colors.green,
          iconStyle: IconStyle(
            iconData: Icons.car_crash,
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
                  return StatefulBuilder(builder:
                      (BuildContext context, StateSetter setModelState) {
                    return ListView.builder(
                        itemCount: _homeController.gameData.value.data!.length,
                        itemBuilder: (context, index) {
                          Data data =
                              _homeController.gameData.value.data![index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text("Bjreakfast at 9.00 am")),
                              ),
                              Container(
                                  width: size.width,
                                  height: 200,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                    child: Image.network(
                                      data.photos!.first.toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                              buildTextWidget(
                                  data.description.toString(), Colors.black),
                              buildTextWidget(
                                  data.title.toString(), Colors.black),
                              buildTextWidget(
                                  data.createdAt.toString(), Colors.black),
                              buildTextWidget(data.price.toString(),
                                  Colors.deepOrangeAccent),
                              buildTextWidget(data.countries!.first.toString(),
                                  Colors.black)
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
        startChild: Row(
          children: [
            Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: containerColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(time),
            ),
          ],
        ));
  }

  buildTextWidget(data, Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ReusableText(
        text: data,
        color: color,
      ),
    );
  }
}
