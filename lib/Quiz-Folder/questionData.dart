import 'package:flutter/foundation.dart';

class Question
{
  static List <String> questionList = [
    "",
    "Who is the current Prime Minister of India ?",
    "Exposure to sunlight helps a person improve his health because ?",
    "Deeksha appeared with the film Shubh Aarambh, coordinated by Amit Barot. She at that point featured in other two films Karsandas Pay and Use and Colorbaaj. Karsandas Pay and Use was her first successful film. Her next venture was Sharato Lagu close by Malhar Thakkar. This was additionally a business achievement. She won the GIFA best entertainer of the year for her function in Sharato Lagu. The film and her performance was both basically and industrially acclaimed. Her next endeavor was Dhunki featuring with Pratik Gandhi which was acclaimed basically.Deeksha got the Critics’ Choice Film Awards Best Actress for Dhunki. Deeksha did the nominal function in the rom-com movie Luv Ni Love Storys coordinated by Durgesh Tanna which was likewise delivered in 2020. She will make her Bollywood debut with the Ranveer Singh starrer Jayeshbhai Jordaar coordinated by Divyang Thakkar. She will be additionally observing in Chandresh Bhatt’s untitled endeavor inverse Esha Kansara and Gaurav Paswala.",
    "AB is a chord of the circle and AOC is its diameter such that angle ACB = 50°. If AT is the tangent to the circle at the point A, then BAT is equal to",
    "The coordinates of a point P, where PQ is the diameter of circle whose centre is (2, – 3) and Q is (1, 4) is:"
  ];

  static List <int>choosenOption = List(questionList.length); 
}

class Answers
{
  static List <int> answers = [0,1,2,3,4,1];
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

