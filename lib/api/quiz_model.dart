// To parse this JSON data, do
//
//     final quizModel = quizModelFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

List<QuizModel?> quizModelFromJson(String? str) {
  try {
    return List<QuizModel>.from(json.decode(str!).map((x) => QuizModel.fromJson(x)));
  } on Exception catch (e) {
    return [];
  }
}

String quizModelToJson(List<QuizModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuizModel {
  QuizModel({
    this.id,
    this.question,
    this.description,
    this.answers,
    this.multipleCorrectAnswers,
    this.correctAnswers,
    this.correctAnswer,
    this.explanation,
    this.tip,
    this.tags,
    this.category,
    this.difficulty,
    this.selected

  });

  int? id;
  String? question;
  dynamic description;
  Answers? answers;
  String?multipleCorrectAnswers;
  CorrectAnswers? correctAnswers;
  String? correctAnswer;
  dynamic explanation;
  dynamic tip;
  List<Tag>? tags;
  String? category;
  String? difficulty;
  var selected;

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
    id: json["id"] == null ? null : json["id"],
    question: json["question"] == null ? null : json["question"],
    description: json["description"],
    answers: json["answers"] == null ? null : Answers.fromJson(json["answers"]),
    multipleCorrectAnswers: json["multiple_correct_answers"] == null ? null : json["multiple_correct_answers"],
    correctAnswers: json["correct_answers"] == null ? null : CorrectAnswers.fromJson(json["correct_answers"]),
    correctAnswer: json["correct_answer"] == null ? '' : json["correct_answer"],
    explanation: json["explanation"],
    tip: json["tip"],
    tags: json["tags"] == null ? null : List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
    category: json["category"] == null ? null : json["category"],
    difficulty: json["difficulty"] == null ? null : json["difficulty"],
    selected: false.obs
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "question": question == null ? null : question,
    "description": description,
    "answers": answers == null ? null : answers!.toJson(),
    "multiple_correct_answers": multipleCorrectAnswers == null ? null : multipleCorrectAnswers,
    "correct_answers": correctAnswers == null ? null : correctAnswers!.toJson(),
    "correct_answer": correctAnswer == null ? null : correctAnswer,
    "explanation": explanation,
    "tip": tip,
    "tags": tags == null ? null : List<dynamic>.from(tags!.map((x) => x.toJson())),
    "category": category == null ? null : category,
    "difficulty": difficulty == null ? null : difficulty,
  };
}

class Answers {
  Answers({
    this.answerA,
    this.answerB,
    this.answerC,
    this.answerD,
    this.answerE,
    this.answerF,
    this.isSelected
  });

  String? answerA;
  String? answerB;
  String?answerC;
  String ?answerD;
  dynamic answerE;
  dynamic answerF;
  var isSelected;

  factory Answers.fromJson(Map<String, dynamic> json) => Answers(
    answerA: json["answer_a"] == null ? '' : json["answer_a"],
    answerB: json["answer_b"] == null ? '' : json["answer_b"],
    answerC: json["answer_c"] == null ? '' : json["answer_c"],
    answerD: json["answer_d"] == null ? '' : json["answer_d"],
    answerE: json["answer_e"],
    answerF: json["answer_f"],
    isSelected: false.obs
  );

  Map<String, dynamic> toJson() => {
    "answer_a": answerA == null ? null : answerA,
    "answer_b": answerB == null ? null : answerB,
    "answer_c": answerC == null ? null : answerC,
    "answer_d": answerD == null ? null : answerD,
    "answer_e": answerE,
    "answer_f": answerF,
  };
}

class CorrectAnswers {
  CorrectAnswers({
    this.answerACorrect,
    this.answerBCorrect,
    this.answerCCorrect,
    this.answerDCorrect,
    this.answerECorrect,
    this.answerFCorrect,
  });

  String? answerACorrect;
  String? answerBCorrect;
  String? answerCCorrect;
  String? answerDCorrect;
  String? answerECorrect;
  String? answerFCorrect;

  factory CorrectAnswers.fromJson(Map<String, dynamic> json) => CorrectAnswers(
    answerACorrect: json["answer_a_correct"] == null ? null : json["answer_a_correct"],
    answerBCorrect: json["answer_b_correct"] == null ? null : json["answer_b_correct"],
    answerCCorrect: json["answer_c_correct"] == null ? null : json["answer_c_correct"],
    answerDCorrect: json["answer_d_correct"] == null ? null : json["answer_d_correct"],
    answerECorrect: json["answer_e_correct"] == null ? null : json["answer_e_correct"],
    answerFCorrect: json["answer_f_correct"] == null ? null : json["answer_f_correct"],
  );

  Map<String, dynamic> toJson() => {
    "answer_a_correct": answerACorrect == null ? null : answerACorrect,
    "answer_b_correct": answerBCorrect == null ? null : answerBCorrect,
    "answer_c_correct": answerCCorrect == null ? null : answerCCorrect,
    "answer_d_correct": answerDCorrect == null ? null : answerDCorrect,
    "answer_e_correct": answerECorrect == null ? null : answerECorrect,
    "answer_f_correct": answerFCorrect == null ? null : answerFCorrect,
  };
}

class Tag {
  Tag({

    this.name,
  });

  String? name;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
  };
}
