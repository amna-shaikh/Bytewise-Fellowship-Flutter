import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../Models/product_model.dart';

class ProductProvider with ChangeNotifier {

  late ProductModel productModel;
  List<ProductModel> search = [];
  productModels(QueryDocumentSnapshot element) {
    productModel = ProductModel(
      productImage: element.get("ProductImage"),
      productName: element.get("ProductName"),
      productPrice: element.get("ProductPrice"),
      productId: element.get("ProductId"),
        productUnit: element.get("ProductUnit")

    );
    search.add(productModel);
  }

  List<ProductModel> FruitProductList = [];
  getFruitProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance.collection(
        "Fruitproduct").get();
    value.docs.forEach((element) {
      productModels(element);
      newList.add(productModel);
    });
    FruitProductList = newList;
    notifyListeners();
  }
  List<ProductModel> get getFruitProductDataList {
    return FruitProductList;
  }

  /// FOR VEGETABLE
  List<ProductModel> VegetableProductList = [];

  getVegetableProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance.collection(
        "Vegetableproduct").get();
    value.docs.forEach((element) {
      productModels(element);
      newList.add(productModel);
    });
    VegetableProductList = newList;
    notifyListeners();
  }
  List<ProductModel> get getVegetableProductDataList {
    return VegetableProductList;
  }

/// FOR POULTRY
  List<ProductModel> PoultryProductList = [];
  getPoultryProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance.collection("Poultryproduct").get();
    value.docs.forEach((element) {
      productModels(element);
      newList.add(productModel);
    });
    PoultryProductList = newList;
    notifyListeners();
  }
  List<ProductModel>  get getPoultryProductDataList {
    return PoultryProductList;
}
  List<ProductModel> get getAllProductSearch {
    return search;
  }
}


