import 'package:flutter/material.dart';

class addTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: TextField(
              autocorrect: true,
              decoration: InputDecoration(hintText: 'add new todo'),
            ),
          ),
        ],
      ),
    );
  }
}
