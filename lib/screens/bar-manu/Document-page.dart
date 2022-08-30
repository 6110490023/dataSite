import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../component/manu-component.dart';

class DocumentPage extends StatelessWidget {
  const DocumentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<MenuData> menu = [
      MenuData('images/drawing.png', 'Drawing','/DocumentDrawing'),
      MenuData('images/report.png', 'Daily Report','/DocumentDaily'),
      MenuData('images/report.png', 'Inspection','/test'),
      MenuData('images/punch-list.png', 'Punch Lists','/test'),
      MenuData('images/rfi.png','RFI','/test'),
      MenuData('images/issue.png', 'Issue','/test'),
    ];
    return MenuWidget(menu);
  }
}
