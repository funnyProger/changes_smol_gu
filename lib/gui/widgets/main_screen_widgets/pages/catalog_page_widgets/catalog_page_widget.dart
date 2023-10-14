import 'package:changes_smol_gu/core/models/catalog_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'catalog_item/item_widget.dart';


class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black87,
      ),
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: context.watch<CatalogModel>().getCatalogList().isEmpty ? Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(bottom: 20),
        child: const CircularProgressIndicator(
          color: Colors.indigoAccent,
        ),
      ) : ListView.builder(
          itemCount: context.read<CatalogModel>().getCatalogList().length + 1,
          itemBuilder: (context, index) {
            if(index == context.read<CatalogModel>().getCatalogList().length) {
              return const SizedBox(height: 45);
            } else {
              return Item(petition: context.read<CatalogModel>()
                  .getCatalogList()[index]);
            }
          }
      ),
    );
  }
}