import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class TiltWidget extends StatefulWidget {
  final Function(double x, double y, double z) onTilt; // Callback to handle tilt data
  final Widget child; // Widget to display or move based on tilt

  const TiltWidget({
    Key? key,
    required this.onTilt,
    required this.child,
  }) : super(key: key);

  @override
  _TiltWidgetState createState() => _TiltWidgetState();
}

class _TiltWidgetState extends State<TiltWidget> {
  double _x = 0, _y = 0, _z = 0;

  @override
  void initState() {
    super.initState();
    // Listen to accelerometer events
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _x = event.x;
        _y = event.y;
        _z = event.z;
      });
      // Pass the tilt data to the parent widget
      widget.onTilt(_x, _y, _z);
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
