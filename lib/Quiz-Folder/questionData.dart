import 'package:flutter/foundation.dart';

class Question
{
  static List <String> questionList = [
    "",
    "HCF of 8, 9, 25 is : ",
    "The product of a rational and irrational number is : ",
    "The sum of a rational and irrational number is : ",
    " If b = 3, then any integer can be expressed as a = ",
    "The product of three consecutive positive integers is divisible by ",
    "The set A = {0,1, 2, 3, 4, …} represents the set of ",
    " LCM of the given number ‘x’ and ‘y’ where y is a multiple of ‘x’ is given by",
    "The largest number that will divide 398,436 and 542 leaving remainders 7,11 and 15 respectively is ",
    "There are 312, 260 and 156 students in class X, XI and XII respectively. Buses are to be hired to take these students to a picnic. Find the maximum number of students who can sit in a bus if each bus takes equal number of students ",
    "There is a circular path around a sports field. Priya takes 18 minutes to drive one round of the field. Harish takes 12 minutes. Suppose they both start at the same point and at the same time and go in the same direction. After how many minutes will they meet ? ",
    "Three farmers have 490 kg, 588 kg and 882 kg of wheat respectively. Find the maximum capacity of a bag so that the wheat can be packed in exact number of bags.",
    "For some integer p, every even integer is of the form",
    "m² – 1 is divisible by 8, if m is ",
  ];

  static List <int>choosenOption = List(questionList.length); 
}

class Answers
{
  static List <int> answers = [0,4,2,2,1,2,1,2,1,1,1,1,2,2];
}

class Options
{
  static List<Map> options = [
    {},
    {1:'8',2:'9',3:'24',4:'1'},
    {1:'Rational',2:'Irrational',3:'Both of above',4:'None of above'},
    {1:'Rational',2:'Irrational',3:'Both of above',4:'None of above'},
    {1:'3q, 3q+ 1, 3q + 2',2:'3q',3:'3q+1',4:'None of above'},
    {1:'4',2:'6',3:'No common factor',4:'Only one'},
    {1:'Whole numbers',2:'Integers',3:'Natural Numbers',4:'Even Numbers'},
    {1:'x',2:'y',3:'x*y',4:'x/y'},
    {1:'17',2:'11',3:'34',4:'45'},
    {1:'52',2:'56',3:'48',4:'63'},
    {1:'36 min',2:'18 min',3:'6 min',4:'They will not meet'},
    {1:'98 KG',2:'290 KG',3:'200 KG',4:'350 KG'},
    {1:'2p + 1',2:'2p',3:'p + 1',4:'p'},
    {1:'an even integer',2:'an odd integer',3:'a natural number',4:'a whole number'}
  ];
}

class QuizHistory
{
  final String id;
  final String marks;
  final String std;
  final String topic;
  final DateTime date;

  QuizHistory({
    @required this.id,
    @required this.marks,
    @required this.std,
    @required this.topic,
    @required this.date
  });

  static List <QuizHistory> userData = [];
}

