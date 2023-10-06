import 'package:flutter/material.dart';
import 'package:untitled/components/my_text.dart';
class SavedMoneyScreen extends StatelessWidget {
  double used ;
  double balance ;
  SavedMoneyScreen({required this.balance,required this.used,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color(0xffffffff),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, bottom:30 ,right: 15,left: 15),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(image: AssetImage('assets/money tree.png')),
                const SizedBox(height: 20,),
                MyText(size: 30, color: Colors.black, isBold: true ,text: 'Congratulations'),
                const SizedBox(height: 30,),
                MyText(size: 20, color: Colors.black, isBold: false ,text: 'this month you have saved'),
                const SizedBox(height: 30,),
                Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.transparent,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 22,top: 10,bottom: 10),
                    child: Row(
                      children: [
                        const Image(
                            image:
                            AssetImage('assets/saved.png'),height: 60,width: 60),
                        MyText(
                            size: 20,
                            color: Colors.black,
                            isBold: true,
                            text:(balance-used).toString() )
                      ],
                    ),
                  ),
                ),

          ]),
        ),
      ),
    );
  }
}
