import 'package:flutter/material.dart';
import 'package:frontend/components/Drawer_nav.dart';
import 'package:frontend/controllers/grid_controller.dart';
import 'package:get/get.dart';

class FutureScreen extends StatefulWidget{
  const FutureScreen({super.key});

  @override
  State<FutureScreen> createState() => _FutureScreenState();
}

class _FutureScreenState extends State<FutureScreen> {
  final GridController gridController = Get.put(GridController());
   @override
  Widget build(BuildContext context){
    return Scaffold(

      appBar: AppBar(title: const Text("Future Builder"),),
      body: FutureBuilder(future: gridController.loadStores(), builder: (context, snapshot){
        if(snapshot.hasError){
          return const Text("No Data!");
        }else if(snapshot.hasData){
        return ListView.builder(itemCount: snapshot.data!.length ,itemBuilder: (context, index){
          return Card(child: Text(snapshot.data![index].title!),);
        });
        }else{
          return const Center(child: CircularProgressIndicator(),);
        }
      }),
      drawer: const DrawerNav());
  }
}