import 'package:uuid/uuid.dart';

final uuid = Uuid();

class Category {
  Category({required this.name}) : id = uuid.v4();
  final String name;
  final String id;
}
