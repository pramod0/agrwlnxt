import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

class ListOFStandard extends StatelessWidget {
  final Function selectSTD;
  final List stdList;
  ListOFStandard({
    @required this.selectSTD, 
    @required this.stdList
  });

  @override
  Widget build(BuildContext context) {;
    return ListView(
      children: stdList.map((standard) {
        return Container(
          margin: const EdgeInsets.only(top: 5, bottom: 5),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                RandomColor()
                    .randomColor(colorHue: ColorHue.blue)
                    .withOpacity(0.2),
                RandomColor().randomColor(colorHue: ColorHue.blue)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(10)),
          child:
              ListTile(title: Text(standard), onTap: () => selectSTD(standard)),
        );
      }).toList(),
    );
  }
}
