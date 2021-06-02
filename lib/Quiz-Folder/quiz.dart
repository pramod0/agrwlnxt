import 'package:flutter/material.dart';
import 'questionData.dart';

class Quiz extends StatefulWidget {

  final int index;
  int _value ;
  Quiz(this.index){
    this._value = Question.choosenOption.isEmpty ? 0: Question.choosenOption[this.index];
  }

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.teal,
            Colors.teal.withOpacity(0.2),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              Positioned(
                left: constraints.maxWidth * 0.05,
                child: Container(
                  height: constraints.maxWidth * 0.10,
                  width: constraints.maxWidth * 0.15,
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.yellow[700],
                      borderRadius: BorderRadius.only(
                          bottomLeft:
                              Radius.circular(constraints.maxWidth * 0.075),
                          bottomRight:
                              Radius.circular(constraints.maxWidth * 0.075))),
                  child: Text(
                    '${widget.index}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Positioned(
                left: 0.0,
                top: constraints.maxWidth * 0.10,
                height: constraints.maxHeight * 0.9,
                width: constraints.maxWidth,
                child: Container(
                  height: constraints.maxHeight * 0.9,
                  width: constraints.maxWidth,
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          Question.questionList[widget.index],
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 30,
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.03,
                        ),
                        RadioListTile(
                          value: 1, 
                          groupValue: widget._value, 
                          onChanged: (val){
                            setState(() {
                              widget._value = val;
                              Question.choosenOption[widget.index] = val;
                              print(val);
                            });
                          },
                          activeColor: Colors.yellow,
                          title: Text('Hello ,Want to check whether Multi-Line option is working or Not, Yes Its working '),

                        ),
                        RadioListTile(
                          value: 2, 
                          groupValue: widget._value, 
                          onChanged: (val){
                            setState(() {
                              widget._value = val;
                              Question.choosenOption[widget.index] = val;
                              print(val);
                            });
                          },
                          activeColor: Colors.yellow,
                          title: Text('Do will have Images in our question ? ok,I am working on It'),
                          
                        ),
                        RadioListTile(
                          value: 3, 
                          groupValue: widget._value, 
                          onChanged: (val){
                            setState(() {
                              widget._value = val;
                              Question.choosenOption[widget.index] = val;
                              print(val);
                            });
                          },
                          activeColor: Colors.yellow,
                          title: Text('In 3rd Question I am checking for multi line question'),
                          
                        ),
                        RadioListTile(
                          value: 4, 
                          groupValue: widget._value, 
                          onChanged: (val){
                            setState(() {
                              widget._value = val;
                              Question.choosenOption[widget.index] = val;
                              print(val);
                            });
                          },
                          activeColor: Colors.yellow,
                          title: Text('will have MSQ in our quiz ? well, I am working on it..'),
                          
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }));
  }
}
