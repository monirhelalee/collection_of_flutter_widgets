import 'package:flutter/material.dart';
import 'package:flutter_widget_collection/widgets/text_fields/styles.dart';

class TextWidget extends Text {
  TextWidget(
    String data, {
    Key? key,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    double? textScaleFactor,
    int? maxLines,
    String? semanticLabel,
    TextStyle? style,
  }) : super(
          data,
          key: key,
          strutStyle: strutStyle,
          textAlign: textAlign,
          textDirection: textDirection,
          locale: locale,
          softWrap: softWrap,
          overflow: overflow,
          textScaleFactor: textScaleFactor,
          maxLines: maxLines,
          semanticsLabel: semanticLabel,
          style: style ?? TextStyles.body1Medium,
        );
}
