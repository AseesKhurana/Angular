import 'package:flutter_training/constants/util.dart';
import 'package:flutter_training/custom_widgets/counter.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DishesPage extends StatefulWidget {

  String? restaurantId;

  DishesPage({Key? key, this.restaurantId}) : super(key: key);

  @override
  _DishesPageState createState() => _DishesPageState();
}

class _DishesPageState extends State<DishesPage> {

  fetchRestaurants(){
    Stream<QuerySnapshot> stream = FirebaseFirestore.instance.collection("Restaurants")
        .doc(widget.restaurantId).collection("dishes").snapshots();
    return stream;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: (){
                Navigator.pushNamed(context, "/cart");
              },
              icon: Icon(Icons.shopping_cart),
              tooltip: "Cart",
            )
          ],
          title: Text(Locale.locale['appTitle'].toString()),
        ),
        body: StreamBuilder(
          stream: fetchRestaurants(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasError){
              return Center(
                child: Text("SOMETHING WENT WRONG", style: TextStyle(color: Colors.red),),
              );
            }
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
                padding: EdgeInsets.all(8),
                children: snapshot.data!.docs.map<Widget>((DocumentSnapshot document){

                  Map<String, dynamic> map = document.data()! as Map<String, dynamic>;
                  map['docId'] = document.id.toString();

                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)
                    ),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(map['imageUrl'].toString(), alignment: Alignment.center),
                          SizedBox(height: 10),
                          Text(map['name'], style: TextStyle(fontSize: 18)),
                          Row(
                              children:[
                                Text("\u20b9"+map['price'].toString(),
                                    style: TextStyle(color: Colors.black54, fontSize: 14)),
                                Spacer(),
                                Container(
                                  padding: EdgeInsets.all(6.0),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          map['rating'].toString(),
                                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                                        ),
                                        Icon(Icons.star_rounded,
                                            color: Colors.white, size: 19.0)
                                      ]),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(8.0)),
                                ),
                              ]),
                          Divider(),
                          Text(map['category'], style: TextStyle(fontSize: 12, color: Colors.lightBlue)),
                          SizedBox(height: 4),
                          Counter(dish: map),
                          SizedBox(height: 6)
                        ],
                      ),
                    ),
                  );
                }).toList()
            );
          },
        )
    );
  }
}