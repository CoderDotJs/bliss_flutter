import 'dart:convert';
import 'package:frontend/models/grid.dart';
import 'package:frontend/models/listing.dart';
import 'package:frontend/models/store.dart';
import 'package:frontend/utils/api_endpoints.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GridController extends GetxController{
  Rx<RxList<Grid>> gridData = RxList<Grid>([]).obs;
  Rx<RxList<Listing>> listData = RxList<Listing>([]).obs;
  RxInt page = 0.obs;
  RxInt limit = 10.obs;
  RxBool isLoading = false.obs;

  void loadGrids()async{
    try{
      isLoading.value = true;
      final String url = 'https://jsonplaceholder.typicode.com/todos?_start=$page&_limit=$limit';
      http.Response response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        RxList<Grid> list =  RxList<Grid>.from(json.decode(response.body).map((x) => Grid.fromJson(x)));
        gridData.value.addAll(list);
      }else{
        throw response;
      }
    }catch(err){
      Get.snackbar('Error', err.toString());
    } finally {
        isLoading.value = false;
        update();
      }
  }

  Future<RxList<Store>> loadStores ()async{
    const String url = 'https://jsonplaceholder.typicode.com/todos';
      http.Response response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        RxList<Store> list =  RxList<Store>.from(json.decode(response.body).map((x) => Store.fromJson(x)));
       return list;
      }else{
        throw response;
      }
  }

    void loadListings()async{
    try{
      isLoading.value = true;
      const String url = '${ApiEndPoints.baseUrl}/listings';
      http.Response response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        RxList<Listing> list =  RxList<Listing>.from(json.decode(response.body).map((x) => Listing.fromJson(x)));
        listData.value = list;
      }else{
        throw response;
      }
    }catch(err){
      Get.snackbar('Error', err.toString());
    } finally {
        isLoading.value = false;
        update();
      }
  }
}