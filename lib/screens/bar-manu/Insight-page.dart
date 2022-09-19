
import 'package:flutter/material.dart';
import '../../component/manu-component.dart';

class InsightPage extends StatefulWidget {
  const InsightPage({Key? key}) : super(key: key);

  @override
  State<InsightPage> createState() => _InsightPageState();
}

class _InsightPageState extends State<InsightPage> {

  @override
  Widget build(BuildContext context) {
    final List<MenuData> menu = [
      MenuData('images/weather.png', 'weather','/test'),
      MenuData('images/drawing.png', 'Drawing Status','/InsightDrawing'),
      MenuData('images/material.png', 'Materials','/test'),
      MenuData('images/manpower.png', 'Manpower','/test'),
      MenuData('images/rfi.png', 'RFI','/test'),
      MenuData('images/issue.png', 'Issue','/test'),
      MenuData('images/report.png', 'Cost control','/test'),
      MenuData('images/punch-list.png', 'Punch Lists','/test'),
      MenuData('images/contract.png', 'Contract','/test')
    ];
    return MenuWidget(menu);
  }
  
}
