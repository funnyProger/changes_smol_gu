import 'package:changes_smol_gu/data/entities/petition.dart';
import 'package:changes_smol_gu/data/singletons/catalog.dart';
import 'package:flutter/foundation.dart';

class CatalogModel extends ChangeNotifier {
  final Catalog _catalogInstance = Catalog.getInstance();


  List<Petition> getCatalogList() {
    return _catalogInstance.getList();
  }
}