class ThemeValues {
  ThemeValues({
    this.applyElevationOverlayColor,
    this.brightness,
    this.buttonTheme,
    this.canvasColor,
    this.cardColor,
    this.colorScheme,
    this.dialogBackgroundColor,
    this.disabledColor,
    this.dividerColor,
    this.focusColor,
    this.highlightColor,
    this.hintColor,
    this.hoverColor,
    this.indicatorColor,
    this.inputDecorationTheme,
    this.materialTapTargetSize,
    this.platform,
    this.primaryColor,
    this.primaryColorDark,
    this.primaryColorLight,
    this.primaryIconTheme,
    this.primaryTextTheme,
    this.scaffoldBackgroundColor,
    this.secondaryHeaderColor,
    this.shadowColor,
    this.splashColor,
    this.splashFactory,
    this.textTheme,
    this.typography,
    this.unselectedWidgetColor,
    this.useMaterial3,
    this.visualDensity,
  });
  ThemeValues.fromJson(Map<String, dynamic> json) {
    applyElevationOverlayColor = json['applyElevationOverlayColor'] as bool?;
    brightness = json['brightness'] as String?;
    buttonTheme = json['buttonTheme'] != null
        ? ButtonTheme.fromJson(json['buttonTheme'] as Map<String, dynamic>)
        : null;
    canvasColor = json['canvasColor'] as String?;
    cardColor = json['cardColor'] as String?;
    colorScheme = json['colorScheme'] != null
        ? ColorScheme.fromJson(json['colorScheme'] as Map<String, dynamic>)
        : null;
    dialogBackgroundColor = json['dialogBackgroundColor'] as String?;
    disabledColor = json['disabledColor'] as String?;
    dividerColor = json['dividerColor'] as String?;
    focusColor = json['focusColor'] as String?;
    highlightColor = json['highlightColor'] as String?;
    hintColor = json['hintColor'] as String?;
    hoverColor = json['hoverColor'] as String?;
    indicatorColor = json['indicatorColor'] as String?;
    inputDecorationTheme = json['inputDecorationTheme'] != null
        ? InputDecorationTheme.fromJson(
            json['inputDecorationTheme'] as Map<String, dynamic>,
          )
        : null;
    materialTapTargetSize = json['materialTapTargetSize'] as String?;
    platform = json['platform'] as String?;
    primaryColor = json['primaryColor'] as String?;
    primaryColorDark = json['primaryColorDark'] as String?;
    primaryColorLight = json['primaryColorLight'] as String?;
    primaryIconTheme = json['primaryIconTheme'] != null
        ? PrimaryIconTheme.fromJson(
            json['primaryIconTheme'] as Map<String, dynamic>,
          )
        : null;
    primaryTextTheme = json['primaryTextTheme'] != null
        ? PrimaryTextTheme.fromJson(
            json['primaryTextTheme'] as Map<String, dynamic>,
          )
        : null;
    scaffoldBackgroundColor = json['scaffoldBackgroundColor'] as String?;
    secondaryHeaderColor = json['secondaryHeaderColor'] as String?;
    shadowColor = json['shadowColor'] as String?;
    splashColor = json['splashColor'] as String?;
    splashFactory = json['splashFactory'] as String?;
    textTheme = json['textTheme'] != null
        ? PrimaryTextTheme.fromJson(json['textTheme'] as Map<String, dynamic>)
        : null;
    typography = json['typography'] != null
        ? Typography.fromJson(json['typography'] as Map<String, dynamic>)
        : null;
    unselectedWidgetColor = json['unselectedWidgetColor'] as String?;
    useMaterial3 = json['useMaterial3'] as bool?;
    visualDensity = json['visualDensity'] as String?;
  }
  bool? applyElevationOverlayColor;
  String? brightness;
  ButtonTheme? buttonTheme;
  String? canvasColor;
  String? cardColor;
  ColorScheme? colorScheme;
  String? dialogBackgroundColor;
  String? disabledColor;
  String? dividerColor;
  String? focusColor;
  String? highlightColor;
  String? hintColor;
  String? hoverColor;
  String? indicatorColor;
  InputDecorationTheme? inputDecorationTheme;
  String? materialTapTargetSize;
  String? platform;
  String? primaryColor;
  String? primaryColorDark;
  String? primaryColorLight;
  PrimaryIconTheme? primaryIconTheme;
  PrimaryTextTheme? primaryTextTheme;
  String? scaffoldBackgroundColor;
  String? secondaryHeaderColor;
  String? shadowColor;
  String? splashColor;
  String? splashFactory;
  PrimaryTextTheme? textTheme;
  Typography? typography;
  String? unselectedWidgetColor;
  bool? useMaterial3;
  String? visualDensity;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['applyElevationOverlayColor'] = applyElevationOverlayColor;
    data['brightness'] = brightness;
    if (buttonTheme != null) {
      data['buttonTheme'] = buttonTheme!.toJson();
    }
    data['canvasColor'] = canvasColor;
    data['cardColor'] = cardColor;
    if (colorScheme != null) {
      data['colorScheme'] = colorScheme!.toJson();
    }
    data['dialogBackgroundColor'] = dialogBackgroundColor;
    data['disabledColor'] = disabledColor;
    data['dividerColor'] = dividerColor;
    data['focusColor'] = focusColor;
    data['highlightColor'] = highlightColor;
    data['hintColor'] = hintColor;
    data['hoverColor'] = hoverColor;
    data['indicatorColor'] = indicatorColor;
    if (inputDecorationTheme != null) {
      data['inputDecorationTheme'] = inputDecorationTheme!.toJson();
    }
    data['materialTapTargetSize'] = materialTapTargetSize;
    data['platform'] = platform;
    data['primaryColor'] = primaryColor;
    data['primaryColorDark'] = primaryColorDark;
    data['primaryColorLight'] = primaryColorLight;
    if (primaryIconTheme != null) {
      data['primaryIconTheme'] = primaryIconTheme!.toJson();
    }
    if (primaryTextTheme != null) {
      data['primaryTextTheme'] = primaryTextTheme!.toJson();
    }
    data['scaffoldBackgroundColor'] = scaffoldBackgroundColor;
    data['secondaryHeaderColor'] = secondaryHeaderColor;
    data['shadowColor'] = shadowColor;
    data['splashColor'] = splashColor;
    data['splashFactory'] = splashFactory;
    if (textTheme != null) {
      data['textTheme'] = textTheme!.toJson();
    }
    if (typography != null) {
      data['typography'] = typography!.toJson();
    }
    data['unselectedWidgetColor'] = unselectedWidgetColor;
    data['useMaterial3'] = useMaterial3;
    data['visualDensity'] = visualDensity;
    return data;
  }
}

