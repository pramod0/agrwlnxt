import 'package:agrwlnxt/Quiz-Folder/quizForTopic.dart';
import 'package:flutter/material.dart';

class Topics extends StatefulWidget {
  final String subject;
  final String standard;
  Topics({this.subject, this.standard});

  @override
  _TopicsState createState() => _TopicsState();
}

class _TopicsState extends State<Topics> {

  void _openQuiz(BuildContext context,String std, String subject,int topic)
  {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context)=> QuizBox(std:std,subject:subject,topic:topic)
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        key: PageStorageKey('${widget.subject}'),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return TextButton(
            child:Text(
              '${widget.standard} ${widget.subject} Topic-${index + 1}',
              style: TextStyle(color: Colors.black)
            ),
            onPressed: ()=>_openQuiz(context, widget.standard, widget.subject, index+1),
          );
        },
        itemCount: 50,
      )
      );
  }
}
