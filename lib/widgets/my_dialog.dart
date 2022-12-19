import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDiaLog extends StatelessWidget {
  final controler;
  final Function onSave;
  MyDiaLog({this.controler, required this.onSave});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      content: Container(
        height: 180,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text("Add a new task"),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: controler,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: "Add a new task",
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Cacel"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // mau button
                      onPrimary: Colors.white, // mau chu
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      onSave();
                      Navigator.of(context).pop();
                    },
                    child: Text("Add"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // mau button
                      onPrimary: Colors.white, // mau chu
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
