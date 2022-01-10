import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/constants/util.dart';
import 'package:flutter_training/model/dish.dart';

class Counter extends StatefulWidget {
  Map<String, dynamic>? dish;

  Counter({Key? key, @required this.dish}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int initialValue = 0;

  updateDishInCart() {
    Dish cartDish = Dish(
        name: widget.dish!['name'].toString(),
        price: widget.dish!['price'],
        quantity: initialValue,
        totalPrice: initialValue * (widget.dish!['price']) as int);

    FirebaseFirestore.instance
        .collection("users")
        .doc(Util.appUser!.uid)
        .collection("cart")
        .doc(widget.dish!['docId'])
        .set(cartDish.toMap());
  }

  deleteDishFromCart() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(Util.appUser!.uid)
        .collection("cart")
        .doc(widget.dish!['docId'])
        .delete();
  }

  @override
  Widget build(BuildContext context) {
    if (initialValue == 0) {
      return Container(
        width: MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle, color: Colors.lightBlueAccent),
        child: TextButton(
          child: Text("Add", style: TextStyle(color: Colors.white)),
          onPressed: () {
            setState(() {
              initialValue++;
              updateDishInCart();
            });
          },
        ),
      );
    }
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle, color: Colors.lightBlueAccent),
      child: Row(
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                if (initialValue <= 0) {
                  deleteDishFromCart();
                } else {
                  initialValue--;
                  updateDishInCart();
                }
              });
            },
            child:
                Text("-", style: TextStyle(color: Colors.black, fontSize: 14)),
          ),
          Text(initialValue.toString(),
              style: TextStyle(color: Colors.black, fontSize: 14)),
          TextButton(
            onPressed: () {
              setState(() {
                initialValue++;
                updateDishInCart();
              });
            },
            child:
                Text("+", style: TextStyle(color: Colors.black, fontSize: 14)),
          )
        ],
      ),
    );
  }
}
