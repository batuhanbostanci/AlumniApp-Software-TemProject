import 'package:alumnisoftwareapp/main.dart';
import 'package:alumnisoftwareapp/mainPage.dart';
import 'package:alumnisoftwareapp/profilePage.dart';
import 'package:alumnisoftwareapp/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:connectivity/connectivity.dart';

class LoginPage extends StatefulWidget {
  static String trans_Email = "";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;
  String password;
  String error = "";
  var formKey = GlobalKey<FormState>();
  bool rememberMe = false;
  bool obscurePassword = true;

  String _connStatus1 = '';
  String _connStatus2 = '';
  int count;

  Connectivity connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> subscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connectionStatus1();
    connectionStatus2();
  }

  @override
  Widget build(BuildContext context) {
    connectionStatus2();
    if (_connStatus2 == "None") {
      count = 0;
      showMessage("Connection Lost", 4);
      count = 1;
    }
    if (_connStatus2 != "None" && count == 1) {
      showMessage("Your are online again", 2);
      count = 0;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: "register",
                child: Container(
                  margin: EdgeInsets.only(top: 15, bottom: 50),
                  width: MediaQuery.of(context).size.width * 6 / 10,
                  height: MediaQuery.of(context).size.height * 3 / 10,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage(
                              "assets/images/etu_med_logo.png"))),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: TextFormField(
                      onSaved: (value) {
                        email = value;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: _emailCheck,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.mail),
                        labelText: "Email",
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: TextFormField(
                      onSaved: (value) {
                        password = value;
                      },
                      obscureText: obscurePassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (obscurePassword == true) {
                                  obscurePassword = false;
                                } else {
                                  obscurePassword = true;
                                }
                              });
                            },
                            icon: Icon(Icons.remove_red_eye)),
                        labelText: "Password",
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: CheckboxListTile(
                          title: Text(
                            "Remember me",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent),
                          ),
                          value: rememberMe,
                          onChanged: (value) {
                            setState(() {
                              rememberMe = value;
                            });
                          }),
                    ),
                    Expanded(
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forget Password?",
                            style: TextStyle(color: Colors.redAccent),
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            primary: Colors.blueGrey,
                          ),
                          onPressed: () async {
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();
                              try {
                                UserCredential userCredential =
                                    await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                  email: email,
                                  password: password,
                                );
                                //email transform for the getting information into login page
                                LoginPage.trans_Email = email;
                                print(LoginPage.trans_Email);
                                //transform to the profile page
                                await getInfo();

                                await getProfileInfo();

                                MyApp.validated = true;
                                //getting info for the keep user info for Future
                                await setSharedPref();

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainPage()));
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  error = 'No user found for that email';
                                  print('No user found for that email.');
                                  showMessage(
                                      "No user found for that email.", 1);
                                } else if (e.code == 'wrong-password') {
                                  error = 'No user found for that email';
                                  showMessage(
                                      'No user found for that email.', 1);
                                  print(
                                      'Wrong password provided for that user.');
                                }
                              }
                            }
                          },
                          child: Text("Login")),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7 / 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            primary: Colors.blueGrey,
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                          child: Text("Register")),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showMessage(String message, int timeInSec) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: timeInSec,
        backgroundColor: Colors.grey.shade300,
        textColor: Colors.black87,
        fontSize: 16.0);
  }

  String _emailCheck(String mail) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(mail))
      return 'Check your mail !';
    else
      return null;
  }

  String getConnectionValue(var connectivityResult) {
    String status = '';
    switch (connectivityResult) {
      case ConnectivityResult.mobile:
        status = 'Mobile';
        break;
      case ConnectivityResult.wifi:
        status = 'Wi-Fi';
        break;
      case ConnectivityResult.none:
        status = 'None';
        break;
      default:
        status = 'None';
        break;
    }
    return status;
  }

  void connectionStatus1() async {
    var connectivityResult = await connectivity.checkConnectivity();
    var conn = getConnectionValue(connectivityResult);
    setState(() {
      _connStatus1 = conn;
    });
  }

  void connectionStatus2() async {
    subscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      var conn = getConnectionValue(result);
      setState(() {
        _connStatus2 = conn;
      });
    });
  }
}

class ConnectivityService {
  //
  StreamController<ConnectivityResult> connectionStatusController =
      StreamController<ConnectivityResult>();

  ConnectivityService() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      connectionStatusController.add(result);
    });
  }
}

//set SharedPred to keep the user exit the app or not
setSharedPref() async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  await pref.setBool("values", MyApp.validated);
}




//Method for the getting information from firebase store
Future<void> getProfileInfo() async {

  var temp = await FirebaseFirestore.instance.collection('profileInfo').get();
  temp.docs.forEach((doc) {
    if (doc["E-mail"] == LoginPage.trans_Email) {
      ProfilePage.job = doc["job"];
      ProfilePage.location = doc["location"];
      ProfilePage.degree = doc["degree"];
      ProfilePage.infoValidated = true;
    }
  });


}


//Method for the getting information from firebase store
Future<void> getInfo() async {
  String name;
  String surname;
  var temp = await FirebaseFirestore.instance.collection('users').get();
  temp.docs.forEach((doc) {
    if (doc["E-mail"] == LoginPage.trans_Email) {
      name = doc["name"];
      surname = doc["surname"];
    }
  });
  ProfilePage.fullName = name + " " + surname;
  ProfilePage.fullName = ProfilePage.fullName.toUpperCase();
  print(ProfilePage.fullName);

  //If the user exit the app then this sharedPrefs keep the the information for the Future process
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setString("fullName", ProfilePage.fullName);
  await pref.setString("E_mail", LoginPage.trans_Email);
}
