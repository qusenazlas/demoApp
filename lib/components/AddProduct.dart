import 'package:demoApp/Models/BagItemList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatefulWidget {
  Map<String, dynamic> _product;
  bool _isShow;
  AddProduct(this._product, this._isShow);
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  int itemCount = 1;
  Map<String, dynamic> addItem = {};
  List<Map<String, dynamic>> addItemList = [];
  @override
  Widget build(BuildContext context) {
    BagItemList itemList = Provider.of<BagItemList>(context);
    bool isShow = widget._isShow;
    return isShow
        ? Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                color: Color.fromRGBO(198, 198, 198, 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 50, right: 20, top: 60, bottom: 30),
                        child: Text(
                          widget._product['name'],
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    height: MediaQuery.of(context).size.height / 2.8,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                            fit: BoxFit.fitWidth,
                            image: NetworkImage(widget._product['imageLink']))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 50,
                          right: 20,
                          top: 10,
                        ),
                        child: Text(
                          'Price ' +
                              widget._product['price'].toString() +
                              ' Bath',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 50,
                          right: 20,
                        ),
                        child: Text(
                          'Type ' + widget._product['type'],
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 50,
                          right: 20,
                        ),
                        child: Text(
                          'For ' + widget._product['gender'],
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    width: MediaQuery.of(context).size.width - 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 25,
                          height: 35,
                          child: RaisedButton(
                            color: Color.fromRGBO(232, 232, 232, 1),
                            elevation: 0,
                            onPressed: () {
                              setState(() {
                                if (itemCount > 1) {
                                  itemCount -= 1;
                                }
                              });
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20)),
                            ),
                            child: Text(
                              '-',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromRGBO(108, 108, 108, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 35,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              itemCount.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromRGBO(108, 108, 108, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 25,
                          height: 35,
                          child: RaisedButton(
                            color: Color.fromRGBO(232, 232, 232, 1),
                            elevation: 0,
                            onPressed: () {
                              setState(() {
                                itemCount += 1;
                              });
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                            ),
                            child: Text(
                              '+',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color.fromRGBO(108, 108, 108, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 9),
                          width: 140,
                          height: 35,
                          child: RaisedButton(
                            elevation: 0,
                            color: Colors.white,
                            onPressed: () {
                              setState(() {
                                addItem = {
                                  'name': widget._product['name'],
                                  'price': widget._product['price'],
                                  'totalPrice':
                                      widget._product['price'] * itemCount,
                                  'count': itemCount,
                                  'imageLink': widget._product['imageLink']
                                };

                                if (addItemList.isEmpty) {
                                  addItemList.add(addItem);
                                } else {
                                  addItemList.forEach((element) {
                                    if (element != addItem) {
                                      addItemList.add(addItem);
                                    }
                                  });
                                }
                                itemList.setItemList(addItemList);
                                print(itemList.itemList);
                              });
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Text(
                              'Add to cart',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color.fromRGBO(108, 108, 108, 1),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                right: 20,
                top: 30,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      widget._isShow = false;
                    });
                  },
                  child: Icon(
                    Icons.close_outlined,
                    color: Color.fromRGBO(255, 130, 130, 1),
                    size: 25,
                  ),
                ))
          ])
        : Padding(padding: EdgeInsets.all(0));
  }
}
