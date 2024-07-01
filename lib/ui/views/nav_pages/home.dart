import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoesphere/const/app_colors.dart';
import 'package:shoesphere/model/products.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
      child: Container(
        child: GridView.builder(
          itemCount: products.length ,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              childAspectRatio: 0.85

            ),
            itemBuilder: (_,index){
              return Container(
                  padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grayColor.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius:4,
                      offset: Offset(0, 3)
                    )
                  ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(products[index].image.toString(),
                      height: 100,
                    ),
                    Text(

                      products[index].title.toString(),
                     textAlign: TextAlign.center,
                     style: TextStyle(
                       fontSize: 13,
                     ),
                    ),
                    Text('\$${products[index].price.toString()}',style: TextStyle(fontWeight:FontWeight.w600 ,),),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
