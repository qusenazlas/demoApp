import 'package:demoApp/Models/BagItemList.dart';
import 'package:demoApp/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BagItemList>(
      create: (BuildContext context) => BagItemList(),
      child: Consumer<BagItemList>(
        builder: (BuildContext context, provider, child) => MaterialApp(
          home: HomePage(),
        ),
      ),
    );
  }
}
