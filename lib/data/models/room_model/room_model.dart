import 'package:image_picker/image_picker.dart';

class Room {
  String name;
  List<XFile> images;
  List<String> specifyAreas;

  Room({required this.name, required this.images, required this.specifyAreas});
}