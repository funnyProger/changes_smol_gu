import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/controllers/json_controller.dart';
import '../../../../../core/models/user_model.dart';
import 'catalog_item/item_widget.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});


  @override
  State<CatalogPage> createState() => _CatalogPageState();
}


class _CatalogPageState extends State<CatalogPage> {

  @override
  void initState() {
    context.read<UserModel>().updateUserData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: JsonController().getCatalogData(),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          return Container(
              padding: const EdgeInsets.only(left: 5, right: 5),
              decoration: const BoxDecoration(
                color: Colors.black87,
              ),
              child:ListView.builder(
                  itemCount: snapshot.data!.length + 1,
                  itemBuilder: (context, index) {
                    if(index == snapshot.data!.length) {
                      return const SizedBox(height: 75);
                    } else {
                      return Item(petition: snapshot.data![index]);
                    }
                  }
              )
          );
        } else if(snapshot.hasError) {
          return Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.black87
            ),
            child: const Text(
              'Loading error :(',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20
              )
            )
          );
        }
        return Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Colors.black87
            ),
            child: const CircularProgressIndicator()
        );
      }
    );
  }
}