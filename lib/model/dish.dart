class Dish{
  String? name;
  int? price;
  int? quantity;
  int? totalPrice;

  Dish({this.name, this.price, this.quantity, this.totalPrice});

  toMap(){
    return {
      "name": name,
      "price": price,
      "quantity": quantity,
      "totalPrice": totalPrice,

    };
  }

}