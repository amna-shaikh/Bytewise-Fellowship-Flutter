
class ReviewCartModel {
  String cartId;
  String cartImage;
  String cartName;
  int cartPrice;
  var cartQuantity;
  var cartUnit;
  ReviewCartModel({
    required this.cartId,
    required this.cartImage,
    required this.cartName,
    required this.cartPrice,
     this.cartQuantity,
     this.cartUnit,
  });
}