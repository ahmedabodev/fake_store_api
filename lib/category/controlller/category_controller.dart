import 'package:fake_api/Home/model/homemodel.dart';
import 'package:fake_api/dio_helper/dio_helper.dart';
import 'package:get/get.dart';

class Category_Controller extends GetxController{
  Category_Controller(){
    gethomedata();
  }
  String category='jewelery';
  List<dynamic>home1=[];
  changeCategory(value){
    category=value;
    gethomedata();
    update();
  }
  void gethomedata(){
    DioHelper.getData(url: 'products/category/$category').then((value) {
      home1=value.data;

      print(home1);
      update();
    }).catchError((e){
      print(e);
    });
  }
}