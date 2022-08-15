import 'package:auth_example/common/my_base_card.dart';
import 'package:flutter/material.dart';

class AppCard extends StatefulWidget {
  final Widget child;
  final Border? borderStyle;
  final Color? boxShadowColor;

  const AppCard(
      {Key? key, required this.child, this.borderStyle, this.boxShadowColor})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AppCardState createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MyBaseCard(
          borderStyle: widget.borderStyle,
          boxShadowColor: widget.boxShadowColor,
          child: widget.child,
        ),
      ],
    );
  }
}
