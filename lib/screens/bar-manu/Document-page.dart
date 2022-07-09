import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../component/manu-component.dart';

class DocumentPage extends StatelessWidget {
  const DocumentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<MenuData> menu = [
      MenuData(Icons.move_to_inbox_outlined, 'weather','/test'),
      MenuData(Icons.find_in_page_outlined, 'Drawing Status','/test'),
      MenuData(Icons.find_in_page_outlined, 'materials','/test'),
      MenuData(Icons.upgrade_outlined, 'Manpower','/test'),
      MenuData(Icons.upgrade_outlined, 'RFI','/test'),
      MenuData(Icons.play_for_work_outlined, 'Issue','/test'),
    ];
    return MenuWidget(menu);
  }
}
