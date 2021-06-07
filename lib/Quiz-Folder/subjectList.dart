import 'package:agrwlnxt/Quiz-Folder/topicsForSubject.dart';
import 'package:flutter/material.dart';

class ListOFSubjects extends StatefulWidget {
  final String _standard;

  ListOFSubjects(this._standard);

  @override
  _ListOFSubjectsState createState() => _ListOFSubjectsState();
}

class _ListOFSubjectsState extends State<ListOFSubjects> {
  Map _subjects;

  @override
  void initState() {
    _subjects = {
      '10': ['Science', 'Mathematics', 'History', 'Geography', 'English'],
      '11-Sci': ['Mathematics', 'Chemistry', 'Biology', 'Physics', 'English'],
      '11-Comm': [
        'Accountancy',
        'Business Studies',
        'Economics',
        'Mathematics',
        'English'
      ],
      '12-Sci': ['Mathematics', 'Chemistry', 'Biology', 'Physics', 'English'],
      '12-Comm': [
        'Accountancy',
        'Business Studies',
        'Economics',
        'Mathematics',
        'English'
      ]
    };
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(top: 5, bottom: 5),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.blue.withOpacity(0.2),
                Colors.blue
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(10)),
          child: ExpansionTile(
            key: PageStorageKey<String>('${widget._standard}'),
            backgroundColor: Colors.white,
            title: Text(_subjects[widget._standard][index],style: TextStyle(fontWeight: FontWeight.bold)),
            childrenPadding: const EdgeInsets.all(10),
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                color: Colors.grey[350],
                child:Topics(subject:_subjects[widget._standard][index],standard:widget._standard)
              )
            ],
          ),
        );
      },
      itemCount: _subjects[widget._standard].length,
    );
  }
}