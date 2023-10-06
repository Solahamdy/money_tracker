import 'package:flutter/material.dart';
import 'package:untitled/components/my_text.dart';
class ContentsRow extends StatelessWidget {
  String image ;
  String product ;
  double price;


  ContentsRow({super.key, required this.image, required this.product, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xfff6f7fb),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ]
            ),
            child: Center(child: Image(
              image: AssetImage(image),width: 25,height: 25,)),
          ),
          const SizedBox(width: 20,),
          MyText(size:18 , color: Colors.black, isBold: true, text: product),
          const Spacer(),
          MyText(size:20 , color: Colors.black, isBold: true, text: '$price'),

        ],
      ),
    );
  }
}
