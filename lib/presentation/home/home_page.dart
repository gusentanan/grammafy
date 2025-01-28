import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grammafy/themes/base_colors.dart';
import 'package:grammafy/themes/base_text_style.dart';
import 'package:grammafy/widgets/chip.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool initialState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomTextField(),
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
            text: TextSpan(
                text: 'Grammafy',
                style: BaseTextStyle.displayLarge.copyWith(
                    color: BaseColors.primaryColor.withOpacity(0.5)))),
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: initialState
              ? _initialView()
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _bubbleQuestion(),
                      SizedBox(height: 32.h),
                      _answerComponent(),
                    ],
                  ),
                )),
    );
  }

  Widget _initialView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/logo.svg',
          width: 78.w,
          height: 140.h,
        ),
        const SizedBox(height: 20),
        Text(
          'Write a text so I can help you to make it better!',
          textAlign: TextAlign.center,
          style: BaseTextStyle.displayLarge.copyWith(
            color: BaseColors.neutralColor,
            fontSize: 72.sp,
          ),
        )
      ],
    );
  }

  Widget _bottomTextField() {
    return Container(
      height: 350.h,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: BaseColors.bgSubtle),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Chat with Grammafy',
                style: BaseTextStyle.displayMedium
                    .copyWith(color: BaseColors.neutralColor),
              ),
              IconButton(
                onPressed: () {
                  // Define the action when the button is pressed
                },
                icon: Icon(
                  Icons.paste_outlined,
                  color: BaseColors.pmaBold,
                  size: 20,
                ),
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
              const ToneChip(
                subjectName: 'Formal',
              ),
              SizedBox(width: 20.w),
              const ToneChip(
                subjectName: 'Semi-formal',
              ),
              SizedBox(width: 20.w),
              const ToneChip(
                subjectName: 'Friendly',
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _bubbleQuestion() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: BaseColors.dividerMuted,
            width: 1.0,
          )),
      padding: const EdgeInsets.all(12),
      child: Text(
        'Please correct this grammar: Hello me name is Bagus',
        style: BaseTextStyle.bodyLarge
            .copyWith(color: BaseColors.neutralColor, fontSize: 42.sp),
      ),
    );
  }

  Widget _answerComponent() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Here's the corrected grammar: \nHello my name is Bagus",
            style: BaseTextStyle.bodyLarge
                .copyWith(color: BaseColors.neutralColor, fontSize: 48.sp),
          ),
          SizedBox(height: 32.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SvgPicture.asset(
                  'assets/images/logo.svg',
                  width: 60.w,
                  height: 60.h,
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.copy_all_outlined,
                    color: BaseColors.pmaBold,
                  )),
              const Spacer(),
              Text(
                'Grammafy can make mistakes.\nPlease double check',
                style: BaseTextStyle.bodySmall
                    .copyWith(color: BaseColors.neutralColor, fontSize: 30.sp),
              )
            ],
          )
        ],
      ),
    );
  }
}
