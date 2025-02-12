import 'dart:ui';

import 'package:grammafy/themes/colors/color_swatch.dart';

extension BaseColors on Color {
  static const Color primaryColor = GrammafyColorPalletes.greenishCyanSwatch;
  static const Color blackColor = GrammafyColorPalletes.blackSwatch;
  static const Color neutralColor = GrammafyColorPalletes.neutralSwatch;
  static const Color greenColor = GrammafyColorPalletes.greenCustomSwatch;
  static const Color redColor = GrammafyColorPalletes.redCustomSwatch;

  /// -------------------
  /// Primary Accent (pma)
  /// -------------------
  static Color get pmaSubtle =>
      GrammafyColorPalletes.greenishCyanSwatch.shade50;
  static Color get pmaMuted =>
      GrammafyColorPalletes.greenishCyanSwatch.shade200;
  static Color get pmaDim => GrammafyColorPalletes.greenishCyanSwatch.shade500;
  static Color get pmaBold => GrammafyColorPalletes.greenishCyanSwatch.shade700;
  static Color get pmaStrong =>
      GrammafyColorPalletes.greenishCyanSwatch.shade800;
  static Color get pmaIntense => const Color.fromARGB(255, 1, 37, 38);

  /// --------------------
  /// Background Color (bg)
  /// ---------------------
  /// Foregrounds are semantic tokens with specific usage for text and icon colors.
  static Color get bgCanvas => GrammafyColorPalletes.blackSwatch.shade700;
  static Color get bgMuted => GrammafyColorPalletes.blackSwatch.shade600;
  static Color get bgSubtle => GrammafyColorPalletes.blackSwatch.shade500;

  static Color get bgSuccess => GrammafyColorPalletes.greenCustomSwatch.shade50;
  static Color get bgSuccessConstrast =>
      GrammafyColorPalletes.greenCustomSwatch.shade600;

  static Color get bgError => GrammafyColorPalletes.redCustomSwatch.shade50;
  static Color get bgErrorConstrast =>
      GrammafyColorPalletes.redCustomSwatch.shade600;

  static Color get dividerMuted =>
      GrammafyColorPalletes.neutralSwatch.withOpacity(0.2);
}
