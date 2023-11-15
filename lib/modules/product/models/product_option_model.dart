import 'package:collection/collection.dart' show ListEquality;

class ProductOptionModel {
  String name;
  List<String> options;
  ProductOptionModel({required this.name, required this.options});
  @override
  bool operator ==(covariant ProductOptionModel other) =>
      name == other.name && const ListEquality().equals(options, options);

  @override
  int get hashCode => (Object.hash(name, options));
}
