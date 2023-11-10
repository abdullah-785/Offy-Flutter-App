import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_practise/Models/restaurants.dart';
import 'package:flutter_practise/Screens/home_page.dart';
import 'package:flutter_practise/utils/colors.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';

final Reference stroageref = FirebaseStorage.instance.ref();
final postRef = FirebaseFirestore.instance.collection("posts");

class UploadRestaurant extends StatefulWidget {
  const UploadRestaurant({super.key});

  @override
  State<UploadRestaurant> createState() => _UploadRestaurantState();
}

class _UploadRestaurantState extends State<UploadRestaurant> {
  File? file;
  String? imageUrl;
  Future<TimeOfDay?>? selectedTime;
  String time = "-";

  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _levelController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _avgPriceController = TextEditingController();
  TextEditingController _typeController = TextEditingController();
  TextEditingController _openingTimeController = TextEditingController();
  TextEditingController _closingTimeController = TextEditingController();
  bool isLoading = false;
  List<String> restOrCoffeeShop = ['Restaurant', 'Coffee Shop'];

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : "No file Selected";
    String drowDownValue = restOrCoffeeShop.first;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12, top: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //   width: MediaQuery.of(context).size.width * 1,
              //   height: 240,
              //   child: Image(
              //       image: NetworkImage(
              //           "https://w7.pngwing.com/pngs/914/512/png-transparent-icloud-clip-cart-upload-computer-icons-computer-file-icon-drawing-upload-miscellaneous-blue-image-file-formats-thumbnail.png")),
              // ),
              GestureDetector(
                onTap: () {
                  selectFile();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                        image: file == null
                            ? const NetworkImage(
                                "https://raw.githubusercontent.com/abdullah-785/HousingApp/main/images/uploadImageVector.jpg")
                            : Image.file(file!).image,
                        fit: BoxFit.fill,
                      )),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    labelText: 'Name',
                    hintText: 'Enter restaurant name'),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _levelController,
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    labelText: 'Level',
                    hintText: 'Restaurant level'),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    labelText: 'Address',
                    hintText: 'Enter Address'),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _avgPriceController,
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    labelText: 'Average Price',
                    hintText: 'Average Price'),
              ),
              const SizedBox(
                height: 15,
              ),

              Container(
                  // height: 50.0,
                  width: MediaQuery.of(context).size.width * 0.94,
                  // decoration: BoxDecoration(border:),
                  child: DropdownButton(
                    value: drowDownValue,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 18,
                    elevation: 16,
                    isExpanded: true,
                    style: TextStyle(color: Colors.grey, fontSize: 16.0),
                    // underline: Container(
                    //   height: 2,
                    //   color: Colors.grey,
                    // ),
                    onChanged: (newValue) {
                      setState(() {
                        drowDownValue = newValue!;
                      });
                    },
                    items: restOrCoffeeShop
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )),
              // TextFormField(
              //   controller: _typeController,
              //   decoration: const InputDecoration(
              //       contentPadding:
              //           EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              //       border: OutlineInputBorder(
              //           borderRadius: BorderRadius.all(Radius.circular(20.0))),
              //       labelText: 'Type',
              //       hintText: 'Restaurant/Coffee Shope'),
              // ),
              const SizedBox(
                height: 30,
              ),

              GestureDetector(
                onTap: () {
                  // showDialogTimePicker(context);
                },
                child: Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width * .94,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: Text("$selectedTime"),
                ),
              ),
              TextFormField(
                controller: _openingTimeController,
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    labelText: 'Opening Time',
                    hintText: 'Opening Time'),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _closingTimeController,
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    labelText: 'Closing Time',
                    hintText: 'Closing Time'),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (file == null) {
                          // Fluttertoast.showToast(msg: "Please Select an Image");
                          return;
                        }
                        setState(() {
                          isLoading = true;
                        });

                        try {
                          final ref = FirebaseStorage.instance
                              .ref()
                              .child("restOrCoffeeImages")
                              .child(DateTime.now().toString());

                          await ref.putFile(file!);

                          String imageUrl = await ref.getDownloadURL();
                          User? user = _auth.currentUser;
                          Restaurants restaurants = Restaurants();
                          // String postId = Uuid().v4();

                          // restaurants.uid = restaurants.uid;
                          restaurants.image = imageUrl;
                          restaurants.name = _nameController.text;
                          restaurants.level = _levelController.text;
                          restaurants.address = _addressController.text;
                          restaurants.avgPrice = _avgPriceController.text;
                          restaurants.restOrCoffee = _typeController.text;
                          restaurants.openingTime = _openingTimeController.text;
                          restaurants.closingTime = _closingTimeController.text;

                          await FirebaseFirestore.instance
                              .collection("Restaurants")
                              .doc()
                              .set(restaurants.toMap());
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => HomePage()));
                          setState(() {
                            isLoading = false;
                            _nameController.clear();
                            _levelController.clear();
                            _addressController.clear();
                            _avgPriceController.clear();
                            _typeController.clear();
                            _openingTimeController.clear();
                            _closingTimeController.clear();
                          });
                        } catch (e) {
                          print("object");
                        }
                      },
                      child: isLoading ? spinkit : Text("Upload")))
            ],
          ),
        ),
      ),
    );
  }

  //The and
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }
}
