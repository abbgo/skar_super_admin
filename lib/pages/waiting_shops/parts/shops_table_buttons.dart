import 'package:flutter/material.dart';

class ShopsTableConfirmButton extends StatelessWidget {
  const ShopsTableConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 75,
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
