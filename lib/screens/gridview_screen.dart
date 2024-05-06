import 'package:flutter/material.dart';
import 'package:frontend/components/Drawer_nav.dart';
import 'package:frontend/controllers/grid_controller.dart';
import 'package:get/get.dart';

class GridviewScreen extends StatefulWidget{
  const GridviewScreen({super.key});

  @override
  State<GridviewScreen> createState() => _GridviewScreenState();
}

class _GridviewScreenState extends State<GridviewScreen> {
  final GridController gridController = Get.put(GridController());

    @override
  void initState() {
    super.initState();
    gridController.loadGrids();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(

      appBar: AppBar(title: const Text("Grid View Builder"),),
      body: Obx((){
        if(gridController.isLoading.value && gridController.gridData.value.isEmpty){
          return const Center(child: CircularProgressIndicator(),);
        }else if(!gridController.isLoading.value && gridController.gridData.value.isEmpty){
          return const Center(child: Text("No data found!"),);
        }else{
          return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),itemCount: gridController.gridData.value.length,itemBuilder: (context, index){
            return Expanded(child: Padding(padding: const EdgeInsets.all(5),child: Card(child: Padding(padding: const EdgeInsets.all(5),child: Text(gridController.gridData.value[index].title!),),),));
          });
        }
      }),
      drawer: const DrawerNav());
  }
}