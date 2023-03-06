import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:json_task/controller/home_controller.dart';
import 'package:json_task/widgets/reusable_text.dart';

class OnGoingPlanScreen extends StatelessWidget {
   OnGoingPlanScreen({Key? key}) : super(key: key);
   final _homeController=Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: ReusableText(text: "My Plan",color: Colors.cyan,),
        centerTitle: true,
        leading:const Icon(Icons.arrow_back_ios,color: Colors.cyan,),
      ),
      body: Obx((){
        if(_homeController.isLoading.value){
          return const Center(child: CircularProgressIndicator(),);
        }else if(_homeController.gameData.value.data!.isEmpty){
          return Center(child: ReusableText(text: "Data Not Found",),);
        }else{
          return ListView.builder(
            itemCount: _homeController.gameData.value.data!.first.photos!.length,
              itemBuilder: (context,index){
              final photo=_homeController.gameData.value.data!.first.photos![index];
              final data=_homeController.gameData.value.data;
              return Card(
                elevation: 4,
                child: Container(
                  height: 100,
                  width:size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Container(
                       height: 100,
                       width: 100,
                       child: Image.network(photo,fit: BoxFit.cover,),
                     ),
                      Expanded(

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ReusableText(text:_homeController.gameData.value.data![0].description.toString(),maxLines: 2,),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ReusableText(text:_homeController.gameData.value.data!.first.countries.toString(),maxLines: 2,),
                              ),
                            ],
                          )
                      )
                    ],
                  ),
                ),
              );
              }
          );
        }
      }),
    );
  }
}
