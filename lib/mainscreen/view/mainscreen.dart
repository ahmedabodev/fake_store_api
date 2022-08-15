import 'package:fake_api/mainscreen/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
   MainScreen({Key? key}) : super(key: key);
final Main_Controller _main_controller=Get.put(Main_Controller());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Main_Controller>(builder: ( controller) {
      return Scaffold(
        appBar: AppBar(),
        body: controller.Screens[controller.index],

        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            controller.changebottom(value);
          },
          elevation: 0,
          currentIndex: controller.index,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Category',

            ),
          ],
        ),
      );
    },);
  }
}
