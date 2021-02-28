import 'package:flutter/material.dart';

import '../../util/styles.dart';

class DrawerOption extends StatelessWidget {
  final String text;
  final Function onTap;

  const DrawerOption({Key key, this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Text(
          '> $text',
          style: Styles.drawerOptionStyle,
        ),
      ),
    );
  }
}