class ButtonTheme {
  ButtonTheme({
    this.alignedDropdown,
    this.colorScheme,
    this.height,
    this.layoutBehavior,
    this.minWidth,
    this.padding,
    this.shape,
    this.textTheme,
  });
  ButtonTheme.fromJson(Map<String, dynamic> json) {
    alignedDropdown = json['alignedDropdown'] as bool?;
    colorScheme = json['colorScheme'] != null
        ? ColorScheme.fromJson(json['colorScheme'] as Map<String, dynamic>)
        : null;
    height = json['height'] as int?;
    layoutBehavior = json['layoutBehavior'] as String?;
    minWidth = json['minWidth'] as int?;
    padding = json['padding'] != null
        ? Padding.fromJson(json['padding'] as Map<String, dynamic>)
        : null;
    shape = json['shape'] != null
        ? Shape.fromJson(json['shape'] as Map<String, dynamic>)
        : null;
    textTheme = json['textTheme'] as String?;
  }
  bool? alignedDropdown;
  ColorScheme? colorScheme;
  int? height;
  String? layoutBehavior;
  int? minWidth;
  Padding? padding;
  Shape? shape;
  String? textTheme;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['alignedDropdown'] = alignedDropdown;
    if (colorScheme != null) {
      data['colorScheme'] = colorScheme!.toJson();
    }
    data['height'] = height;
    data['layoutBehavior'] = layoutBehavior;
    data['minWidth'] = minWidth;
    if (padding != null) {
      data['padding'] = padding!.toJson();
    }
    if (shape != null) {
      data['shape'] = shape!.toJson();
    }
    data['textTheme'] = textTheme;
    return data;
  }
}

