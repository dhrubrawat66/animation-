import 'package:flutter/material.dart';

class RotatingButtonWidget extends StatefulWidget {
  const RotatingButtonWidget({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final IconData icon;

  @override
  _RotatingButtonWidgetState createState() => _RotatingButtonWidgetState();
}

class _RotatingButtonWidgetState extends State<RotatingButtonWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    _animation = Tween<double>(begin: 0, end: 1.0).animate(_controller);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _controller.reverse();
        });
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              border: Border.all(
                width: 1.5,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: RotationTransition(
              turns: _animation,
              child: Icon(
                widget.icon,
                color: Colors.white,
                size: 40,
              ),
            ),
          )
        ],
      ),
    );
  }
}
