import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../component/manu-component.dart';

class ReprotPage extends StatelessWidget {
  const ReprotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<MenuData> menu = [
      MenuData('images/report.png', 'Dail Report','/ReportDaily'),
      MenuData('images/report.png', 'Inspection','/test'),
      MenuData('images/issue.png', 'Issue','/test'),
      MenuData('images/manpower.png', 'Manpower','/ReportManpower'),
      MenuData('images/material.png', 'Materials','/ReportMaterials'),
      MenuData('images/punch-list.png','Punch Lists','/test'),
    ];
    return MenuWidget(menu);  }
}


