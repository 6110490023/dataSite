import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../component/manu-component.dart';

class ReprotPage extends StatelessWidget {
  const ReprotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<MenuData> menu = [
      MenuData(Icons.move_to_inbox_outlined, 'Dail Report','/ReportDaily'),
      MenuData(Icons.find_in_page_outlined, 'Inspection','/test'),
      MenuData(Icons.find_in_page_outlined, '','/test'),
      MenuData(Icons.upgrade_outlined, 'Manpower','/ReportManpower'),
      MenuData(Icons.upgrade_outlined, 'Materials','/ReportMaterials'),
      MenuData(Icons.play_for_work_outlined, 'Punch Lists','/test'),
    ];
    return MenuWidget(menu);  }
}


