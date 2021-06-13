import 'package:agrwlnxt/Quiz-Folder/quizHistory.dart';
import 'package:agrwlnxt/Quiz-Folder/standardList.dart';
import 'package:agrwlnxt/Quiz-Folder/subjectList.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  final String _userId;
  final String _userName;
  final List<String> _std = []; 

  QuizScreen(this._userId,this._userName);
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  
  String _stdSelected;
  bool _flag;

  @override
  void initState() {
    _flag = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    final bodyHeight = mediaQuery.size.height -
        kToolbarHeight -
        mediaQuery.padding.top -
        mediaQuery.padding.bottom;

    final bodyWidth = mediaQuery.size.width -
        mediaQuery.padding.left -
        mediaQuery.padding.right;

    void selectSTD(String value) {
      setState(() {
        _stdSelected = value;
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
          centerTitle: true,
          actions: [
            TextButton(
            child: const Text('LogOut',style: TextStyle(color:Colors.white),),
            onPressed: (){
              widget._std.clear();
              Navigator.of(context).popAndPushNamed('-');
            }, 
          )
          ],
        ),
        body: Container(
            height: bodyHeight,
            width: bodyWidth,
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            child: LayoutBuilder(builder: (ctx, constraints) {
              return Column(
                children: [
                  Container(
                    height: constraints.maxHeight * 0.18,
                    width: constraints.maxWidth,
                    padding: const EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.cyan, Colors.cyan.withOpacity(0.3)],
                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft),
                        borderRadius: BorderRadius.only(
                          bottomLeft: const Radius.circular(40),
                          topRight: const Radius.circular(40),
                        )),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8.0),
                      title: Text('Welcome, ${widget._userName}',
                          style: TextStyle(color: Colors.black)),
                      subtitle: Text(widget._userId,
                          style: TextStyle(color: Colors.yellow[900])),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/Images/Bulb.jpg'),
                      ),
                    ),
                  ),
                  Container(
                      height: constraints.maxHeight * 0.08,
                      width: constraints.maxWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _flag
                              ? DropdownButton(
                                  hint: Text(
                                    'Choose Std',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  dropdownColor: Colors.white,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  items: widget._std.map((standard) {
                                    return DropdownMenuItem<String>(
                                        value: standard, child: Text(standard));
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _stdSelected = value;
                                    });
                                  },
                                  value: _stdSelected,
                                )
                              : Container(
                                  height: constraints.maxHeight * 0.06,
                                  width: constraints.maxWidth * 0.4,
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text('History',
                                        style: TextStyle(color: Colors.grey)),
                                  )),
                          SizedBox(
                            height: constraints.maxHeight * 0.08,
                            width: constraints.maxWidth * 0.3,
                            child: TextButton(
                              child: Text(
                                _flag ? 'History' : 'New Quiz',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ),
                              onPressed: () {
                                setState(() {
                                  _flag = !_flag;
                                });
                              },
                            ),
                          ),
                        ],
                      )),
                  Container(                  
                    height: constraints.maxHeight * 0.74,
                    width: constraints.maxWidth,
                    padding: const EdgeInsets.only(top: 5.0),
                    child: _flag
                        ? _stdSelected != null
                            ? ListOFSubjects(_stdSelected)
                            : ListOFStandard(
                                selectSTD: selectSTD,
                                stdList: widget._std,
                              )
                        : HistoryBox()
                  )
                ],
              );
            })));
  }
}
