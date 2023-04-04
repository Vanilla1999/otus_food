import 'package:flutter/material.dart';

class TitleWithTimeWidget extends StatelessWidget {
  final String time;
  final String name;

  const TitleWithTimeWidget({Key? key, required this.time, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        maxLines: 2,
        name,
        overflow: TextOverflow.ellipsis,
      ),
      const SizedBox(
        height: 12,
      ),
      Row(
        children: [
          const Icon(
            Icons.access_time_outlined,
            color: Colors.black,
            size: 16,
          ),
          const SizedBox(
            width: 11,
          ),
          Text(
            time,
            style: const TextStyle(color: Colors.green),
          )
        ],
      )
    ]);
  }
}
