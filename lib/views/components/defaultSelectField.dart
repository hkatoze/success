import 'package:flutter/material.dart';
import 'package:success/constants.dart';

class DefaultSelectField extends StatefulWidget {
  final String hintText;
  final String? title;
  final double width;
  final List<DropdownMenuItem<String>>? items;
  final String defaultSelect;

  final IconData? prefixIcon;

  final TextEditingController controller;

  const DefaultSelectField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.defaultSelect,
    required this.items,
    this.title,
    this.prefixIcon,
    required this.width,
  }) : super(key: key);

  @override
  State<DefaultSelectField> createState() => _DefaultSelectFieldState();
}

class _DefaultSelectFieldState extends State<DefaultSelectField> {
  bool obscurText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            SizedBox(
              width: widget.width,
              child: Text(
                widget.title!,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: kquaternaryColor,
                ),
              ),
            ),
          if (widget.title != null) const SizedBox(height: 7),
          Container(
            width: widget.width,
            padding: EdgeInsets.symmetric(horizontal: kWidth(context) * 0.05),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: InputDecorator(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: TextStyle(fontSize: 12, color: Colors.grey[400]),
                prefixIcon: widget.prefixIcon != null
                    ? Icon(
                        widget.prefixIcon,
                        size: 17,
                        color: Colors.grey,
                      )
                    : null,
              ),
              child: SizedBox(
                  height: 20,
                  child: DropdownButtonFormField<String>(
                    alignment: AlignmentDirectional.topStart,
                    isExpanded: true,
                    value: widget.controller.text == ""
                        ? widget.defaultSelect
                        : widget.controller.text,
                    onChanged: (newValue) {
                      setState(() {
                        widget.controller.text = newValue!;
                      });
                    },
                    items: widget.items,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                    style: const TextStyle(fontSize: 12, color: Colors.black),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
