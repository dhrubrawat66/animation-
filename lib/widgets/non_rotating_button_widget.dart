import 'package:flutter/material.dart';

class NonRotatingButtonWidget extends StatefulWidget {
  const NonRotatingButtonWidget({
    Key? key,
    required this.child,
    required this.icon,
  }) : super(key: key);
  final Widget child;
  final IconData icon;

  @override
  _NonRotatingButtonWidgetState createState() =>
      _NonRotatingButtonWidgetState();
}

class _NonRotatingButtonWidgetState extends State<NonRotatingButtonWidget> {
  double _opacity = 0;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (a) {
        setState(() {
          _opacity = 1;
        });
      },
      onExit: (a) {
        setState(() {
          _opacity = 0;
        });
      },
      child: SizedBox(
        width: 120,
        height: 120,
        child: Stack(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60.0),
                border: Border.all(width: 2),
              ),
            ),
            Align(
              child: Icon(
                widget.icon,
                size: 40,
              ),
            ),
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(milliseconds: 200),
              child: Align(
                alignment: Alignment.center,
                child: widget.child,
              ),
            )
          ],
        ),
      ),
    );
  }
}
