import 'package:flutter/material.dart';
import 'package:task_management/pages/button.dart';

class AlertDialogBox extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  AlertDialogBox({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Add task'),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(name: "Cancel", onPressed: () {}),
                const SizedBox(width: 7),
                MyButton(name: "Add", onPressed: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
