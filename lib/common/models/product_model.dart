import 'package:tech_mart/utils/app_images.dart';

class ProductModel {
  bool isFeatured = true;
  final title = 'Bugatti Sport Edition 2023...';
  final price = 'USD 2,637,000';
  final imageCount = "10";
  final videoCount = "15";
  final rating = "5";
  final sellerName = "Samsung Mobiles";
  final imageUrl = AppImages.buggati;
  ProductModel([int? index]) {
    if (index != null) {
      isFeatured = index.isEven;
    }
  }
}
