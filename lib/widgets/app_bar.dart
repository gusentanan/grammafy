import 'package:flutter/material.dart';
import 'package:grammafy/themes/base_colors.dart';
import 'package:grammafy/themes/base_text_style.dart';

class CommonAppBar extends StatefulWidget implements PreferredSizeWidget {
  CommonAppBar({
    super.key,
    required this.title,
    this.enableAction = false,
    this.onTapAction,
  });

  final String title;
  bool enableAction;
  VoidCallback? onTapAction;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<StatefulWidget> createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {
  Shader _createTextGradient() {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        BaseColors.primaryColor,
        BaseColors.primaryColor.withOpacity(0.8),
        BaseColors.primaryColor.withOpacity(0.4),
        BaseColors.primaryColor.withOpacity(0.1),
      ],
      stops: const [0.0, 0.3, 0.7, 1.0],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 400.0, 100.0));
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: RichText(
        text: TextSpan(
            text: widget.title,
            style: BaseTextStyle.displayLarge
                .copyWith(foreground: Paint()..shader = _createTextGradient())),
      ),
      actions: [
        widget.enableAction
            ? IconButton(
                onPressed: widget.onTapAction,
                icon: const Icon(
                  Icons.more_vert,
                  color: BaseColors.greenColor,
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
