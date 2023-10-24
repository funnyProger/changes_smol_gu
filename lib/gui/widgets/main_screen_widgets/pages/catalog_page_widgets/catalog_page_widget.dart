import 'package:changes_smol_gu/core/models/catalog_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'catalog_item/item_widget.dart';


class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});


  @override
  Widget build(BuildContext context) {
    if(context.watch<CatalogModel>().getCatalogList().isNotEmpty) {
      return Container(
          padding: const EdgeInsets.only(left: 8, right: 8),
          decoration: const BoxDecoration(
            color: Colors.black87,
          ),
          child:ListView.builder(
              itemCount: context.read<CatalogModel>().getCatalogList().length + 1,
              itemBuilder: (context, index) {
                if(index == context.read<CatalogModel>().getCatalogList().length) {
                  return const SizedBox(height: 45);
                } else {
                  return Item(petition: context.read<CatalogModel>()
                      .getCatalogList()[index]);
                }
              }
          )
      );
    } else {
      return Container(
          padding: const EdgeInsets.only(left: 8, right: 8),
          decoration: const BoxDecoration(
            color: Colors.black87,
          ),
          child:ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) {
                if(index == 29) {
                  return const SizedBox(height: 45);
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: AspectRatio(
                      aspectRatio: 16 / 16,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.black38
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 30,
                                  width: 150,
                                  margin: const EdgeInsets.only(
                                      left: 15,
                                      right: 15,
                                      bottom: 260
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white10,
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  margin: const EdgeInsets.only(
                                      right: 15,
                                      left: 15,
                                      bottom: 15
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white10,
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  margin: const EdgeInsets.only(
                                      right: 100,
                                      left: 15,
                                      bottom: 15
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white10,
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                ),
                              ],
                            ),
                          )
                      ),
                    ),
                  );
                }
              }
          )
      );
    }
  }
}