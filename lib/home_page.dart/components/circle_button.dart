import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton(this.label, this.icon, this.color, {Key? key}) : super(key: key);
  final String label;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(color: color, shape: BoxShape.circle, boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              blurRadius: 8.0,
            )
          ]),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 12.0),
        Text(label),
      ],
    );
  }
}
