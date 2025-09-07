enum ToneType { 
  formal,     // Professional, business-like
  neutral,    // Balanced, general purpose - DEFAULT
  friendly    // Casual, conversational
}

extension ToneTypeExtension on ToneType {
  String get displayName {
    switch (this) {
      case ToneType.formal:
        return 'Formal';
      case ToneType.neutral:
        return 'Neutral';
      case ToneType.friendly:
        return 'Friendly';
    }
  }
}