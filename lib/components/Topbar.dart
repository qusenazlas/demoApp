import 'package:badges/badges.dart';
import 'package:demoApp/main.dart';
import 'package:demoApp/shoppingBag.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demoApp/Models/BagItemList.dart';

class Topbar extends StatefulWidget {
  @override
  _TopbarState createState() => _TopbarState();
}

class _TopbarState extends State<Topbar> {
  @override
  Widget build(BuildContext context) {
    BagItemList itemList = Provider.of<BagItemList>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                },
                child: Image(image: AssetImage('assets/images/menu.png'))),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ShoppingBag()));
                },
                child: Badge(
                    animationDuration: Duration(milliseconds: 100),
                    showBadge: itemList.itemList.length > 0 ? true : false,
                    badgeContent: Text(
                      itemList.itemList.length.toString(),
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    badgeColor: Color.fromRGBO(255, 160, 160, 1),
                    padding: EdgeInsets.all(8.5),
                    elevation: 0,
                    child: Image(
                        image: AssetImage('assets/images/shoppingBag.png')))),
          )
        ],
      ),
    );
  }
}
