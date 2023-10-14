import 'package:changes_smol_gu/data/get_data/from_device/get_data_from_device_storage.dart';

abstract class DeviceStorageControllerInterface {
  getDataFromGallery();
}


class DeviceStorageController {
  final DeviceStorageControllerInterface _implementationObject = GetDataFromDeviceStorage();

  getGalleryData() async {
    return _implementationObject.getDataFromGallery();
  }
}