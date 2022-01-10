import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/constants/util.dart';
import 'package:image_picker/image_picker.dart';


class UserProfile extends StatefulWidget {

  UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String imagePath = "NA";
  final ImagePicker _picker = ImagePicker();
  String? userId = Util.appUser!.uid;

  Future<void> uploadFile(String filePath) async {
    File file = File(filePath);

    try {
      await FirebaseStorage.instance
          .ref('profile-pics/' + userId! + '.png')
          .putFile(file);
      print("UPLOAD SUCCESS");
    } on FirebaseException catch (e) {
      print("UPLOAD FAILED");
    }
  }

  // fetchImage() async {
  //   var data = FirebaseStorage.instance.ref().child(userId!);
  //   var url = await data.getDownloadURL();
  //   Image.network(url);
  // }

  Future<Image?> getImage(BuildContext context, String imageName) async{
    Image? image;
    await FireStorageService.loadImage(context, imageName).then((value) {
      image = Image.network(value.toString());
    });
    return image;
  }

  @override
  Widget build(BuildContext context) {
    Util.fetchUserDetails();

    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        Card(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Padding(
                  padding: EdgeInsets.all(8.0)
              ),
              InkWell(
                onTap: () async {
                  final XFile? image =
                      await _picker.pickImage(source: ImageSource.gallery);
                  uploadFile(image!.path);
                },
                child: CircleAvatar(
                    radius: 90.0,
                    child: FutureBuilder(
                      future: getImage(context, "profile-pics/$userId"),
                      builder: (context, snapshot){
                        if(snapshot.connectionState == ConnectionState.done){
                          return Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: MediaQuery.of(context).size.height / 1.2
                          );
                        }
                        return Container();
                      },
                    )
                ),
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              Divider(),
              Text(Util.appUser!.name.toString(),
                  style: TextStyle(color: Colors.lightBlue, fontSize: 20)),
              Text(Util.appUser!.email.toString(),
                  style: TextStyle(color: Colors.lightBlue, fontSize: 10))
            ])),
        ListTile(
            leading: Icon(Icons.person),
            title: Text("Manage Profile"),
            subtitle: Text("Update Your Data for Your Account"),
            trailing: Icon(Icons.keyboard_arrow_right_rounded),
            onTap: () {}),
        ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("Manage Orders"),
            subtitle: Text("Manage your Order History here"),
            trailing: Icon(Icons.keyboard_arrow_right_rounded),
            onTap: () {}),
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Manage Addresses"),
          subtitle: Text("Update Your Addresses for Delivery"),
          trailing: Icon(Icons.keyboard_arrow_right_sharp),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.message),
          title: Text("Help"),
          subtitle: Text("Raise Your Queries"),
          trailing: Icon(Icons.keyboard_arrow_right_sharp),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.document_scanner_outlined),
          title: Text("Terms & Conditions"),
          subtitle: Text("Check our Terms and Conditions"),
          trailing: Icon(Icons.keyboard_arrow_right_sharp),
          onTap: () {},
        ),
      ],
    );
  }
}




class FireStorageService extends ChangeNotifier{
  FireStorageService();

  static Future<dynamic> loadImage(BuildContext context, String Image) async{
    return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
  }
}