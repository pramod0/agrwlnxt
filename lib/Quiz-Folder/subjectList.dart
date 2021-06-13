import 'package:agrwlnxt/Quiz-Folder/topicsForSubject.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListOFSubjects extends StatefulWidget {
  final String _standard;

  ListOFSubjects(this._standard);

  @override
  _ListOFSubjectsState createState() => _ListOFSubjectsState();
}

class _ListOFSubjectsState extends State<ListOFSubjects> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('/Quiz/${widget._standard}/Subjects')
            .snapshots(),
        builder: (context, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.cyan.withOpacity(0.2), Colors.cyan],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(10)),
                child: ExpansionTile(
                  key: PageStorageKey<String>('${widget._standard}'),
                  backgroundColor: Colors.white,
                  title: Text(streamSnapshot.data.docs[index].id,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  childrenPadding: const EdgeInsets.all(10),
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        color: Colors.grey[350],
                        child: Topics(
                            subject: streamSnapshot.data.docs[index].id,
                            standard: widget._standard))
                  ],
                ),
              );
            },
            itemCount: streamSnapshot.data.docs.length,
          );
        });
  }
}

/*
ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(top: 5, bottom: 5),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.cyan.withOpacity(0.2),
                Colors.cyan
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
*/
