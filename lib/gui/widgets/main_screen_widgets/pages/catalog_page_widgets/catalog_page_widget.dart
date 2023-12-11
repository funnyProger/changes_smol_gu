import 'package:changes_smol_gu/core/models/catalog_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../data/singletons/catalog.dart';
import 'catalog_item/item_widget.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});


  @override
  State<CatalogPage> createState() => _CatalogPageState();
}


class _CatalogPageState extends State<CatalogPage> {

  @override
  void initState() {
    Catalog.initCatalogList();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    if(context.watch<CatalogModel>().getCatalogList().isNotEmpty) {
      return Container(
          padding: const EdgeInsets.only(left: 5, right: 5),
          decoration: const BoxDecoration(
            color: Colors.black87,
          ),
          child:ListView.builder(
              itemCount: context.read<CatalogModel>().getCatalogList().length + 1,
              itemBuilder: (context, index) {
                if(index == context.read<CatalogModel>().getCatalogList().length) {
                  return const SizedBox(height: 75);
                } else {
                  return Item(petition: context.read<CatalogModel>()
                      .getCatalogList()[index]);
                }
              }
          )
      );
    } else {
      return Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: Colors.black87
        ),
        child: const CircularProgressIndicator(),
      );
    }
  }
}