class ColorScheme {
  ColorScheme({
    this.background,
    this.brightness,
    this.error,
    this.errorContainer,
    this.inversePrimary,
    this.inverseSurface,
    this.onBackground,
    this.onError,
    this.onErrorContainer,
    this.onInverseSurface,
    this.onPrimary,
    this.onPrimaryContainer,
    this.onSecondary,
    this.onSecondaryContainer,
    this.onSurface,
    this.onSurfaceVariant,
    this.onTertiary,
    this.onTertiaryContainer,
    this.outline,
    this.outlineVariant,
    this.primary,
    this.primaryContainer,
    this.secondary,
    this.secondaryContainer,
    this.shadow,
    this.surface,
    this.surfaceTint,
    this.surfaceVariant,
    this.tertiary,
    this.tertiaryContainer,
  });
  ColorScheme.fromJson(Map<String, dynamic> json) {
    background = json['background'] as String?;
    brightness = json['brightness'] as String?;
    error = json['error'] as String?;
    errorContainer = json['errorContainer'] as String?;
    inversePrimary = json['inversePrimary'] as String?;
    inverseSurface = json['inverseSurface'] as String?;
    onBackground = json['onBackground'] as String?;
    onError = json['onError'] as String?;
    onErrorContainer = json['onErrorContainer'] as String?;
    onInverseSurface = json['onInverseSurface'] as String?;
    onPrimary = json['onPrimary'] as String?;
    onPrimaryContainer = json['onPrimaryContainer'] as String?;
    onSecondary = json['onSecondary'] as String?;
    onSecondaryContainer = json['onSecondaryContainer'] as String?;
    onSurface = json['onSurface'] as String?;
    onSurfaceVariant = json['onSurfaceVariant'] as String?;
    onTertiary = json['onTertiary'] as String?;
    onTertiaryContainer = json['onTertiaryContainer'] as String?;
    outline = json['outline'] as String?;
    outlineVariant = json['outlineVariant'] as String?;
    primary = json['primary'] as String?;
    primaryContainer = json['primaryContainer'] as String?;
    secondary = json['secondary'] as String?;
    secondaryContainer = json['secondaryContainer'] as String?;
    shadow = json['shadow'] as String?;
    surface = json['surface'] as String?;
    surfaceTint = json['surfaceTint'] as String?;
    surfaceVariant = json['surfaceVariant'] as String?;
    tertiary = json['tertiary'] as String?;
    tertiaryContainer = json['tertiaryContainer'] as String?;
  }
  String? background;
  String? brightness;
  String? error;
  String? errorContainer;
  String? inversePrimary;
  String? inverseSurface;
  String? onBackground;
  String? onError;
  String? onErrorContainer;
  String? onInverseSurface;
  String? onPrimary;
  String? onPrimaryContainer;
  String? onSecondary;
  String? onSecondaryContainer;
  String? onSurface;
  String? onSurfaceVariant;
  String? onTertiary;
  String? onTertiaryContainer;
  String? outline;
  String? outlineVariant;
  String? primary;
  String? primaryContainer;
  String? secondary;
  String? secondaryContainer;
  String? shadow;
  String? surface;
  String? surfaceTint;
  String? surfaceVariant;
  String? tertiary;
  String? tertiaryContainer;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['background'] = background;
    data['brightness'] = brightness;
    data['error'] = error;
    data['errorContainer'] = errorContainer;
    data['inversePrimary'] = inversePrimary;
    data['inverseSurface'] = inverseSurface;
    data['onBackground'] = onBackground;
    data['onError'] = onError;
    data['onErrorContainer'] = onErrorContainer;
    data['onInverseSurface'] = onInverseSurface;
    data['onPrimary'] = onPrimary;
    data['onPrimaryContainer'] = onPrimaryContainer;
    data['onSecondary'] = onSecondary;
    data['onSecondaryContainer'] = onSecondaryContainer;
    data['onSurface'] = onSurface;
    data['onSurfaceVariant'] = onSurfaceVariant;
    data['onTertiary'] = onTertiary;
    data['onTertiaryContainer'] = onTertiaryContainer;
    data['outline'] = outline;
    data['outlineVariant'] = outlineVariant;
    data['primary'] = primary;
    data['primaryContainer'] = primaryContainer;
    data['secondary'] = secondary;
    data['secondaryContainer'] = secondaryContainer;
    data['shadow'] = shadow;
    data['surface'] = surface;
    data['surfaceTint'] = surfaceTint;
    data['surfaceVariant'] = surfaceVariant;
    data['tertiary'] = tertiary;
    data['tertiaryContainer'] = tertiaryContainer;
    return data;
  }
}

