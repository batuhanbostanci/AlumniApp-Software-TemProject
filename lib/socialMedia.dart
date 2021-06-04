
import 'package:flutter/material.dart';

class SocialMedia {
  String name;
  String url;

  SocialMedia(this.name, this.url);
}

class SocialMediaPage extends StatefulWidget {
  static List<SocialMedia> socialMediaAccounts = [];

  @override
  _SocialMediaPageState createState() => _SocialMediaPageState();
}

class _SocialMediaPageState extends State<SocialMediaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Social Media"),
      ),

    );
  }
}
