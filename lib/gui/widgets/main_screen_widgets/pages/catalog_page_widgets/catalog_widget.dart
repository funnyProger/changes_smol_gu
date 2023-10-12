import 'package:changes_smol_gu/core/models/catalog_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'catalog_item/item_widget.dart';


class CatalogList extends StatelessWidget {
  const CatalogList({super.key});



  @override
  Widget build(BuildContext context) {
    if(context.watch<CatalogModel>().getCatalogList().isEmpty) {
      return Container(
        decoration: const BoxDecoration(
            color: Colors.black87
        ),
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.indigoAccent,
          ),
        ),
      );
    } else {
      return Container(
        decoration: const BoxDecoration(
            color: Colors.black87
        ),
        padding: const EdgeInsets.only(left: 15, right: 15, top: 12),
        child: ListView.builder(
            itemCount: context.read<CatalogModel>().getCatalogList().length + 1,
            itemBuilder: (context, index) {
              if(index == 0) {
                return Column(
                  children: [
                    const SizedBox(height: 55),
                    Item(petition: context.read<CatalogModel>()
                        .getCatalogList()[index])
                  ],
                );
              }
              if(index == context.read<CatalogModel>().getCatalogList().length) {
                return const SizedBox(height: 40);
              } else {
                return Item(petition: context.read<CatalogModel>()
                    .getCatalogList()[index]);
              }
            }
        ),
      );
    }
  }
}