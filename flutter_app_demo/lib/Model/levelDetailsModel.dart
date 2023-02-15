import 'dart:convert';

List<LevelDetailsModel> levelDetailsModelFromJson(String str) => List<LevelDetailsModel>.from(json.decode(str).map((x) => LevelDetailsModel.fromJson(x)));
String levelDetailsModelToJson(List<LevelDetailsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LevelDetailsModel {
    String imagename;
    int id;
    String question;
    String answer;
    String answerText;

    LevelDetailsModel({
        required this.imagename,
        required this.id,
        required this.question,
        required this.answer,
        required this.answerText,
    });
   
    factory LevelDetailsModel.fromJson(Map<String, dynamic> json) => LevelDetailsModel(
        imagename: json["imagename"],
        id: json["id"],
        question: json["question"],
        answer: json["answer"],
        answerText: json["answerText"],
    );

    Map<String, dynamic> toJson() => {
        "imagename": imagename,
        "id": id,
        "question": question,
        "answer": answer,
        "answerhint": answerText,
    };
}