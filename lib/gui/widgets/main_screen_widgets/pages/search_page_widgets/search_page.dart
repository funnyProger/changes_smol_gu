import 'package:changes_smol_gu/core/models/catalog_model.dart';
import 'package:changes_smol_gu/data/entities/petition.dart';
import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/pages/catalog_page_widgets/catalog_item/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});


  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _textEditingController = TextEditingController();
  List<Petition> _searchPetitionsList = [];


  @override
  void dispose() {
    _textEditingController.dispose();
    _searchPetitionsList.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.black87
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 117, left: 13, right: 13),
                alignment: Alignment.center,
                child: TextFormField(
                    controller: _textEditingController,
                    textAlign: TextAlign.justify,
                    cursorOpacityAnimates: true,
                    cursorColor: Colors.white,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding:
                        const EdgeInsets.symmetric(vertical: 12),
                        labelText: 'Search',
                        labelStyle: const TextStyle(color: Colors.grey),
                        floatingLabelAlignment: FloatingLabelAlignment.center,
                        floatingLabelStyle:
                        const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 23,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                            const BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                            const BorderSide(color: Colors.white))
                    ),
                    onChanged: (query) {
                      searchEngine(context, query);
                    }
                ),
              ),
              _textEditingController.value.text.isEmpty ? Container(
                padding: const EdgeInsets.only(top: 293),
                alignment: Alignment.center,
                child: const Text(
                  'Search',
                  style: TextStyle(
                    color: Colors.grey
                  ),
                )
              ): Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 15, right: 13, left: 13),
                    child: ListView.builder(
                        itemCount: _searchPetitionsList.length + 1,
                        itemBuilder: (context, index) {
                          if(index == _searchPetitionsList.length) {
                            return const SizedBox(height: 40);
                          } else {
                            return Item(petition: _searchPetitionsList[index]);
                          }
                        }
                    ),
                  )
              )
            ],
          ),
        )
    );
  }


  void searchEngine(BuildContext context, String query) {
    final suggestions = context.read<CatalogModel>().getCatalogList().where((petition) {
      final petitionTitle = petition.title.toLowerCase();
      final input = query.toLowerCase();
      return petitionTitle.contains(input);
    }).toList();

    setState(() {
      _searchPetitionsList = suggestions;
    });
  }


  Widget f() {
    return Expanded(
      child: ListView.builder(
          itemCount: _searchPetitionsList.length + 1,
          itemBuilder: (context, index) {
            if(index == _searchPetitionsList.length) {
              return const SizedBox(height: 40);
            } else {
              return Item(petition: _searchPetitionsList[index]);
            }
          }
      ),
    );
  }
}