import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../styles/colors.dart';
import '../utils/constants.dart';

class DefaultTextField extends StatefulWidget {
  final String? errorText;
  final String? title;
  final bool secure;
  final TextInputType inputType;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final Function(String)? onChanged;
  final String? label;
  final ValueChanged<String>? onSubmitted;
  final Color fillColor;
  final IconData? prefix;
  final IconData? suffix;
  final bool readOnly;
  final bool filled;
  final int? maxLength;
  final TextAlign? textAlign;
  final num height;
  final num width;

  const DefaultTextField({
    Key? key,
    this.title,
    this.errorText,
    this.secure = false,
    required this.inputType,
    this.controller,
    this.validator,
    this.label,
    this.onSubmitted,
    this.fillColor = Colors.white,
    this.prefix,
    this.suffix,
    this.maxLength,
    this.filled = true,
    this.readOnly = false,
    this.textAlign = TextAlign.start,
    this.height = 15,
    this.width = 10,
    this.onChanged,
  }) : super(key: key);

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  bool secure = false;

  @override
  void initState() {
    secure = widget.secure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isLabel = widget.label != null;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 3.0,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: secure,
        keyboardType: widget.inputType,
        validator: widget.validator,
        maxLength: widget.maxLength,
        readOnly: widget.readOnly,
        textAlign: widget.textAlign!,
        maxLines: widget.inputType == TextInputType.multiline ? null : 1,
        onFieldSubmitted: widget.onSubmitted,
        cursorColor: AppColors.kPurple,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          errorText: widget.errorText,
          contentPadding: EdgeInsets.symmetric(
            vertical: widget.height.toDouble(),
            horizontal: widget.width.toDouble(),
          ),
          isDense: true,
          filled: widget.filled,
          prefixIconConstraints: BoxConstraints(
            maxWidth: 35,
            minWidth: 35,
          ),
          prefixIcon: widget.prefix != null
              ? Icon(
                  widget.prefix,
                  size: 20,
                  color: AppColors.kGrey,
                )
              : null,
          suffixIcon: widget.secure
              ? InkWell(
                  onTap: () => setState(() => secure = !secure),
                  child: Icon(
                    Icons.remove_red_eye_outlined,
                    size: 20,
                    color: AppColors.kGrey,
                  ),
                )
              : widget.suffix == null
                  ? null
                  : Icon(
                      widget.suffix,
                      size: 20,
                      color: AppColors.kGrey,
                    ),
          fillColor: widget.fillColor,
          hintText: widget.title,
          label: isLabel ? Text(widget.label!) : null,
          labelStyle: isLabel
              ? const TextStyle(
                  color: Colors.black,
                  fontFamily: secondaryFont,
                )
              : null,
          hintStyle: TextStyle(color: AppColors.kGrey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: AppColors.kLightPurple),
          ),
        ),
      ),
    );
  }
}
/*
import 'package:cord/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../styles/colors.dart';

class DefaultTextField extends StatelessWidget {
  final String? title;
  final bool secure;
  final TextInputType inputType;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final Function(String)? onChanged;
  final String? label;
  final ValueChanged<String>? onSubmitted;
  final Color fillColor;
  final IconData? prefix;
  final IconData? suffix;
  final bool readOnly;
  final bool filled;
  final int? maxLength;
  final TextAlign? textAlign;
  final num height;
  final num width;
  const DefaultTextField({
    Key? key,
    this.title,
    this.secure = false,
    required this.inputType,
    this.controller,
    this.validator,
    this.label,
    this.onSubmitted,
    this.fillColor = Colors.white,
    this.prefix,
    this.suffix,
    this.maxLength,
    this.filled = true,
    this.readOnly = false,
    this.textAlign = TextAlign.start,
    this.height = 15,
    this.width = 10,
    this.onChanged,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isLabel = label != null;
    return TextFormField(
      controller: controller,
      obscureText: secure,
      keyboardType: inputType,
      validator: validator ??
          (value) {
            if (value!.isEmpty) {
              return 'This Field is Required';
            }
            return null;
          },
      onChanged: onChanged,
      maxLength: maxLength,
      readOnly: readOnly,
      textAlign: textAlign!,
      maxLines: inputType == TextInputType.multiline ? null : 1,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.symmetric(
                vertical: height.h,
                horizontal: width.w
            ),
        isDense: true,
        filled: filled,
        prefixIcon: prefix != null
            ? Icon(
                prefix,
                color: Colors.black,
              )
            : null,
        suffixIcon: suffix != null
            ? IconButton(onPressed: () {}, icon: Icon(suffix))
            : null,
        fillColor: fillColor,
        //hintText: title,
        labelText: isLabel ? label! : null,
        labelStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.kGrey,
            fontFamily: secondaryFont),
        floatingLabelStyle: isLabel
            ? TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.kPurple,
                fontFamily: secondaryFont)
            : null,
        //hintStyle: const TextStyle(color: Colors.black),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: AppColors.kLightPurple),
        ),
      ),
    );
  }
}

 */
