import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:shared_preferences/shared_preferences.dart';

var isDarkmode = false.obs;
final box = GetStorage();
final getDarkmode = box.read("darkmode") == true;
void saveDark(bool value) {
  isDarkmode.value = value;
}


