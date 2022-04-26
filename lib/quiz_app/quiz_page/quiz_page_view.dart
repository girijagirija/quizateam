import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizateam/api/quiz_model.dart';

import 'quiz_page_controller.dart';
import 'package:group_button/group_button.dart';

class QuizPage extends StatelessWidget {
  final controller = Get.put(QuizPagecontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.chevron_left,
              size: 35,
              color: Colors.white,
            )),
        actions: const [
          Icon(
            Icons.menu,
            size: 35,
            color: Colors.white,
          ),
          SizedBox(width: 20)
        ],
      ),
      body: Obx(() {
        switch (controller.state.value) {
          case AppListState.Loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
            break;
          case AppListState.Loaded:
            return Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.indigo, Colors.deepPurple],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight)),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 10),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.quizList.length,
                        itemBuilder: (context, index) => Obx(() {
                          return Container(
                            height: 30,
                            width: 40,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: controller.pageIndex.value == index
                                    ? Colors.white
                                    : Colors.indigo,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white)),
                            child: Center(
                                child: controller.pageIndex.value == index &&
                                        controller.correctAns.value
                                    ? Icon(
                                        Icons.check,
                                        color: Colors.green,
                                      )
                                    : controller.pageIndex.value == index &&
                                            !controller.correctAns.value &&
                                            controller.optionSelected.value
                                        ? Icon(
                                            Icons.close,
                                            color: Colors.red,
                                          )
                                        : Text(
                                            '${index + 1}',
                                            style: TextStyle(
                                                color: controller
                                                            .pageIndex.value ==
                                                        index
                                                    ? Colors.deepPurple
                                                    : Colors.white),
                                          )
                                // : controller.correctAns.value ? Icon(Icons.check) : Icon(Icons.close),
                                ),
                          );
                        }),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: PageView.builder(
                              pageSnapping: false,
                              onPageChanged: (val) {

                                controller.pageIndex.value = val;

                                // controller.correctAns.value = false;
                                controller.optionSelected.value = false;
                                // controller.quizList.forEach((element) {
                                //   if(element!.selected.value){
                                //    element.selected.value =false;
                                //   }
                                // });
                              },
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.quizList.length,
                              itemBuilder: (context, index) {
                                QuizModel? model = controller.quizList[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 6),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'Question ${index + 1} / ${controller.quizList.length}',
                                                style: const TextStyle(
                                                    color: Colors.deepPurple,
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text('${model!.question!}',
                                              style: const TextStyle(
                                                  color: Colors.deepPurple,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600)),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          GroupButton(
                                            options: GroupButtonOptions(
                                              textPadding: EdgeInsets.symmetric(horizontal: 14,vertical: 7),
                                                buttonWidth: double.infinity,
                                                direction: Axis.vertical,
                                                selectedColor:
                                                    Colors.deepPurple,
                                                unselectedColor: Colors.white,
                                                unselectedTextStyle: TextStyle(
                                                    color: Colors.deepPurple,
                                                    fontSize: 14),
                                                groupingType:
                                                    GroupingType.column,
                                                selectedTextStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14),
                                                borderRadius:
                                                    BorderRadius.circular(60),
                                                unselectedBorderColor:
                                                    Colors.deepPurple),
                                            onSelected:
                                                (value, index, isSelected) {
                                              model.selected.value =true;
                                              controller.optionSelected.value = true;
                                              if(value == model.answers!.answerA){
                                                controller.selecteOption.value = 'answer_a';
                                              }else if(value == model.answers!.answerB){
                                                controller.selecteOption.value = 'answer_b';

                                              }else if(value == model.answers!.answerC){
                                                controller.selecteOption.value = 'answer_c';

                                              }else if(value == model.answers!.answerD){
                                                controller.selecteOption.value = 'answer_d';
                                              }

                                              print('val -$value');
                                              print('controller.selecteOption.value -${controller.selecteOption.value}');
                                            },
                                            isRadio: true,
                                            buttons: [
                                              '${model.answers!.answerA!}',
                                              '${model.answers!.answerB!}',
                                              '${model.answers!.answerC!}',
                                              '${model.answers!.answerD!}'
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30))),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.orange)),
                            onPressed: () {
                              if (!controller.optionSelected.value) {
                                Get.snackbar(
                                  'Warning',
                                  'Please Select Option..!',
                                  backgroundColor: Colors.red,
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                              } else {
                                controller.quizList.where((element) => element!.selected.value).forEach((element) {
                                  if (element!.correctAnswer!.isNotEmpty &&
                                      controller.selecteOption.value ==
                                          element.correctAnswer!) {
                                    print('right ans -${element.correctAnswer}');
                                    print('opt -${controller.selecteOption.value}');
                                    controller.correctAns.value = true;
                                    print('right answer');
                                  } else {
                                    controller.correctAns.value = false;
                                  }
                                });
                              }
                            },
                            child: Text(
                              'Submit',
                              style: TextStyle(fontSize: 18),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            );
            break;
          default:
            return Container();
        }
      }),
    );
  }
}
