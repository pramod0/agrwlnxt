import 'package:agrwlnxt/Quiz-Folder/QuizAnalysis.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'questionData.dart';

class ScoreBoard extends StatelessWidget {

  final Function restart;
  final String std;
  final String topic;
  int posCount, negCount, notAttempted;

  ScoreBoard({@required this.restart,@required this.std,@required this.topic}) {
    this.posCount = 0;
    this.negCount = 0;
    this.notAttempted = 0;
    for (int i = 1; i < (Question.questionList.length); i++) {
      if (Question.choosenOption[i] == Answers.answers[i]) {
        posCount++;
      } else {
        Question.choosenOption[i] == null ? notAttempted++ : negCount++;
        print('${Question.choosenOption[i]}- $i');
      }
    }
    QuizHistory.userData.insert(0,QuizHistory(id:'${DateTime.now()}', marks: '$posCount/${Answers.answers.length-1}', std: std, topic: topic, date: DateTime.now()));

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Images/Bulb.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2), BlendMode.dstATop),
        ),
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            Container(
              height: constraints.maxHeight * 0.08,
              width: constraints.maxWidth * 0.6,
              color: Colors.grey[400],
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text('Score Card',
                    style:
                        TextStyle(decorationStyle: TextDecorationStyle.solid)),
              ),
            ),
            Positioned(
                left: 0.0,
                top: constraints.maxHeight * 0.11,
                height: constraints.maxHeight * 0.2,
                width: constraints.maxWidth,
                child: Table(
                    columnWidths: {
                      0: FixedColumnWidth(constraints.maxWidth * 0.25),
                      1: FixedColumnWidth(constraints.maxWidth * 0.25),
                      2: FixedColumnWidth(constraints.maxWidth * 0.25),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    border: TableBorder.all(),
                    children: [
                      TableRow(children: [
                        Container(
                          height: constraints.maxHeight * 0.06,
                          padding: const EdgeInsets.all(5.0),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text('Right',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Container(
                          height: constraints.maxHeight * 0.06,
                          padding: const EdgeInsets.all(5.0),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text('Wrong',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Container(
                          height: constraints.maxHeight * 0.06,
                          padding: const EdgeInsets.all(5.0),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text('Left',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        )
                      ]),
                      TableRow(children: [
                        Container(
                          height: constraints.maxHeight * 0.06,
                          padding: const EdgeInsets.all(5.0),
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text('$posCount',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green)),
                          ),
                        ),
                        Container(
                          height: constraints.maxHeight * 0.06,
                          padding: const EdgeInsets.all(5.0),
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text('$negCount',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red)),
                          ),
                        ),
                        Container(
                          height: constraints.maxHeight * 0.06,
                          padding: const EdgeInsets.all(5.0),
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text('$notAttempted',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlue)),
                          ),
                        )
                      ])
                    ])),
            Positioned(
                top: constraints.maxHeight * 0.5,
                height: constraints.maxHeight * 0.08,
                left: constraints.maxWidth * 0.3,
                width: constraints.maxWidth * 0.4,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    posCount > negCount ? 'Congratulations !': (notAttempted > posCount + negCount) ? 'very bad !':'Try Harder',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: posCount > negCount ? Colors.green.withOpacity(0.5) : Colors.red.withOpacity(0.5),
                      backgroundColor: Colors.white.withOpacity(0.2)
                    )
                  ),
                )
            ),
            Positioned(
              bottom: constraints.maxHeight * 0.05,
              right: constraints.maxWidth * 0.05,
              child: RaisedButton(
                color: Colors.grey[400],
                child: Text('Restart',),
                onPressed: (){
                  Question.choosenOption.fillRange(0,Question.choosenOption.length);
                  restart(0);
                }
              )
            ),
            Positioned(
              bottom: constraints.maxHeight * 0.05,
              left: constraints.maxWidth * 0.05,
              child: TextButton(
                child: Text('Analyse',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,color: Theme.of(context).primaryColor)),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=>Analyse(),fullscreenDialog: true)
                  );
                },
              )
            )
          ],
        );
      }),
    );
  }
}

