import 'package:http/http.dart' as http;
import 'package:quizateam/api/quiz_model.dart';

class Repository {
  static Future<String?> httpGet() async {
    try {
      var res = await http.get(Uri.parse(
          'https://quizapi.io/api/v1/questions?apiKey=miKa0AK6KcwHjHIFwG6AVZd4fmyOM05lenRRO78f'));
      print('res -${res.body}');
      return res.body;
    } on Exception catch (e) {
      return null;
    }
  }

  static Future<List<QuizModel?>> getQuizList()async{
    return quizModelFromJson(await httpGet());
  }



}
