import 'package:basicflutter/component/manu-component.dart';
import 'package:flutter/material.dart';

import 'developing-component.dart';

class CardMenu extends StatelessWidget {
  MenuData menu;
  CardMenu(this.menu, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      child: InkWell(
        onTap: () {
            Navigator.of(context).pushNamed(menu.route);
          
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,  
          children: <Widget>[
            Icon(
              menu.icon,
              size: 35,
            ),
            SizedBox(height: 10),
            Text(
              menu.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            )
          ],
        ),
      ),
    );
  }
}
