import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BagItemList with ChangeNotifier {
  List<Map<dynamic, dynamic>> itemList = [];
  setItemList(List<Map<dynamic, dynamic>> itemList) {
    this.itemList = itemList;
    notifyListeners();
  }

  setSpecificItem(int index, String key, dynamic value) {
    this.itemList[index][key] = value;
    notifyListeners();
  }
}
