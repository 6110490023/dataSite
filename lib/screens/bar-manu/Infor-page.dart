import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../component/developing-component.dart';

// class InforPage extends StatelessWidget {
//   const InforPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Text(
//       'Infor Page',
//       style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//     );
//   }
// }
class InforPage extends StatefulWidget {
  const InforPage({Key? key}) : super(key: key);

  @override
  State<InforPage> createState() => _InforPage();
}

class _InforPage extends State<InforPage> {

  @override
  Widget build(BuildContext context) {
    return DevelopWidget();
  }
}
