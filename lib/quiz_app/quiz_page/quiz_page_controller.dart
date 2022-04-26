import 'package:get/get.dart';
import 'package:quizateam/api/http_request.dart';
import 'package:quizateam/api/quiz_model.dart';

enum AppListState{Loading,Loaded}
class QuizPagecontroller extends GetxController {
  List<QuizModel?> quizList = [];
  var state = AppListState.Loading.obs;

   var pageIndex = 0.obs;
   var optionSelected = false.obs;
   var selecteOption = ''.obs;
   var correctAns = false.obs;

  @override
  void onInit() {
    getQuestionList();
    super.onInit();
  }

  getQuestionList() async {
    state.value = AppListState.Loading;
    List<QuizModel?> model = await Repository.getQuizList();
    if(model.isNotEmpty){
      quizList = model;
    }
    state.value = AppListState.Loaded;

  }
}

