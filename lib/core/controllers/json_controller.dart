import 'package:changes_smol_gu/data/entities/petition.dart';
import 'package:changes_smol_gu/data/get_data/from_server/get_data_from_json.dart';

abstract class JsonControllerInterface {
  getDataFromJson();
}


class JsonController {
  final JsonControllerInterface _jsonControllerInterface = GetDataFromJson();


  Future<List<Petition>> getJsonData() async {
    return _jsonControllerInterface.getDataFromJson();
  }
}