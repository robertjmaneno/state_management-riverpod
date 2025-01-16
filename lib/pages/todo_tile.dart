import 'package:flutter/material.dart';

class TodoListTile extends StatelessWidget {
  final String taskName;
  final bool isChecked;
  final ValueChanged<bool?> onChanged;

  const TodoListTile({
    super.key,
    required this.taskName,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25, top: 26),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.green,
        ),
        child: Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: onChanged,
              activeColor: Colors.black,
            ),
            Text(
              taskName,
              style: TextStyle(
                  decoration: isChecked
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
          ],
        ),
      ),
    );
  }
}
