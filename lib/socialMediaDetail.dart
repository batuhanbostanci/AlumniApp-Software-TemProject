import 'package:alumnisoftwareapp/socialMedia.dart';
import 'package:flutter/material.dart';

class SocialMediaDetail extends StatefulWidget {
  String name;

  SocialMediaDetail(this.name);

  @override
  _SocialMediaDetailState createState() => _SocialMediaDetailState();
}

class _SocialMediaDetailState extends State<SocialMediaDetail> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                bool add = true;
                if (widget.name == "Facebook") {
                  SocialMediaPage.socialMediaAccounts.forEach((element) {
                    if (element.name == "Facebook") {
                      add = false;
                      element.url =  "https://www.facebook.com/" +
                          _controller.text.toString();
                      print("değişti");
                    }
                  });
                  if (add) {
                    SocialMediaPage.socialMediaAccounts.add(new SocialMedia(
                        "Facebook",
                        "https://www.facebook.com/" +
                            _controller.text.toString()));
                    print("https://www.facebook.com/" +
                        _controller.text.toString());
                  }
                } else if (widget.name == "Github") {
                  SocialMediaPage.socialMediaAccounts.forEach((element) {
                    if (element.name == "Github") {
                      add = false;
                      element.url =  "https://www.github.com/" +
                          _controller.text.toString();
                      print("değişti");
                    }
                  });
                  if (add) {
                    SocialMediaPage.socialMediaAccounts.add(new SocialMedia(
                        "Github",
                        "https://www.github.com/" +
                            _controller.text.toString()));
                    print("https://www.github.com/" +
                        _controller.text.toString());
                  }
                }
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Text("Add"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
