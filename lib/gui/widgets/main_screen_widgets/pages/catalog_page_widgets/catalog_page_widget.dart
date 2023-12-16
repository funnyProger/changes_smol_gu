import 'dart:async';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import '../../../../../core/controllers/json_controller.dart';
import '../../../../../core/models/user_model.dart';
import '../../../../../data/entities/petition.dart';
import 'catalog_item/item_widget.dart';


class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}



class _CatalogPageState extends State<CatalogPage> {
  List<Petition> _catalogList = [];
  final List<String> _dropDownMenuList = [
    'По имени',
    'По голосам'
  ];
  String? _selectedValue;



  Future getCatalogList(bool getNewList) async {
    await Future.delayed(const Duration(milliseconds: 1200));
    List<Petition> newCatalogPart;
    if(_selectedValue == null) {
      newCatalogPart = await JsonController().getCatalogData('default');
    } else {
      newCatalogPart = await JsonController().getCatalogData(_selectedValue!);
    }

    if(getNewList) {
      _catalogList = newCatalogPart;
    } else {
      for (Petition element in newCatalogPart) {
        _catalogList.add(element);
      }
    }

    print(_catalogList.length);
    setState(() {
      _catalogList;
    });
  }


  @override
  void initState() {
    context.read<UserModel>().updateUserData();
    getCatalogList(true);
    super.initState();
  }


  @override
  void dispose() {
    _catalogList.clear();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              floating: true,
              toolbarHeight: 55,
              actions: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(right: 12, left: 12),
                  child: getDropDownMenu(),
                )
              ],
              forceElevated: innerBoxIsScrolled,
              backgroundColor: Colors.black87,
              bottom: PreferredSize(
                /* Это просто затычка, без которой не
                   работает как нужно SliverAppBar */
                preferredSize: const Size.fromHeight(0.0001),
                child: Container(),
              ),
            ),
          ];
        },
        body: RefreshIndicator(
          color: Colors.white,
          backgroundColor: Colors.black87,
          onRefresh: () async {
            await Future.delayed(const Duration(milliseconds: 1200));
            return await getCatalogList(true);
          },
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          child: _catalogList.isEmpty ? Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Colors.black87
              ),
              child: const CircularProgressIndicator()
          ) :
          Container(
              padding: const EdgeInsets.only(left: 5, right: 5),
              decoration: const BoxDecoration(
                color: Colors.black87,
              ),
              child: ListView.builder(
                  itemCount: _catalogList.length + 1,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    if(index == _catalogList.length) {
                      getCatalogList(false);
                      return Column(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            padding: const EdgeInsets.only(top: 5),
                            child: const LoadingIndicator(
                              indicatorType: Indicator.ballPulse,
                              colors: [Colors.white],
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                          const SizedBox(height: 75),
                        ],
                      );
                    } else {
                      return Item(petition: _catalogList[index]);
                    }
                  }
              )
          ),
        ),
      ),
    );
  }


  Widget getDropDownMenu() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: false,
        style: const TextStyle(
          color: Colors.white
        ),
        hint: const Text(
          'По умолчанию',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        items: _dropDownMenuList.map((String item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
        )).toList(),
        value: _selectedValue,
        onChanged: (value) {
          setState(() {
            _selectedValue = value;
          });
          getCatalogList(true);
        },
        menuItemStyleData: const MenuItemStyleData(
          height: 36
        ),
        buttonStyleData: ButtonStyleData(
          height: 45,
          padding: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.black,
          ),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_forward_ios_outlined,
          ),
          iconSize: 14,
          iconEnabledColor: Colors.white,
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.black87,
          ),
        ),
      )
    );
  }
}