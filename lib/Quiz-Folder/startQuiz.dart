import 'package:flutter/material.dart';

class StartQuizBox extends StatelessWidget {
  final Function startQuiz;

  StartQuizBox(this.startQuiz);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return InkWell(
        onTap: () => startQuiz(1),
        child: Container(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/Images/Bulb.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
          )),
          padding: const EdgeInsets.only(top: 20),
          alignment: Alignment.topCenter,
          child: Container(
            height: constraints.maxWidth * 0.2,
            width: constraints.maxWidth * 0.4,
            child: FittedBox(
              child: Text(
                'Tap to Start',
                style: TextStyle(color: Colors.black.withOpacity(0.2)),
              ),
              fit: BoxFit.contain
            )
          ),
        ),
      );
    });
  }
}