class Padding {
  Padding({this.bottom, this.left, this.right, this.top});
  Padding.fromJson(Map<String, dynamic> json) {
    bottom = json['bottom'] as int?;
    left = json['left'] as int?;
    right = json['right'] as int?;
    top = json['top'] as int?;
  }
  int? bottom;
  int? left;
  int? right;
  int? top;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['bottom'] = bottom;
    data['left'] = left;
    data['right'] = right;
    data['top'] = top;
    return data;
  }
}

class Shape {
  Shape({this.borderRadius, this.side, this.type});
  Shape.fromJson(Map<String, dynamic> json) {
    borderRadius = json['borderRadius'] != null
        ? BorderRadius.fromJson(json['borderRadius'] as Map<String, dynamic>)
        : null;
    side = json['side'] != null
        ? Side.fromJson(json['side'] as Map<String, dynamic>)
        : null;
    type = json['type'] as String?;
  }
  BorderRadius? borderRadius;
  Side? side;
  String? type;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (borderRadius != null) {
      data['borderRadius'] = borderRadius!.toJson();
    }
    if (side != null) {
      data['side'] = side!.toJson();
    }
    data['type'] = type;
    return data;
  }
}

class BorderRadius {
  BorderRadius({
    this.bottomLeft,
    this.bottomRight,
    this.topLeft,
    this.topRight,
    this.type,
  });
  BorderRadius.fromJson(Map<String, dynamic> json) {
    bottomLeft = json['bottomLeft'] != null
        ? BottomLeft.fromJson(json['bottomLeft'] as Map<String, dynamic>)
        : null;
    bottomRight = json['bottomRight'] != null
        ? BottomLeft.fromJson(json['bottomRight'] as Map<String, dynamic>)
        : null;
    topLeft = json['topLeft'] != null
        ? BottomLeft.fromJson(json['topLeft'] as Map<String, dynamic>)
        : null;
    topRight = json['topRight'] != null
        ? BottomLeft.fromJson(json['topRight'] as Map<String, dynamic>)
        : null;
    type = json['type'] as String?;
  }
  BottomLeft? bottomLeft;
  BottomLeft? bottomRight;
  BottomLeft? topLeft;
  BottomLeft? topRight;
  String? type;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (bottomLeft != null) {
      data['bottomLeft'] = bottomLeft!.toJson();
    }
    if (bottomRight != null) {
      data['bottomRight'] = bottomRight!.toJson();
    }
    if (topLeft != null) {
      data['topLeft'] = topLeft!.toJson();
    }
    if (topRight != null) {
      data['topRight'] = topRight!.toJson();
    }
    data['type'] = type;
    return data;
  }
}

class BottomLeft {
  BottomLeft({this.type, this.x, this.y});
  BottomLeft.fromJson(Map<String, dynamic> json) {
    type = json['type'] as String?;
    x = json['x'] as int?;
    y = json['y'] as int?;
  }
  String? type;
  int? x;
  int? y;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    data['x'] = x;
    data['y'] = y;
    return data;
  }
}

