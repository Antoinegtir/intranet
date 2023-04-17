import 'package:flutter/material.dart';

/// [SidebarMenu], [StatelessWidget] that display the sidebar menu
/// [scaffoldKey], [GlobalKey<ScaffoldState>] key of the scaffold
/// [ClipRRect], [Widget] that clip the child with a rounded rectangle
/// [Drawer], [Widget] that display a material design drawer
/// [SafeArea], [Widget] that avoid the child to be draw outside the safe area
/// [Stack], [Widget] that display its children one on top of the other
/// [Padding], [Widget] that add padding around its child
/// [Row], [Widget] that display its children in a horizontal line
/// [Column], [Widget] that display its children in a vertical line
/// [Image.asset], [Widget] that display an image from an asset bundle

class SidebarMenu extends StatelessWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  const SidebarMenu({Key? key, this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.zero,
          topRight: Radius.circular(40),
          bottomLeft: Radius.zero,
          bottomRight: Radius.circular(40),
        ),
        child: Drawer(
            elevation: 0,
            backgroundColor: Colors.white,
            child: SafeArea(
              child: Stack(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(bottom: 45),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                "assets/logo.png",
                                height: 40,
                              ),
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            )));
  }
}
