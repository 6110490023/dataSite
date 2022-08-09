import 'package:basicflutter/screens/documant/document-daily.dart';
import 'package:basicflutter/screens/documant/document-drawing.dart';
import 'package:basicflutter/screens/insught/Insight-materials.dart';
import 'package:basicflutter/component/test.dart';
import 'package:basicflutter/screens/insught/insight-drawing.dart';
import 'package:basicflutter/screens/insught/insight-manpower.dart';
import 'package:basicflutter/screens/loginPage.dart';
import 'package:basicflutter/screens/mymain.dart';
import 'package:basicflutter/screens/report/daily/gallery.dart';
import 'package:basicflutter/screens/report/report-daily.dart';
import 'package:basicflutter/screens/report/report-manpower.dart';
import 'package:basicflutter/screens/report/report-materials.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

// สร้างเเอพ
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      fontFamily: 'Poppins',
    );
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.lightBlue[800],
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const MyMain(),
        "/login": (BuildContext context) => const LoginPage(),
        '/test': (BuildContext context) => const TestPage(),
        "/InsightMaterials": (BuildContext context) => const InsightMaterials(),
        "/InsightManpower": (BuildContext context) => const InsightManpower(),
        "/InsightDrawing":(BuildContext context) => const InsightDrawing(),
        "/DocumentDaily": (BuildContext context) => const DocumentDaily(),
        "/DocumentDrawing": (BuildContext context) => const DocumentDrawing(),
        "/ReportMaterials": (BuildContext context) => const ReportMaterials(),
        "/ReportManpower": (BuildContext context) => const ReportManpower(),
        "/ReportDaily": (BuildContext context) => const ReportDaily(),
        
      },
    );
  }
}
