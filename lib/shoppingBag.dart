import 'package:demoApp/Models/BagItemList.dart';
import 'package:demoApp/components/BagItem.dart';
import 'package:demoApp/components/Topbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingBag extends StatefulWidget {
  @override
  _ShoppingBagState createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {
  @override
  Widget build(BuildContext context) {
    BagItemList itemList = Provider.of<BagItemList>(context);
    int totalPrice = 0;
    itemList.itemList.forEach((element) {
      element.forEach((key, value) {
        if (key == 'totalPrice') {
          totalPrice += value;
        }
      });
    });
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Positioned(
            top: 100,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 40,
                      child: Text(
                        'Shopping bag',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(100, 98, 98, 1),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        'Total $totalPrice',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(100, 98, 98, 1),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: BagItem(),
                )
              ],
            ),
          ),
          Positioned(
            top: 20,
            child: Topbar(),
          ),
        ],
      ),
    ));
  }
}
