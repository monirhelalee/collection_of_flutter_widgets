import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_collection/widgets/text%20field/colors.dart';
import 'package:flutter_widget_collection/widgets/text%20field/custom_outline_input_border.dart';
import 'package:flutter_widget_collection/widgets/text%20field/styles.dart';
import 'package:flutter_widget_collection/widgets/text%20field/text_widget.dart';

class CommonTextField extends StatefulWidget {
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

  const CommonTextField({
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
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
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
