import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dishes-page.dart';

class RestaurantsPage extends StatefulWidget {
  const RestaurantsPage({Key? key}) : super(key: key);

  @override
  _RestaurantsPageState createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  fetchRestaurants() {
    Stream<QuerySnapshot> stream =
        FirebaseFirestore.instance.collection("Restaurants").snapshots();
    return stream;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: fetchRestaurants(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              "SOMETHING WENT WRONG",
              style: TextStyle(color: Colors.red),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView(
            children:
                snapshot.data!.docs.map<Widget>((DocumentSnapshot document) {
          Map<String, dynamic> map = document.data()! as Map<String, dynamic>;
          return InkWell(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              margin: EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      map['imageUrl'].toString(),
                      alignment: Alignment.center,
                    ),
                    SizedBox(height: 10),
                    Text(map['name'], style: TextStyle(fontSize: 18)),
                    Row(children: [
                      Text(
                          "Price/Person -  \u20b9" +
                              map['pricePerPerson'].toString(),
                          style:
                              TextStyle(color: Colors.black54, fontSize: 14)),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.all(6.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                map['rating'].toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.0),
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
                    Text(map['categories'],
                        style:
                            TextStyle(fontSize: 12, color: Colors.lightBlue)),
                    SizedBox(height: 6)
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DishesPage(restaurantId: document.id)
                  )
              );
            },
          );
        }).toList());
      },
    );
  }
}
