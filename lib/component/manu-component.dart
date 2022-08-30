import 'package:basicflutter/component/card-menu-component.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatefulWidget {
  final List<MenuData> menu;
  const MenuWidget(this.menu);

  @override
  State<MenuWidget> createState() => _MenuWidget(menu);
}

class _MenuWidget extends State<MenuWidget> {
  _MenuWidget(this.menu);
  final List<MenuData> menu;
  

  @override
  Widget build(BuildContext context) {
    return showMenu();
  }
    Widget showMenu() {
    const sliverGridDelegateWithMaxCrossAxisExtent =
        const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            childAspectRatio: 1,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0);

    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              itemCount: menu.length,
              gridDelegate: sliverGridDelegateWithMaxCrossAxisExtent,
              itemBuilder: (BuildContext context, int index) {
                return CardMenu(menu[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MenuData {
  MenuData(this.imagePath, this.title ,this.route);
  final String imagePath;
  final String title;
  final String route;
}
