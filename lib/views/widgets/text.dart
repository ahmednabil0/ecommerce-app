import 'package:flutter/cupertino.dart';

class NewText extends StatelessWidget {
  const NewText({
    Key? key,
    required this.txt,
    required this.colr,
    required this.fWeight,
    required this.fSize,
  }) : super(key: key);
  final String txt;
  final Color colr;
  final FontWeight fWeight;
  final double fSize;

  @override
  Widget build(BuildContext context) {
    return Text(txt,
        style: TextStyle(
          fontSize: fSize,
          color: colr,
          fontWeight: fWeight,
        ));
  }
}
