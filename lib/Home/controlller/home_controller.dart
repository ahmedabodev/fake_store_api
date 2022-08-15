import 'package:fake_api/Home/model/homemodel.dart';
import 'package:fake_api/dio_helper/dio_helper.dart';
import 'package:get/get.dart';

class Home_Controller extends GetxController{
  Home_Controller(){
    gethomedata();
  }
  int limt=5;
List<homemodel>home=[];
List<dynamic>home1=[];
pagnation(){
  if(limt==20){

  }
  else{
    limt=limt+5;
    gethomedata();
    print('hello wordl'+limt.toString());
  }
  update();
}
  void gethomedata(){
    DioHelper.getData(url: 'products?limit=$limt').then((value) {
      home1=value.data;

      for(int x=0;x<value.data.length;x++){
        home.add(homemodel.fromJson(value.data[x]));

      }
      print(home1);
      update();
    }).catchError((e){
      print(e);
    });
  }
}