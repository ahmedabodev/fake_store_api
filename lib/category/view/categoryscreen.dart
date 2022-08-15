import 'package:fake_api/Home/controlller/home_controller.dart';
import 'package:fake_api/Home/view/descreptionscreen.dart';
import 'package:fake_api/category/controlller/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);
  final Category_Controller  _category_controller =Get.put(Category_Controller());
List<String>name=[
  'jewelery',
  'electronics',
  'men\'s clothing',
  'women\'s clothing',
  ];


  @override
  Widget build(BuildContext context) {
    return GetBuilder<Category_Controller>(builder: ( controller) {
      return  Column(
        children: [
          const SizedBox(height: 15,),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: name.length,
              itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
                child: MaterialButton(onPressed: () {
                  controller.changeCategory(name[index]);
                },
                color: Colors.teal,
                  child: Text(name[index]),
                ),
              );
            },),
          ),
          const SizedBox(height: 15,),

          Expanded(
            child: ListView.builder(
              itemCount: controller.home1.length,
              itemBuilder: (BuildContext context, int index) {
                var item=controller.home1[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Get.to(()=>DescraptionScreen(
                        title: item['title'],
                        count: item['rating']['count'],
                        rate: item['rating']['rate'],
                        descrepition: item['description'],
                        image: item['image'],
                        price: item['price'],
                      ));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(height: 10,),

                            Align(
                                alignment: Alignment.centerLeft,
                                child: Image.network(item['image'].toString(),height: 100,width: 100,fit: BoxFit.contain,)),
                            const SizedBox(width: 20,),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(item['title']),
                                  const SizedBox(height: 15,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        children: [
                                          Text(item['rating']['rate'].toString()),
                                          Icon(Icons.star,color: Colors.orangeAccent,),

                                        ],

                                      ),
                                      Text(item['price'].toString()+'\$'),
                                      Row(
                                        children: [
                                          Text('count:'),
                                          Text(item['rating']['count'].toString()),

                                        ],

                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            )

                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },),
          ),
        ],
      );
    },);
  }
}