class Side {
  Side({this.color, this.strokeAlign, this.style, this.width});
  Side.fromJson(Map<String, dynamic> json) {
    color = json['color'] as String?;
    strokeAlign = json['strokeAlign'] as int?;
    style = json['style'] as String?;
    width = json['width'] as int?;
  }
  String? color;
  int? strokeAlign;
  String? style;
  int? width;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['color'] = color;
    data['strokeAlign'] = strokeAlign;
    data['style'] = style;
    data['width'] = width;
    return data;
  }
}

class InputDecorationTheme {
  InputDecorationTheme({
    this.alignLabelWithHint,
    this.filled,
    this.floatingLabelAlignment,
    this.floatingLabelBehavior,
    this.isCollapsed,
    this.isDense,
  });
  InputDecorationTheme.fromJson(Map<String, dynamic> json) {
    alignLabelWithHint = json['alignLabelWithHint'] as bool?;
    filled = json['filled'] as bool?;
    floatingLabelAlignment = json['floatingLabelAlignment'] as String?;
    floatingLabelBehavior = json['floatingLabelBehavior'] as String?;
    isCollapsed = json['isCollapsed'] as bool?;
    isDense = json['isDense'] as bool?;
  }
  bool? alignLabelWithHint;
  bool? filled;
  String? floatingLabelAlignment;
  String? floatingLabelBehavior;
  bool? isCollapsed;
  bool? isDense;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['alignLabelWithHint'] = alignLabelWithHint;
    data['filled'] = filled;
    data['floatingLabelAlignment'] = floatingLabelAlignment;
    data['floatingLabelBehavior'] = floatingLabelBehavior;
    data['isCollapsed'] = isCollapsed;
    data['isDense'] = isDense;
    return data;
  }
}

class PrimaryIconTheme {
  PrimaryIconTheme({this.color});
  PrimaryIconTheme.fromJson(Map<String, dynamic> json) {
    color = json['color'] as String?;
  }
  String? color;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['color'] = color;
    return data;
  }
}

