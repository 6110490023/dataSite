import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DevelopWidget extends StatelessWidget {
  const DevelopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "DEVELOPING",
            style: TextStyle(
                color: Colors.grey[900],
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
                fontFamily: 'Open Sans',
                fontSize: 40),
          ),
          Text("Can not use",
              style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Open Sans',
                  fontSize: 30))
        ],
      )),
    );
  }
}
