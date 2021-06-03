import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'package:connectivity/connectivity.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String _connStatus1 = '';
  String _connStatus2 = '';

  Connectivity connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> subscription;

  @override
  void initState() {
    super.initState();
    connectionStatus1();
    connectionStatus2();
  }

  void connectionStatus1() async {
    var connectivityResult = await connectivity.checkConnectivity();
    var conn = getConnectionValue(connectivityResult);
    setState(() {
      _connStatus1 = 'Connection Status: ' + conn;
    });
  }

  void connectionStatus2() async {
    subscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      var conn = getConnectionValue(result);
      setState(() {
        _connStatus2 = 'Connection Status: ' + conn;
      });
    });
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

  @override
  Widget build(BuildContext context) {
    connectionStatus2();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text('Settings'),
          iconTheme: IconThemeData(color: Colors.teal),
        ),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 30.0),
                    Text(
                      _connStatus1,
                      style: TextStyle(color: Colors.teal),
                    ),
                    SizedBox(height: 20.0),
                    FlatButton(
                      color: Colors.teal,
                      child: Text('Connection Status '),
                      onPressed: () {
                        connectionStatus1();
                      },
                    ),
                    SizedBox(height: 20.0),
                    // Automatic update
                    Text(
                      _connStatus2,
                      style: TextStyle(color: Colors.teal),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height) * 0.001,
            ),
          ],
        ),
      ),
    );
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
