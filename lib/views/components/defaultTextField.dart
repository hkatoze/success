import 'package:flutter/material.dart';
import 'package:success/constants.dart';

class DefaultTextField extends StatefulWidget {
  final String hintText;
  final String? title;
  final double width;
  final bool? obscurText;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final TextInputAction action;
  final bool? withBorder;

  final TextEditingController controller;
  const DefaultTextField(
      {super.key,
      required this.controller,
      required this.action,
      required this.hintText,
      this.obscurText,
      required this.keyboardType,
      this.title,
      this.prefixIcon,
      this.withBorder = true,
      required this.width});

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  bool obscurText = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (widget.title != null)
          SizedBox(
            width: widget.width,
            child: Text(
              widget.title!,
              overflow: TextOverflow.clip,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: kquaternaryColor),
            ),
          ),
        if (widget.title != null)
          const SizedBox(
            height: 7,
          ),
        Container(
            width: widget.width,
            padding: widget.prefixIcon != null && widget.obscurText == null
                ? EdgeInsets.only(right: kWidth(context) * 0.05)
                : (widget.obscurText == null
                    ? EdgeInsets.symmetric(horizontal: kWidth(context) * 0.05)
                    : null),
            child: Center(
              child: TextField(
                keyboardType: widget.keyboardType,
                style: const TextStyle(
                    color: kquaternaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textInputAction: widget.action,
                obscureText: widget.obscurText != null ? obscurText : false,
                controller: widget.controller,
                decoration: InputDecoration(
                  focusedBorder: widget.withBorder! ? null : InputBorder.none,
                  enabledBorder: widget.withBorder! ? null : InputBorder.none,
                  hintText: widget.hintText,
                  hintStyle: TextStyle(fontSize: 12, color: Colors.grey[400]),
                  prefixIcon: widget.prefixIcon != null
                      ? Icon(
                          widget.prefixIcon,
                          size: 17,
                          color: Colors.grey,
                        )
                      : null,
                  suffixIcon: widget.obscurText != null
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              obscurText = !obscurText;
                            });
                          },
                          child: !obscurText
                              ? const Icon(
                                  Icons.visibility,
                                  size: 17,
                                )
                              : const Icon(
                                  Icons.visibility_off,
                                  size: 17,
                                ),
                        )
                      : null,
                ),
              ),
            ))
      ]),
    );
  }
}
