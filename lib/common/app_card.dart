import 'package:flutter/material.dart';

class AppCard extends StatefulWidget {
  final Widget child;
  Border? borderStyle;
  Color? boxShadowColor;

  AppCard(
      {Key? key, required this.child, this.borderStyle, this.boxShadowColor})
      : super(key: key);

  @override
  _AppCardState createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          margin: const EdgeInsets.all(20.0),
          color: Colors.white,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: widget.borderStyle ??
                  Border.all(color: Colors.black, width: 2),
              boxShadow: [
                BoxShadow(
                    color: widget.boxShadowColor ?? Colors.black,
                    offset: const Offset(10.0, 10.0))
              ],
            ),
            child: widget.child,
          ),
        ),
      ],
    );
  }
}
