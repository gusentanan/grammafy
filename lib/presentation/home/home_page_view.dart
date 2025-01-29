import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grammafy/domain/models/chat_answer_model.dart';
import 'package:grammafy/presentation/home/state/home_page_cubit.dart';
import 'package:grammafy/themes/base_colors.dart';
import 'package:grammafy/themes/base_text_style.dart';
import 'package:grammafy/widgets/chip.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageView> {
  final TextEditingController questionTextController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final List<Widget> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            text: 'Grammafy',
            style: BaseTextStyle.displayLarge.copyWith(
              color: BaseColors.primaryColor.withOpacity(0.5),
            ),
          ),
        ),
      ),
      body: BlocListener<HomePageCubit, HomePageState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (answer) {
              setState(() {
                _messages.add(_answerComponent(answer));
              });
            },
            failure: (failure) {
              setState(() {
                _messages.add(Center(
                    child: Text(
                  failure.value,
                  style: BaseTextStyle.displayLarge
                      .copyWith(color: BaseColors.neutralColor),
                )));
              });
            },
            orElse: () {},
          );
        },
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: _messages,
              ),
            ),
            BlocBuilder<HomePageCubit, HomePageState>(
              builder: (context, state) {
                return state.maybeWhen(
                  initial: () => _initialView(),
                  loading: () => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  orElse: () => const SizedBox.shrink(),
                );
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: _bottomTextField(context),
    );
  }

  void _sendMessage(BuildContext context, String question) {
    setState(() {
      _messages.add(_bubbleQuestion(question)); // Add user input
    });

    context.read<HomePageCubit>().sendQuestion(question);
  }

  //TODO: bottom overflow after displaying keyboard
  Widget _initialView() {
    return Expanded(
      child: Column(
        children: [
          SvgPicture.asset('assets/images/logo.svg',
              width: 78.w, height: 140.h),
          const SizedBox(height: 20),
          Text(
            'Write a text so I can help you make it better!',
            textAlign: TextAlign.center,
            style: BaseTextStyle.displayLarge.copyWith(
              color: BaseColors.neutralColor,
              fontSize: 72.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bubbleQuestion(String question) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 32.h),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: BaseColors.bgSubtle,
        border: Border.all(color: BaseColors.dividerMuted, width: 1.0),
      ),
      child: Text(
        question,
        style: BaseTextStyle.bodyLarge.copyWith(
          color: BaseColors.neutralColor,
          fontSize: 42.sp,
        ),
      ),
    );
  }

  Widget _answerComponent(ChatAnswerModel answer) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Here's the corrected grammar:\n${answer.answerText}",
          style: BaseTextStyle.bodyLarge.copyWith(
            color: BaseColors.neutralColor,
            fontSize: 48.sp,
          ),
        ),
        SizedBox(height: 20.h),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: SvgPicture.asset('assets/images/logo.svg',
                  width: 60.w, height: 60.h),
            ),
            IconButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: answer.answerText));
              },
              icon: Icon(Icons.copy_all_outlined, color: BaseColors.pmaBold),
            ),
            const Spacer(),
            Text(
              'Grammafy can make mistakes.\nPlease double-check',
              style: BaseTextStyle.bodySmall.copyWith(
                color: BaseColors.neutralColor,
                fontSize: 30.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _bottomTextField(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: 350.h,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
          ),
          color: BaseColors.bgSubtle,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: questionTextController,
                    focusNode: _focusNode,
                    textInputAction: TextInputAction.done,
                    style: BaseTextStyle.displayMedium.copyWith(
                      color: BaseColors.neutralColor,
                    ),
                    decoration: InputDecoration(
                      hintText: "Chat with Grammafy",
                      hintStyle: BaseTextStyle.displayMedium.copyWith(
                        color: BaseColors.neutralColor.withOpacity(0.6),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onFieldSubmitted: (value) {
                      _sendMessage(context, value);
                      questionTextController.text = '';
                    },
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    questionTextController.text = ""; // Clear input
                  },
                  icon: Icon(Icons.paste_outlined, color: BaseColors.pmaBold),
                  style: IconButton.styleFrom(
                    backgroundColor: BaseColors.pmaIntense,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                const ToneChip(subjectName: 'Formal'),
                SizedBox(width: 20.w),
                const ToneChip(subjectName: 'Semi-formal'),
                SizedBox(width: 20.w),
                const ToneChip(subjectName: 'Friendly'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
