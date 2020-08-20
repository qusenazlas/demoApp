import 'package:demoApp/components/AddProduct.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Map<String, dynamic> productData = {};
  bool isShowAddItem = false;
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('assets/json/productList.json'),
              builder: (context, snapshot) {
                var products = jsonDecode(snapshot.data);
                return ListView.builder(
                    itemCount:
                        products == null ? 0 : products['productList'].length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(
                            top: 10, bottom: 10, left: 20, right: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(
                                products['productList'][index]["imageLink"]),
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        height: 200,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isShowAddItem = true;
                              productData = products['productList'][index];
                            });
                          },
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color.fromRGBO(255, 255, 255, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ListTile(
                                  title: Text(
                                    products['productList'][index]["name"],
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
                                        products['productList'][index]["price"]
                                                .toString() +
                                            ' Bath',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Color.fromRGBO(100, 98, 98, .8),
                                            backgroundColor: Color.fromRGBO(
                                                255, 255, 255, .5)),
                                      ),
                                      Text(
                                        products['productList'][index]["type"],
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Color.fromRGBO(100, 98, 98, .8),
                                            backgroundColor: Color.fromRGBO(
                                                255, 255, 255, .5)),
                                      ),
                                      Text(
                                        products['productList'][index]
                                            ["gender"],
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Color.fromRGBO(100, 98, 98, .8),
                                            backgroundColor: Color.fromRGBO(
                                                255, 255, 255, .5)),
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
                        ),
                      );
                    });
              }),
        ),

        // toggle add item view
        isShowAddItem
            ? Positioned(
                bottom: 0,
                child: Container(
                  child: AddProduct(productData, isShowAddItem),
                ),
              )
            : Padding(padding: EdgeInsets.all(0))
      ],
    );
  }
}
