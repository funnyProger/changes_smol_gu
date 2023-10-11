import 'package:changes_smol_gu/core/controllers/json_controller.dart';
import 'package:changes_smol_gu/data/entities/petition.dart';
import 'package:flutter/material.dart';
import 'catalog_item/item_widget.dart';


class CatalogList extends StatefulWidget {
  const CatalogList({super.key});

  @override
  State<CatalogList> createState() => _CatalogListState();
}


class _CatalogListState extends State<CatalogList> {
  final JsonController _jsonController = JsonController();
  late final Future<List<Petition>> _jsonDataFromFuture;


  @override
  void initState() {
    _jsonDataFromFuture = _jsonController.getJsonData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.black87
      ),
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: FutureBuilder(
          future: _jsonDataFromFuture,
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length + 1,
                  itemBuilder: (context, index) {
                    if(index == snapshot.data!.length) {
                      return const SizedBox(height: 40);
                    } else {
                      return Item(petition: snapshot.data![index]);
                    }
                  }
              );
            } else if(snapshot.hasError) {
              return const Center(
                child: Text(
                    'Ошибка загрузки летны :(',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    textDirection: TextDirection.ltr,
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.indigoAccent,
              ),
            );
          }
      ),
    );
  }
}