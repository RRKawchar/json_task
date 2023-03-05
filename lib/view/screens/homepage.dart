// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rrk_json_demo/controller/home_controller.dart';
// import 'package:rrk_json_demo/model/game_model.dart';
// import 'package:timeline_tile/timeline_tile.dart';
//
// class HomePage extends StatelessWidget {
//   HomePage({Key? key}) : super(key: key);
//   final homeController = Get.put(HomeController());
//
//   @override
//   Widget build(BuildContext context) {
//     final size=MediaQuery.of(context).size;
//     return Scaffold(
//       body: Obx(() {
//         if (homeController.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (homeController.gameData.value.data!.isEmpty) {
//           return const Center(
//             child: Text('No Data Found!'),
//           );
//         } else {
//           return ListView.separated(
//             itemCount: homeController.gameData.value.data!.length,
//             itemBuilder: (context, index) {
//               Data data = homeController.gameData.value.data![index];
//               return Container(
//                 alignment: Alignment.centerLeft,
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 70,
//                       child: ListView.builder(
//                         shrinkWrap: true,
//                         physics: const BouncingScrollPhysics(),
//                         scrollDirection: Axis.horizontal,
//                         itemCount: data.days!.length,
//                         itemBuilder: (context, index) => Container(
//                           height: 50,
//                           width:120 ,
//                           child: Card(
//                             elevation: 4,
//                             child: Center(
//                               child: Container(
//
//                                 height: 50,
//                                 width: 100,
//                                 child:Center(child: Text("Days ${data.days![index].number}")),
//                               ),
//                             ),
//                           )
//
//                           ,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//
//                     const Text("8.00 am"),
//                     ListView.builder(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemCount: 10,
//                       itemBuilder: (context, index){
//
//                         return TimelineTile(
//                           alignment: TimelineAlign.manual,
//                           lineXY: 0.3,
//                           isFirst: true,
//                           isLast: true,
//                           indicatorStyle:  IndicatorStyle(
//                             width: 20,
//                             color: Colors.purple,
//                             iconStyle: IconStyle(
//                               iconData: Icons.check,
//                               color: Colors.white,
//                             ),
//                           ),
//                           endChild: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Card(
//
//                                 child: Container(
//                                     height: 50,
//                                     width: 150,
//                                     child: const Text('Event 1'))),
//                           ),
//                           startChild: const Padding(
//                             padding: EdgeInsets.all(8.0),
//                             child: Text('9:00 AM'),
//                           ),
//
//                         );
//                       }
//                     ),
//                   ],
//                 ),
//               );
//             },
//             separatorBuilder: (context, index) => const SizedBox(height: 10),
//           );
//         }
//       }),
//     );
//   }
// }
//
// class _IndicatorExample extends StatelessWidget {
//   const _IndicatorExample({Key? key, required this.number}) : super(key: key);
//
//   final String number;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         border: Border.fromBorderSide(
//           BorderSide(
//             color: Colors.white.withOpacity(0.2),
//             width: 4,
//           ),
//         ),
//       ),
//       child: Center(
//         child: Text(
//           number,
//           style: const TextStyle(fontSize: 30),
//         ),
//       ),
//     );
//   }
// }
//
// class _RowExample extends StatelessWidget {
//   const _RowExample({Key? key, required this.data}) : super(key: key);
//
//   final Data data;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Row(
//         children: <Widget>[
//           Expanded(
//             child: Text(
//               data.days!.first.toString(),
//               style:const TextStyle(
//                 fontSize: 18
//               ),
//             ),
//           ),
//           const Icon(
//             Icons.navigate_next,
//             color: Colors.white,
//             size: 26,
//           ),
//         ],
//       ),
//     );
//   }
// }