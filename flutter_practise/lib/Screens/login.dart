import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practise/Screens/home_page.dart';
import 'package:flutter_practise/Screens/signup.dart';
import 'package:flutter_practise/Screens/upload_resturant.dart';
import 'package:flutter_practise/utils/colors.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: const Text("Login Page"),
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 200,
                    child: Image(
                        image: NetworkImage(
                            "https://logowik.com/content/uploads/images/restaurant9491.logowik.com.webp"))),
              ),
            ),
            // Text(
            //   "Login",
            //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    labelText: 'Email',
                    hintText: 'abc@gmail.com'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            TextButton(
              onPressed: () {
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: const Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width * 0.92,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.blue)))),
                onPressed: () {
                  try {
                    setState(() {
                      isLoading = true;
                    });
                    _auth
                        .signInWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text)
                        .then((value) => {
                              fetchUserData(),
                              setState(() {
                                isLoading = true;
                              }),
                            });
                  } catch (e) {
                    print(e);

                    setState(() {
                      isLoading = false;
                    });
                    return;
                  }
                },
                child: isLoading
                    ? CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      )
                    : Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
              ),
            ),
            const SizedBox(
              height: 130,
            ),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
                child: Text('New User? Create Account'))
          ],
        ),
      ),
    );
  }

  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  String? role;

  Future<DocumentSnapshot> getUserDocument() async {
    return await userCollection.doc(_auth.currentUser?.uid).get();
  }

  Future<void> fetchUserData() async {
    try {
      DocumentSnapshot userDocument = await getUserDocument();

      if (userDocument.exists) {
        role = userDocument.get('role');
        if (role == "admin") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => UploadRestaurant()));
        } else if (role == "user") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }

        print(role);
      }
    } catch (e) {
      print(e);
    }
  }
}
