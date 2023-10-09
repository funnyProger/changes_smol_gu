import 'package:changes_smol_gu/core/controllers/json_controller.dart';
import 'package:changes_smol_gu/data/entities/petition.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'dart:convert';


class GetDataFromJson implements JsonControllerInterface {


  @override
  Future<List<Petition>> getDataFromJson() async {
    try {
      final fileContent = await rootBundle.loadString('assets/petitions.json');
      final jsonData = json.decode(fileContent) as List<dynamic>;

      return jsonData.map((element) => Petition.fromJson(element)).toList();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }

  }

}