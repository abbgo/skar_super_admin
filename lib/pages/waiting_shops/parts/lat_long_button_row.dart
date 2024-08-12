import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LatLongButtonRow extends StatelessWidget {
  const LatLongButtonRow(
      {super.key, required this.latitude, required this.longitude});

  final String latitude;
  final String longitude;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(latitude, style: const TextStyle(fontSize: 12)),
                Text(longitude, style: const TextStyle(fontSize: 12)),
              ],
            ),
            Expanded(
              child: IconButton(
                onPressed: () async {
                  await Clipboard.setData(
                      ClipboardData(text: '$latitude $longitude'));
                },
                icon: const Icon(Icons.content_copy),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
