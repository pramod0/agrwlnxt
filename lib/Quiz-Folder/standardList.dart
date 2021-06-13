import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListOFStandard extends StatelessWidget {

  final Function selectSTD;
  final List stdList;
  ListOFStandard({
    @required this.selectSTD, 
    @required this.stdList
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('/Quiz').snapshots(),
      builder: (context,streamSnapshots){
        if(streamSnapshots.connectionState == ConnectionState.waiting && stdList.isEmpty)
        {
          FirebaseFirestore.instance.collection('/Quiz').snapshots().listen((element) { 
            element.docs.forEach((document) { 
              stdList.add(document.id);
            });
          });
          return Center(child:CircularProgressIndicator());
        }
        return ListView(
          children: stdList.map((standard) {
            return Container(
              margin: const EdgeInsets.only(top: 5, bottom: 5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.cyan.withOpacity(0.2),
                    Colors.cyan
                  ],
                  begin: Alignment.topLeft, end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(10)),
              child: ListTile(title: Text(standard), onTap: () => selectSTD(standard)),
            );
          }).toList(),
        );
      }
    );
  }
}


/*
ListView(
      children: stdList.map((standard) {
        return Container(
          margin: const EdgeInsets.only(top: 5, bottom: 5),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.cyan.withOpacity(0.2),
                Colors.cyan
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(10)),
          child:
              ListTile(title: Text(standard), onTap: () => selectSTD(standard)),
        );
      }).toList(),
    )
*/
