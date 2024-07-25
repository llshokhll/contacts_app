import 'package:contact_app/ui/home/home_screen.dart';
import 'package:flutter/material.dart';

class OtherScreen extends StatelessWidget {
  const OtherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Other screen"),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return HomeScreen();
            }));
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
    );
  }
}
