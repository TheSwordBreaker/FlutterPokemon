import 'package:flutter/material.dart';

class MyBaseCard extends StatefulWidget {
  final Widget child;
  final Border? borderStyle;
  final Color? boxShadowColor;

  const MyBaseCard({
    Key? key,
    required this.child,
    this.borderStyle,
    this.boxShadowColor,
  }) : super(key: key);

  @override
  State<MyBaseCard> createState() => _MyBaseCardState();
}

class _MyBaseCardState extends State<MyBaseCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20.0),
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border:
              widget.borderStyle ?? Border.all(color: Colors.black, width: 2),
          boxShadow: [
            BoxShadow(
                color: widget.boxShadowColor ?? Colors.black,
                offset: const Offset(10.0, 10.0))
          ],
        ),
        child: widget.child,
      ),
    );
  }
}
