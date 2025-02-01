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
import 'package:grammafy/widgets/error.dart';
import 'package:grammafy/widgets/loading.dart';
import 'package:grammafy/widgets/snackbar.dart';
import 'package:grammafy/widgets/typing_text_animated.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageView> {
  final TextEditingController questionTextController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  final List<Widget> _messages = [];

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    });
  }

  void _sendMessage(BuildContext context, String question) {
    setState(() {
      _messages.add(_bubbleQuestion(question)); // Add user input
    });

    context.read<HomePageCubit>().sendQuestion(question);
  }

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
                _scrollToBottom();
                _messages.add(_answerComponent(answer));
              });
            },
            failure: (failure) {
              setState(() {
                _messages.add(
                  const ErrorView(
                      text: 'Sorry someting wrong happen! please try again.'),
                );
              });
            },
            orElse: () {},
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _messages.isNotEmpty
                ? Expanded(
                    child: ListView(
                      controller: _scrollController,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(20),
                      children: _messages,
                    ),
                  )
                : const SizedBox.shrink(),
            BlocBuilder<HomePageCubit, HomePageState>(
              builder: (context, state) {
                return state.maybeWhen(
                  initial: () => _initialView(),
                  loading: () => const LoadingView(),
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

  Widget _initialView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 48.w),
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
        TypingText(text: answer.answerText),
        SizedBox(height: 32.h),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: SvgPicture.asset('assets/images/logo.svg',
                  width: 60.w, height: 60.h),
            ),
            IconButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: answer.answerText))
                    .then((value) {
                  SnackbarWidget.show(
                    context: context,
                    type: SnackbarType.DEFAULT,
                    text: 'Copied to clipboard',
                    icon: Icons.check_circle_outline,
                    alignment: SnackbarAlignment.TOP,
                  );
                });
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
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onFieldSubmitted: (value) {
                      if (value == '') {
                        SnackbarWidget.show(
                          context: context,
                          type: SnackbarType.ERROR,
                          text: 'Please add your text first',
                          alignment: SnackbarAlignment.TOP,
                        );
                      } else {
                        _sendMessage(context, value.trim());
                        questionTextController.text = '';
                      }
                    },
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () async {
                    ClipboardData? data =
                        await Clipboard.getData(Clipboard.kTextPlain);
                    if (data != null) {
                      setState(() {
                        questionTextController.text = data.text ?? "";
                      });
                    }
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
