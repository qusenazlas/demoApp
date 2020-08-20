import 'package:demoApp/Models/BagItemList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BagItem extends StatefulWidget {
  @override
  _BagItemState createState() => _BagItemState();
}

class _BagItemState extends State<BagItem> {
  @override
  Widget build(BuildContext context) {
    BagItemList itemList = Provider.of<BagItemList>(context);
    return ListView.builder(
        itemCount: itemList.itemList == null ? 0 : itemList.itemList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(itemList.itemList[index]["imageLink"]),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
            height: 200,
            child: GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                itemList.itemList.removeAt(index);
                                itemList.setItemList(itemList.itemList);
                              });
                            },
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Color.fromRGBO(255, 160, 160, 1),
                              child: Icon(
                                Icons.close_outlined,
                                size: 10,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: GestureDetector(
                            onTap: () {
                              if (itemList.itemList[index]['count'] > 1) {
                                itemList.itemList[index]['count']--;
                                itemList.itemList[index]['totalPrice'] =
                                    itemList.itemList[index]['price'] *
                                        itemList.itemList[index]['count'];
                                itemList.setItemList(itemList.itemList);
                              } else {
                                itemList.itemList.removeAt(index);
                                itemList.setItemList(itemList.itemList);
                              }
                            },
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Color.fromRGBO(255, 191, 136, 1),
                              child: Icon(
                                Icons.remove,
                                size: 10,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                itemList.itemList[index]['count']++;
                                itemList.itemList[index]['totalPrice'] =
                                    itemList.itemList[index]['price'] *
                                        itemList.itemList[index]['count'];
                                itemList.setItemList(itemList.itemList);
                              });
                            },
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Color.fromRGBO(129, 232, 177, 1),
                              child: Icon(
                                Icons.add,
                                size: 10,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Color.fromRGBO(255, 255, 255, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ListTile(
                          title: Text(
                            itemList.itemList[index]["name"],
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(100, 98, 98, 1),
                                backgroundColor:
                                    Color.fromRGBO(255, 255, 255, .5)),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                itemList.itemList[index]["price"].toString() +
                                    ' Bath',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(100, 98, 98, .8),
                                    backgroundColor:
                                        Color.fromRGBO(255, 255, 255, .5)),
                              ),
                              Text(
                                'Count ' +
                                    itemList.itemList[index]["count"]
                                        .toString(),
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(100, 98, 98, .8),
                                    backgroundColor:
                                        Color.fromRGBO(255, 255, 255, .5)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 0,
                    margin: EdgeInsets.all(10),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
