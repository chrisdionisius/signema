import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height / 20,
      color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.list,
            color: Colors.white,
          ),
          Icon(Icons.grid_view),
        ],
      ),
    );
  }
}
