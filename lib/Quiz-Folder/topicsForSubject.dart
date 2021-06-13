import 'package:agrwlnxt/Quiz-Folder/quizForTopic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Topics extends StatefulWidget {
  final String subject;
  final String standard;
  Topics({this.subject, this.standard});

  @override
  _TopicsState createState() => _TopicsState();
}

class _TopicsState extends State<Topics> {
  final ScrollController _controller = ScrollController();

  void _openQuiz(BuildContext context, String std, String subject, String topic) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            QuizBox(std: std, subject: subject, topic: topic)));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection(
                '/Quiz/${widget.standard}/Subjects/${widget.subject}/Topics')
            .snapshots(),
        builder: (context, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final List documents = streamSnapshot.data.docs;
          return documents.isEmpty
              ? Center(child: const Text('Not yet available',style: TextStyle(fontWeight: FontWeight.bold)))
              : Scrollbar(               
                  controller: _controller,
                  child: ListView.builder(
                    controller: _controller,
                    key: PageStorageKey('${widget.subject}'),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return TextButton(
                        child: Text(documents[index].id,
                            style: TextStyle(color: Colors.black)),
                        onPressed: () => _openQuiz(context, widget.standard,
                            widget.subject, documents[index].id),
                      );
                    },
                    itemCount: documents.length,
                  ),
                );
        });
  }
}
