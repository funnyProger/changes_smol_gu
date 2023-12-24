import 'dart:async';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import '../../../../../core/controllers/json_controller.dart';
import '../../../../../core/models/internet_connection_model.dart';
import '../../../../../data/entities/petition.dart';
import 'catalog_item/item_widget.dart';


class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}


class _CatalogPageState extends State<CatalogPage> {
  List<Petition> _catalogList = [];
  late final _listener;


  Future getCatalogList(bool getNewList) async {
    await Future.delayed(const Duration(milliseconds: 1200));
    List<Petition> newCatalogPart = await JsonController().getCatalogData();

    if(getNewList) {
      _catalogList = newCatalogPart;
    } else {
      for (Petition element in newCatalogPart) {
        _catalogList.add(element);
      }
    }

    setState(() {
      _catalogList;
    });
  }


  @override
  void initState() {
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
      body: context.watch<InternetConnectionModel>().getInternetConnectionStatus()
          ? internetConnectedWidget() :
          context.read<InternetConnectionModel>().getInternetErrorWidget()
    );
  }


  Widget internetConnectedWidget() {
    return RefreshIndicator(
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
                if (index == _catalogList.length) {
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
    );
  }
}