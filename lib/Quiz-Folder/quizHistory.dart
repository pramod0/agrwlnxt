import 'package:flutter/material.dart';
import 'questionData.dart';
import 'package:intl/intl.dart';

class HistoryBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return QuizHistory.userData.isEmpty
          ? Center(child: Text('No History'))
          : ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  height: constraints.maxHeight * 0.15,
                  width: constraints.maxWidth,
                  margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                  color: Colors.yellow[700].withOpacity(0.6),
                  child: ListTile(
                    leading: Text('\n${QuizHistory.userData[index].std}'),
                    title: Text(QuizHistory.userData[index].topic),   
                    trailing: Text(QuizHistory.userData[index].marks),
                    subtitle: Text(DateFormat.yMd("en_US")
                        .format(QuizHistory.userData[index].date)),
                  ),
                );
              },
              itemCount: QuizHistory.userData.length,
            );
    });
  }
}
