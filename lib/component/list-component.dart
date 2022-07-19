import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  final String title;
  final void Function() function;
  ListCard({required this.title, required this.function, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.2,
      color: Colors.blueGrey.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: InkWell(
        onTap: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 8,
              child: Row(
                children: <Widget>[
                  const Icon(
                    Icons.account_box,
                    size: 35,
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 15, color: Colors.black87),
                  )
                ],
              ),
            ),
            const Expanded(
              flex: 1,
              child: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}
