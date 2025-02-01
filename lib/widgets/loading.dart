import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grammafy/themes/base_colors.dart';
import 'package:grammafy/themes/base_text_style.dart';

class LoadingView extends StatefulWidget {
  const LoadingView({super.key});

  @override
  _LoadingViewState createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _opacityAnimation =
        Tween<double>(begin: 0.6, end: 1.0).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _opacityAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: _loadingView(),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _loadingView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 40.h),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: SvgPicture.asset('assets/images/logo.svg',
                width: 60.w, height: 60.h),
          ),
          const SizedBox(width: 12),
          Text(
            'Grammafy is working ...',
            style: BaseTextStyle.bodySmall.copyWith(
              color: BaseColors.neutralColor,
              fontSize: 38.sp,
            ),
          ),
        ],
      ),
    );
  }
}
