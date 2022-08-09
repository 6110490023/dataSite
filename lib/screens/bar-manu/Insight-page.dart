
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
      MenuData(Icons.move_to_inbox_outlined, 'weather','/login'),
      MenuData(Icons.find_in_page_outlined, 'Drawing Status','/InsightDrawing'),
      MenuData(Icons.find_in_page_outlined, 'Materials','/InsightMaterials'),
      MenuData(Icons.upgrade_outlined, 'Manpower','/InsightManpower'),
      MenuData(Icons.upgrade_outlined, 'RFI','/test'),
      MenuData(Icons.play_for_work_outlined, 'Issue','/test'),
      MenuData(Icons.play_for_work_outlined, 'Cost control','/test'),
      MenuData(Icons.assignment_turned_in_outlined, 'Punch Lists','/test'),
      MenuData(Icons.assignment_turned_in_outlined, 'Contract','/test')
    ];
    return MenuWidget(menu);
  }
  
}
