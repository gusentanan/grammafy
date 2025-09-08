import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:grammafy/domain/models/chat_answer_model.dart';
import 'package:grammafy/utils/extensions.dart';
import 'package:grammafy/widgets/action_button.dart';
import 'package:grammafy/widgets/snackbar.dart';
import 'package:grammafy/widgets/typing_text_animated.dart';

class AnswerWidget extends StatefulWidget {
  final ChatAnswerModel answer;
  final Function(ChatAnswerModel) onRefresh;

  const AnswerWidget({
    super.key,
    required this.answer,
    required this.onRefresh,
  });

  @override
  State<AnswerWidget> createState() => AnswerWidgetState();
}

class AnswerWidgetState extends State<AnswerWidget> {
  late ChatAnswerModel currentAnswer;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    currentAnswer = widget.answer;
  }

  void updateAnswer(ChatAnswerModel newAnswer) {
    setState(() {
      currentAnswer = newAnswer;
      isLoading = false;
    });
  }

  void startLoading() {
    setState(() {
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isLoading
              ? const SizedBox.shrink()
              : TypingText(text: currentAnswer.answerText),
          SizedBox(height: 42.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ActionButton(
                icon: Icons.copy_all_outlined,
                onTap: () {
                  String answers = currentAnswer.answerText.trimFirstLine();
                  Clipboard.setData(ClipboardData(text: answers)).then((_) {
                    SnackbarWidget.show(
                      context: context,
                      type: SnackbarType.DEFAULT,
                      text: 'Copied to clipboard',
                      icon: Icons.check_circle_outline,
                      alignment: SnackbarAlignment.TOP,
                    );
                  });
                },
                padding: EdgeInsets.zero,
              ),
              SizedBox(width: 42.w),
              ActionButton(
                icon: Icons.share,
                onTap: () {
                  String answers = currentAnswer.answerText.trimFirstLine();
                  Share.share(answers,
                      subject: 'Grammar correction from Grammafy');
                },
                padding: EdgeInsets.zero,
              ),
              SizedBox(width: 42.w),
              ActionButton(
                icon: Icons.refresh,
                onTap: () {
                  startLoading();
                  widget.onRefresh(currentAnswer);
                },
                padding: EdgeInsets.zero,
              ),
            ],
          ),
        ],
      ),
    );
  }
}