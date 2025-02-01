import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grammafy/themes/base_text_style.dart';
import 'package:grammafy/themes/colors/color_swatch.dart';
import 'package:grammafy/widgets/animation/animated_visibility.dart';
import 'package:grammafy/widgets/animation/base_transition.dart';

enum SnackbarType {
  SUCCESS,
  ERROR,
  INFO,
  DEFAULT,
}

enum SnackbarAlignment {
  TOP,
  CENTER,
  BOTTOM,
}

class SnackbarWidget {
  static OverlayEntry? _overlayEntry;
  static Timer? _timer;

  static void show({
    required BuildContext context,
    required SnackbarType type,
    required String text,
    IconData? icon, // Optional icon
    required SnackbarAlignment alignment,
    int? timeDuration = 2,
  }) {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _timer?.cancel();
    }

    _overlayEntry = _createSnackbarWithOverlay(
      context,
      type,
      text,
      icon,
      alignment,
      timeDuration!,
    );

    _insertOverlay(context, timeDuration);
  }

  static void _insertOverlay(BuildContext context, int duration) {
    Navigator.of(context).overlay!.insert(_overlayEntry!);
    _timer = Timer(Duration(seconds: duration), () {
      if (_overlayEntry != null) {
        _overlayEntry?.remove();
        _overlayEntry = null;
        _timer?.cancel();
      }
    });
  }

  static OverlayEntry _createSnackbarWithOverlay(
    BuildContext context,
    SnackbarType type,
    String text,
    IconData? icon,
    SnackbarAlignment alignment,
    int timeDuration,
  ) {
    return OverlayEntry(
      builder: (context) => _SnackbarContainer(
        type: type,
        text: text,
        icon: icon,
        alignment: alignment,
        duration: timeDuration,
      ),
    );
  }
}

class _SnackbarContainer extends StatefulWidget {
  final SnackbarType type;
  final String text;
  final IconData? icon;
  final SnackbarAlignment alignment;
  final int duration;

  const _SnackbarContainer({
    Key? key,
    required this.type,
    required this.text,
    this.icon, // Optional icon
    required this.alignment,
    required this.duration,
  }) : super(key: key);

  @override
  _SnackbarContainerState createState() => _SnackbarContainerState();
}

class _SnackbarContainerState extends State<_SnackbarContainer> {
  bool _isVisible = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isVisible = true;
        // Timer on hiding the overlay container and animation must be different
        _timer = Timer(Duration(seconds: widget.duration - 1), () {
          setState(() {
            _isVisible = false;
          });
        });
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top:
              widget.alignment == SnackbarAlignment.TOP ? kToolbarHeight : null,
          bottom: widget.alignment == SnackbarAlignment.BOTTOM
              ? kToolbarHeight
              : null,
          child: AnimatedVisibility(
            visible: _isVisible,
            enter: fadeIn(),
            exit: fadeOut(),
            enterDuration: const Duration(milliseconds: 500),
            exitDuration: const Duration(milliseconds: 500),
            child: _customToast(widget.type, widget.text, widget.icon),
          ),
        ),
      ],
    );
  }

  Widget _customToast(SnackbarType type, String text, IconData? icon) {
    Color color;
    switch (type) {
      case SnackbarType.SUCCESS:
        color = GrammafyColorPalletes.greenCustomSwatch.shade700;
        break;
      case SnackbarType.ERROR:
        color = GrammafyColorPalletes.redCustomSwatch.shade700;
        break;
      case SnackbarType.INFO:
        color = GrammafyColorPalletes.blackSwatch.shade400;
        break;
      case SnackbarType.DEFAULT:
        color = Colors.black;
        break;
    }

    // Provide default icon if not provided
    IconData defaultIcon;
    switch (type) {
      case SnackbarType.SUCCESS:
        defaultIcon = Icons.check_circle_outline;
        break;
      case SnackbarType.ERROR:
        defaultIcon = Icons.error_outline;
        break;
      case SnackbarType.INFO:
        defaultIcon = Icons.info_outline;
        break;
      case SnackbarType.DEFAULT:
        defaultIcon = Icons.task_alt_outlined;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            icon ?? defaultIcon,
            color: Colors.white,
          ), // Use provided or default icon
          const SizedBox(width: 8),
          Text(
            text,
            style: BaseTextStyle.displayMedium.copyWith(
              color: Colors.white,
              fontSize: 16,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
