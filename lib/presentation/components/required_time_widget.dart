import 'package:flutter/material.dart';

class RequiredTimeWidget extends StatelessWidget {
  final String time;
  const RequiredTimeWidget({Key? key, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Row(children:  [
      const Icon(Icons.access_time_outlined,color: Colors.black,size: 16,),
      const SizedBox(width: 11,),
      Text(time,style: const TextStyle(color: Colors.green),)
    ],);
  }
}
