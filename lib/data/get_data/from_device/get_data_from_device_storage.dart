import 'package:changes_smol_gu/core/controllers/device_storage_controller.dart';
import 'package:image_picker/image_picker.dart';

class GetDataFromDeviceStorage implements DeviceStorageControllerInterface {


  @override
  Future<XFile?> getDataFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    return pickedFile;
  }
}