import 'package:flutter/material.dart';

class DescraptionScreen extends StatelessWidget {
   String? image;
String? descrepition;
String? title;
   dynamic rate;
dynamic price;
   dynamic count;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10,),

              Image.network(image!,width: MediaQuery.of(context).size.width,fit: BoxFit.contain,height: 150,),
              const SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Text(rate.toString(),style: const TextStyle(
                        fontSize: 20
                      ),),
                      Icon(Icons.star,color: Colors.orangeAccent,),

                    ],

                  ),
                  Text(price.toString()+'\$',style: const TextStyle(
                      fontSize: 20
                  ),),
                  Row(
                    children: [
                      Text('count:',style: const TextStyle(
                          fontSize: 20
                      ),),
                      Text(count.toString(),style: const TextStyle(
                          fontSize: 20
                      ),),

                    ],

                  ),

                ],
              ),
              const SizedBox(height: 15,),

              Text(title!,style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold
              ),textAlign: TextAlign.center,),
              const SizedBox(height: 15,),
              Text(descrepition!,style:const TextStyle(
                fontSize: 24
              ),),

            ],
          ),
        ),
      ),
    );
  }

   DescraptionScreen({
    this.image,
    this.descrepition,
    this.title,
    this.rate,
    this.price,
    this.count,
  });
}
