import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_collection/widgets/text_fields/colors.dart';
import 'package:flutter_widget_collection/widgets/text_fields/styles.dart';
import 'package:flutter_widget_collection/widgets/text_fields/text_widget.dart';

class TextField1 extends StatefulWidget {
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final String? labelText;
  final double? labelFontSize;
  final String? hintText;
  final String? errorText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? minLines;
  final bool? minimizeBottomPadding;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? margin;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool? enabled;
  final bool? autovalidate;
  final bool readOnly;
  final bool isRequired;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final Widget? prefix;
  final Widget? suffix;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final GestureTapCallback? onTap;
  final Key? textFieldKey;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? borderRadius;
  final bool? isFilled;
  final Color fillColor;
  final bool? obSecure;
  final double? topPadding;
  final double? leftContentPadding;
  final double? hintSize;
  final List<TextInputFormatter>? inputFormatters;
  final Color? focusBorderColor;
  final Color? enableBorderColor;
  final double? labelLeftPadding;
  final double? labelBottomPadding;
  final bool isDescriptionBox;
  final Function(PointerDownEvent)? onTapOutside;

  const TextField1({
    super.key,
    this.labelLeftPadding = 0,
    this.labelBottomPadding = 0,
    this.labelFontSize = 14,
    this.focusBorderColor = const Color(0xffD6DCFF),
    this.minimizeBottomPadding = false,
    this.readOnly = false,
    this.enabled = true,
    this.maxLength,
    this.validator,
    this.prefix,
    this.suffix,
    this.errorText,
    this.onChanged,
    this.textInputAction,
    this.autovalidate = false,
    this.controller,
    this.onFieldSubmitted,
    this.focusNode,
    this.hintSize = 14,
    this.isRequired = false,
    this.autofocus = false,
    this.labelText,
    this.fillColor = Colors.white38,
    this.isFilled = false,
    this.hintText,
    this.minLines,
    this.prefixIcon,
    this.obSecure = false,
    this.suffixIcon,
    this.borderRadius = 8,
    this.onTap,
    this.margin = const EdgeInsets.all(5),
    this.keyboardType,
    this.leftContentPadding = 15,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    this.maxLines = 1,
    this.textFieldKey,
    this.topPadding = 25,
    this.inputFormatters,
    this.enableBorderColor = const Color(0xffFFFFFF),
    this.isDescriptionBox = false,
    this.onTapOutside,
  });

  @override
  State<TextField1> createState() => _TextField1State();
}

class _TextField1State extends State<TextField1> {
  late FocusNode focusNode;

  @override
  void initState() {
    focusNode = widget.focusNode ?? FocusNode();
    focusNode.addListener(onFocusChanged);
    super.initState();
  }

  @override
  void dispose() {
    focusNode.removeListener(onFocusChanged);
    super.dispose();
  }

  Future<void> onFocusChanged() async => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.controller,
          onTap: widget.onTap,
          obscureText: widget.obSecure!,
          focusNode: focusNode,
          inputFormatters: widget.inputFormatters,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          readOnly: widget.readOnly,
          validator: widget.validator,
          autofocus: widget.autofocus,
          onTapOutside: widget.onTapOutside,
          cursorColor: Colors.black45,
          cursorHeight: Platform.isIOS ? 16 : 18,
          style: TextStyles.body1Medium.copyWith(
            fontSize: 16,
            color: textDarkColor,
          ),
          decoration: InputDecoration(
            alignLabelWithHint: widget.isDescriptionBox,
            contentPadding: const EdgeInsets.only(
              bottom: 12,
              left: 16,
              right: 10,
              top: 8,
            ),
            label: TextWidget(
              widget.labelText ?? '',
              style: TextStyles.body2.copyWith(
                color: textGreyColor,
                fontSize: 16,
              ),
            ),
            fillColor: greyBgColor,
            filled: true,
            border: const CustomOutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                color: darkBorderColor,
              ),
            ),
            enabledBorder: const CustomOutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                color: darkBorderColor,
              ),
            ),
            focusedBorder: const CustomOutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                color: darkBorderColor,
              ),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(
                top: 12,
                bottom: 12,
                right: 10,
              ),
              child: widget.suffixIcon,
            ),
            suffix: widget.suffix,
            prefixIcon: widget.prefixIcon,
            prefix: widget.prefix,
          ),
        ),
        if (widget.errorText == '' || widget.errorText == null)
          const SizedBox()
        else
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 5,
            ),
            child: TextWidget(
              '${widget.errorText}',
              style: TextStyles.caption1.copyWith(
                color: statusRedColor,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}

class CustomOutlineInputBorder extends InputBorder {
  /// Creates an underline border for an [InputDecorator].
  ///
  /// The [borderSide] parameter defaults to [BorderSide.none] (it must not be
  /// null). Applications typically do not specify a [borderSide] parameter
  /// because the input decorator substitutes its own, using [copyWith], based
  /// on the current theme and [InputDecorator.isFocused].
  ///
  /// The [borderRadius] parameter defaults to a value where the top left
  /// and right corners have a circular radius of 4.0. The [borderRadius]
  /// parameter must not be null.
  const CustomOutlineInputBorder({
    super.borderSide = const BorderSide(),
    this.borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(4),
      topRight: Radius.circular(4),
      bottomLeft: Radius.circular(4),
      bottomRight: Radius.circular(4),
    ),
  });

  /// The radii of the border's rounded rectangle corners.
  ///
  /// When this border is used with a filled input decorator, see
  /// [InputDecoration.filled], the border radius defines the shape
  /// of the background fill as well as the bottom left and right
  /// edges of the underline itself.
  ///
  /// By default the top right and top left corners have a circular radius
  /// of 4.0.
  final BorderRadius borderRadius;

  @override
  bool get isOutline => false;

  @override
  CustomOutlineInputBorder copyWith({
    BorderSide? borderSide,
    BorderRadius? borderRadius,
  }) {
    return CustomOutlineInputBorder(
      borderSide: borderSide ?? this.borderSide,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  EdgeInsetsGeometry get dimensions {
    return EdgeInsets.only(bottom: borderSide.width);
  }

  @override
  CustomOutlineInputBorder scale(double t) {
    return CustomOutlineInputBorder(borderSide: borderSide.scale(t));
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..addRect(
        Rect.fromLTWH(
          rect.left,
          rect.top,
          rect.width,
          math.max(0, rect.height - borderSide.width),
        ),
      );
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRRect(borderRadius.resolve(textDirection).toRRect(rect));
  }

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is CustomOutlineInputBorder) {
      return CustomOutlineInputBorder(
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
        borderRadius: BorderRadius.lerp(a.borderRadius, borderRadius, t)!,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is CustomOutlineInputBorder) {
      return CustomOutlineInputBorder(
        borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
        borderRadius: BorderRadius.lerp(borderRadius, b.borderRadius, t)!,
      );
    }
    return super.lerpTo(b, t);
  }

  /// Draw a horizontal line at the bottom of [rect].
  ///
  /// The [borderSide] defines the line's color and weight. The `textDirection`
  /// `gap` and `textDirection` parameters are ignored.
  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    double? gapStart,
    double gapExtent = 0.0,
    double gapPercentage = 0.0,
    TextDirection? textDirection,
  }) {
    final paint = borderSide.toPaint();
    final outer = borderRadius.toRRect(rect);
    final center = outer.deflate(borderSide.width / 2.0);
    canvas.drawRRect(center, paint);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is InputBorder && other.borderSide == borderSide;
  }

  @override
  int get hashCode => borderSide.hashCode;
}
