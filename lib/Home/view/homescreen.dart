import 'package:fake_api/Home/controlller/home_controller.dart';
import 'package:fake_api/Home/view/descreptionscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
final Home_Controller  _home_controller =Get.put(Home_Controller());


   ScrollController Scroll = ScrollController();
   RefreshController _refreshController =
   RefreshController(initialRefresh: false);
   void _onRefresh() async{
     // monitor network fetch
     await Future.delayed(Duration(milliseconds: 1000));
     // if failed,use refreshFailed()

     _home_controller.pagnation();

     _refreshController.refreshCompleted();

   }

   void _onLoading() async{
     // monitor network fetch
     await Future.delayed(Duration(milliseconds: 1000));
     // if failed,use loadFailed(),if no data return,use LoadNodata()
  if(_home_controller.limt==20){
    _refreshController.loadNoData();

  }
  else{
    _home_controller.pagnation();
    _refreshController.loadComplete();
  }

   }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<Home_Controller>(builder: ( controller) {
      return  Container(
        height: MediaQuery.of(context).size.height,
        child: SmartRefresher(
          footer: CustomFooter(

            builder: (BuildContext context, LoadStatus? mode) {
              Widget body;
              if (mode == LoadStatus.loading) {
                body = const CircularProgressIndicator();
              } else if (mode == LoadStatus.idle) {
                body = const Text("");
              } else if (mode == LoadStatus.failed) {
                body = const Text("Load Failed!Click retry!");
              } else if (mode == LoadStatus.canLoading) {
                body = const Text("release to load more");
              } else if (mode == LoadStatus.noMore) {
                body = Center(child: const Text("No more data"));
              } else {
                body = const Text("Load more");
              }
              return SizedBox(
                height: 55.0,
                child: Center(child: body),
              );
            },
          ),

          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          enablePullUp: true,
          enablePullDown: true,
          child: ListView.builder(
            controller: Scroll,
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
                            child: Image.network(controller.home1[index]['image'].toString(),height: 100,width: 100,fit: BoxFit.contain,)),
                       const SizedBox(width: 20,),
                       Expanded(
                         child: Column(
                           children: [
                             Text(controller.home1[index]['title']),
                             const SizedBox(height: 15,),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                               children: [
                               Row(
                                 children: [
                                   Text(controller.home1[index]['rating']['rate'].toString()),
                                   Icon(Icons.star,color: Colors.orangeAccent,),

                                 ],

                               ),
                                 Text(controller.home1[index]['price'].toString()+'\$'),
                                 Row(
                                 children: [
                                   Text('count:'),
                                   Text(controller.home1[index]['rating']['count'].toString()),

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
      );
    },);
  }
}
