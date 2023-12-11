import 'package:changes_smol_gu/core/controllers/json_controller.dart';
import 'package:changes_smol_gu/data/entities/petition.dart';
import 'package:flutter/foundation.dart';

class Catalog {
  Catalog._();
  static final Catalog _instance = Catalog._();
  static List<Petition> _catalogList = [];
  static final JsonController _jsonController = JsonController();


  static initCatalogList() async {
    try {
      _catalogList = await _jsonController.getCatalogData();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }


  static getInstance() {
    return _instance;
  }


  List<Petition> getList() {
    return [..._catalogList];
  }
}