class PrimaryTextTheme {
  PrimaryTextTheme({
    this.bodyLarge,
    this.bodyMedium,
    this.bodySmall,
    this.displayLarge,
    this.displayMedium,
    this.displaySmall,
    this.headlineLarge,
    this.headlineMedium,
    this.headlineSmall,
    this.labelLarge,
    this.labelMedium,
    this.labelSmall,
    this.titleLarge,
    this.titleMedium,
    this.titleSmall,
  });
  PrimaryTextTheme.fromJson(Map<String, dynamic> json) {
    bodyLarge = json['bodyLarge'] != null
        ? BodyLarge.fromJson(json['bodyLarge'] as Map<String, dynamic>)
        : null;
    bodyMedium = json['bodyMedium'] != null
        ? BodyLarge.fromJson(json['bodyMedium'] as Map<String, dynamic>)
        : null;
    bodySmall = json['bodySmall'] != null
        ? BodyLarge.fromJson(json['bodySmall'] as Map<String, dynamic>)
        : null;
    displayLarge = json['displayLarge'] != null
        ? BodyLarge.fromJson(json['displayLarge'] as Map<String, dynamic>)
        : null;
    displayMedium = json['displayMedium'] != null
        ? BodyLarge.fromJson(json['displayMedium'] as Map<String, dynamic>)
        : null;
    displaySmall = json['displaySmall'] != null
        ? BodyLarge.fromJson(json['displaySmall'] as Map<String, dynamic>)
        : null;
    headlineLarge = json['headlineLarge'] != null
        ? BodyLarge.fromJson(json['headlineLarge'] as Map<String, dynamic>)
        : null;
    headlineMedium = json['headlineMedium'] != null
        ? BodyLarge.fromJson(json['headlineMedium'] as Map<String, dynamic>)
        : null;
    headlineSmall = json['headlineSmall'] != null
        ? BodyLarge.fromJson(json['headlineSmall'] as Map<String, dynamic>)
        : null;
    labelLarge = json['labelLarge'] != null
        ? BodyLarge.fromJson(json['labelLarge'] as Map<String, dynamic>)
        : null;
    labelMedium = json['labelMedium'] != null
        ? BodyLarge.fromJson(json['labelMedium'] as Map<String, dynamic>)
        : null;
    labelSmall = json['labelSmall'] != null
        ? BodyLarge.fromJson(json['labelSmall'] as Map<String, dynamic>)
        : null;
    titleLarge = json['titleLarge'] != null
        ? BodyLarge.fromJson(json['titleLarge'] as Map<String, dynamic>)
        : null;
    titleMedium = json['titleMedium'] != null
        ? BodyLarge.fromJson(json['titleMedium'] as Map<String, dynamic>)
        : null;
    titleSmall = json['titleSmall'] != null
        ? BodyLarge.fromJson(json['titleSmall'] as Map<String, dynamic>)
        : null;
  }
  BodyLarge? bodyLarge;
  BodyLarge? bodyMedium;
  BodyLarge? bodySmall;
  BodyLarge? displayLarge;
  BodyLarge? displayMedium;
  BodyLarge? displaySmall;
  BodyLarge? headlineLarge;
  BodyLarge? headlineMedium;
  BodyLarge? headlineSmall;
  BodyLarge? labelLarge;
  BodyLarge? labelMedium;
  BodyLarge? labelSmall;
  BodyLarge? titleLarge;
  BodyLarge? titleMedium;
  BodyLarge? titleSmall;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (bodyLarge != null) {
      data['bodyLarge'] = bodyLarge!.toJson();
    }
    if (bodyMedium != null) {
      data['bodyMedium'] = bodyMedium!.toJson();
    }
    if (bodySmall != null) {
      data['bodySmall'] = bodySmall!.toJson();
    }
    if (displayLarge != null) {
      data['displayLarge'] = displayLarge!.toJson();
    }
    if (displayMedium != null) {
      data['displayMedium'] = displayMedium!.toJson();
    }
    if (displaySmall != null) {
      data['displaySmall'] = displaySmall!.toJson();
    }
    if (headlineLarge != null) {
      data['headlineLarge'] = headlineLarge!.toJson();
    }
    if (headlineMedium != null) {
      data['headlineMedium'] = headlineMedium!.toJson();
    }
    if (headlineSmall != null) {
      data['headlineSmall'] = headlineSmall!.toJson();
    }
    if (labelLarge != null) {
      data['labelLarge'] = labelLarge!.toJson();
    }
    if (labelMedium != null) {
      data['labelMedium'] = labelMedium!.toJson();
    }
    if (labelSmall != null) {
      data['labelSmall'] = labelSmall!.toJson();
    }
    if (titleLarge != null) {
      data['titleLarge'] = titleLarge!.toJson();
    }
    if (titleMedium != null) {
      data['titleMedium'] = titleMedium!.toJson();
    }
    if (titleSmall != null) {
      data['titleSmall'] = titleSmall!.toJson();
    }
    return data;
  }
}

class BodyLarge {
  BodyLarge({
    this.color,
    this.decoration,
    this.fontFamily,
    this.fontFamilyFallback,
    this.fontSize,
    this.fontWeight,
    this.inherit,
    this.letterSpacing,
    this.textBaseline,
  });
  BodyLarge.fromJson(Map<String, dynamic> json) {
    color = json['color'] as String?;
    decoration = json['decoration'] as String?;
    fontFamily = json['fontFamily'] as String?;
    // fontFamilyFallback = json['fontFamilyFallback'] as List<String>?;
    fontSize = json['fontSize'] as int?;
    fontWeight = json['fontWeight'] as String?;
    inherit = json['inherit'] as bool?;
    // letterSpacing = json['letterSpacing'] as double?;
    textBaseline = json['textBaseline'] as String?;
  }
  String? color;
  String? decoration;
  String? fontFamily;
  List<String>? fontFamilyFallback;
  int? fontSize;
  String? fontWeight;
  bool? inherit;
  double? letterSpacing;
  String? textBaseline;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['color'] = color;
    data['decoration'] = decoration;
    data['fontFamily'] = fontFamily;
    data['fontFamilyFallback'] = fontFamilyFallback;
    data['fontSize'] = fontSize;
    data['fontWeight'] = fontWeight;
    data['inherit'] = inherit;
    data['letterSpacing'] = letterSpacing;
    data['textBaseline'] = textBaseline;
    return data;
  }
}

