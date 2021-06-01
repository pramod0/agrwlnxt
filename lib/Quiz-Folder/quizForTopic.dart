import 'package:agrwlnxt/Quiz-Folder/questionData.dart';
import 'package:agrwlnxt/Quiz-Folder/quiz.dart';
import 'package:agrwlnxt/Quiz-Folder/scoreBoard.dart';
import 'package:agrwlnxt/Quiz-Folder/startQuiz.dart';
import 'package:flutter/material.dart';

class QuizBox extends StatefulWidget {
  final String std;
  final String subject;
  final int topic;

  QuizBox({this.std, this.subject, this.topic});

  @override
  _QuizBoxState createState() => _QuizBoxState();
}

class _QuizBoxState extends State<QuizBox> {
  int index;

  @override
  void initState() {
    index = 0;
    super.initState();
  }

  void _startRestartQuiz(int flag){
    setState(() {
      flag == 0 ? index = 0 : index = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Quiz'),
          centerTitle: true,
          leading: (index == 0 || index == Question.questionList.length)
              ? IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Question.choosenOption.fillRange(0,Question.choosenOption.length);
                  })
              : TextButton(
                  child: Text(
                    'Finish',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      index = Question.questionList.length;
                    });
                  },
                ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: constraints.maxHeight * 0.08,
                    width: constraints.maxWidth,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.yellow[700],
                      borderRadius: BorderRadius.circular(constraints.maxHeight * 0.04)
                    ),
                    child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                            'Topic - ${widget.topic} / ${widget.subject} / ${widget.std}')),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.02,
                    width: constraints.maxWidth,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.9,
                    width: constraints.maxWidth,
                    child: LayoutBuilder(builder: (context, constraints2) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: constraints2.maxHeight * 0.9,
                            width: constraints2.maxWidth,
                            child: index == 0
                                ? StartQuizBox(_startRestartQuiz)
                                : index >= Question.questionList.length
                                    ? ScoreBoard(restart: _startRestartQuiz, std: widget.std, topic: '${widget.subject}-${widget.topic}')
                                    : Quiz(index),
                          ),
                          Visibility(
                              visible: (index > 0 && index <= Question.questionList.length-1), 
                              child: Container(
                                height: constraints2.maxHeight * 0.1,
                                width: constraints2.maxWidth,
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: constraints2.maxWidth * 0.15,
                                      child: FittedBox(
                                        child: IconButton(
                                            icon: Icon(Icons.chevron_left_rounded),
                                            onPressed: () {
                                              setState(() {
                                                index--;
                                              });
                                            }),
                                      ),
                                    ),
                                    Text('$index /${Question.questionList.length-1}'),
                                    CircleAvatar(
                                      radius: constraints2.maxWidth * 0.15,
                                      child: FittedBox(
                                        child: IconButton(
                                            icon: Icon(Icons.chevron_right_rounded),
                                            onPressed: () {
                                              setState(() {
                                                index++;
                                              });
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      );
                    }),
                  )
                ],
              );
            },
          ),
        ));
  }
}

/*
RichText(
                        text: TextSpan(
                            text: 'Quiz-',
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                  text: ' Topic-${widget.topic}',
                                  style: TextStyle(color: Colors.blue)),
                              TextSpan(text: ' / '),
                              TextSpan(
                                  text: '${widget.subject}',
                                  style: TextStyle(color: Colors.green)),
                              TextSpan(text: ' / '),
                              TextSpan(
                                  text: '${widget.std}',
                                  style: TextStyle(color: Colors.red)),
                            ]),
                      ),

Center(
                                    child: RaisedButton(
                                        elevation: 3,
                                        child: const Text('Start quiz !'),
                                        onPressed: () {
                                          setState(() {
                                            index = 1;
                                          });
                                        }))
*/
