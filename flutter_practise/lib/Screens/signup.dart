import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practise/Models/users.dart';
import 'package:flutter_practise/Screens/home_page.dart';
import 'package:flutter_practise/Screens/login.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswrordController =
      TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  labelText: 'Name',
                  hintText: 'Enter name',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
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
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    labelText: 'Phone',
                    hintText: 'Enter Phone Number'),
                keyboardType: TextInputType.phone,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    suffix: Icon(Icons.remove_red_eye_rounded),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                controller: _confirmPasswrordController,
                obscureText: true,
                decoration: const InputDecoration(
                    suffix: Icon(Icons.remove_red_eye_rounded),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    labelText: 'Confirm Password',
                    hintText: 'Confirm password'),
                keyboardType: TextInputType.text,
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

                    if (_passwordController.text ==
                        _confirmPasswrordController.text) {
                      _auth.createUserWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text);

                      UserModel userModel = UserModel();
                      User? user = _auth.currentUser;

                      userModel.uid = user!.uid;
                      userModel.name = _nameController.text;
                      userModel.email = _emailController.text;
                      userModel.phone = _phoneController.text;
                      userModel.password = _passwordController.text;

                      FirebaseFirestore.instance
                          .collection("users")
                          .doc()
                          .set(userModel.toMap())
                          .then((value) => {
                                setState(() {
                                  isLoading = true;
                                }),
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const HomePage()))
                              });
                    }
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
                        color: Colors.white,
                        strokeWidth: 2,
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
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: const Text('Have Account? Login'))
          ],
        ),
      ),
    );
  }
}