class DisplaySmall {
  DisplaySmall({
    this.color,
    this.decoration,
    this.fontFamily,
    this.fontFamilyFallback,
    this.fontSize,
    this.fontWeight,
    this.inherit,
    this.letterSpacing,
    this.textBaseline,
  });
  DisplaySmall.fromJson(Map<String, dynamic> json) {
    color = json['color'] as String?;
    decoration = json['decoration'] as String?;
    fontFamily = json['fontFamily'] as String?;
    fontFamilyFallback = json['fontFamilyFallback'] as List<String>;
    fontSize = json['fontSize'] as int?;
    fontWeight = json['fontWeight'] as String?;
    inherit = json['inherit'] as bool?;
    letterSpacing = json['letterSpacing'] as int?;
    textBaseline = json['textBaseline'] as String?;
  }
  String? color;
  String? decoration;
  String? fontFamily;
  List<String>? fontFamilyFallback;
  int? fontSize;
  String? fontWeight;
  bool? inherit;
  int? letterSpacing;
  String? textBaseline;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['color'] = color;
    data['decoration'] = decoration;
    data['fontFamily'] = fontFamily;
    data['fontFamilyFallback'] = fontFamilyFallback;
    data['fontSize'] = fontSize;
    data['fontWeight'] = fontWeight;
    data['inherit'] = inherit;
    data['letterSpacing'] = letterSpacing;
    data['textBaseline'] = textBaseline;
    return data;
  }
}

class Typography {
  Typography({this.black, this.dense, this.englishLike, this.tall, this.white});
  Typography.fromJson(Map<String, dynamic> json) {
    black = json['black'] != null
        ? PrimaryTextTheme.fromJson(json['black'] as Map<String, dynamic>)
        : null;
    dense = json['dense'] != null
        ? PrimaryTextTheme.fromJson(json['dense'] as Map<String, dynamic>)
        : null;
    englishLike = json['englishLike'] != null
        ? PrimaryTextTheme.fromJson(json['englishLike'] as Map<String, dynamic>)
        : null;
    tall = json['tall'] != null
        ? PrimaryTextTheme.fromJson(json['tall'] as Map<String, dynamic>)
        : null;
    white = json['white'] != null
        ? PrimaryTextTheme.fromJson(json['white'] as Map<String, dynamic>)
        : null;
  }
  PrimaryTextTheme? black;
  PrimaryTextTheme? dense;
  PrimaryTextTheme? englishLike;
  PrimaryTextTheme? tall;
  PrimaryTextTheme? white;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (black != null) {
      data['black'] = black!.toJson();
    }
    if (dense != null) {
      data['dense'] = dense!.toJson();
    }
    if (englishLike != null) {
      data['englishLike'] = englishLike!.toJson();
    }
    if (tall != null) {
      data['tall'] = tall!.toJson();
    }
    if (white != null) {
      data['white'] = white!.toJson();
    }
    return data;
  }
}

class LabelSmall {
  LabelSmall({
    this.fontSize,
    this.fontWeight,
    this.inherit,
    this.letterSpacing,
    this.textBaseline,
  });
  LabelSmall.fromJson(Map<String, dynamic> json) {
    fontSize = json['fontSize'] as int?;
    fontWeight = json['fontWeight'] as String?;
    inherit = json['inherit'] as bool?;
    letterSpacing = json['letterSpacing'] as double?;
    textBaseline = json['textBaseline'] as String?;
  }
  int? fontSize;
  String? fontWeight;
  bool? inherit;
  double? letterSpacing;
  String? textBaseline;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['fontSize'] = fontSize;
    data['fontWeight'] = fontWeight;
    data['inherit'] = inherit;
    data['letterSpacing'] = letterSpacing;
    data['textBaseline'] = textBaseline;
    return data;
  }
}
