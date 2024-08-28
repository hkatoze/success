import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shimmer/shimmer.dart';
import 'package:success/constants.dart';

class DefaultBtn extends StatefulWidget {
  final Function event;
  final String title;
  final double titleSize;
  final Color bgColor;
  final Color titleColor;
  final double width;
  final bool lighting;
  final Color borderColor;
  final double radius;
  const DefaultBtn(
      {super.key,
      required this.width,
      required this.titleColor,
      required this.event,
      required this.titleSize,
      this.lighting = true,
      this.radius = 13,
      this.borderColor = ktertiaryColor,
      required this.title,
      required this.bgColor});

  @override
  State<DefaultBtn> createState() => _DefaultBtnState();
}

class _DefaultBtnState extends State<DefaultBtn> {
  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: () {
        widget.event();
      },
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          if (widget.lighting)
            Shimmer.fromColors(
                baseColor: widget.bgColor,
                highlightColor: Colors.blue[100]!,
                period: const Duration(milliseconds: 3000),
                child: SizedBox(
                  width: widget.width,
                  child: AnimatedContainer(
                    duration: 1000.milliseconds,
                    curve: Curves.ease,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        color: widget.bgColor,
                        borderRadius: BorderRadius.circular(widget.radius),
                        border:
                            Border.all(color: widget.borderColor, width: 1)),
                    child: Text(widget.title),
                  ),
                )),
          if (widget.lighting)
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: widget.titleColor,
                  fontSize: widget.titleSize,
                  fontWeight: FontWeight.bold),
            ),
          if (!widget.lighting)
            SizedBox(
              width: widget.width,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: widget.bgColor,
                    borderRadius: BorderRadius.circular(widget.radius),
                    border: Border.all(color: widget.borderColor, width: 0.5)),
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: widget.titleColor,
                      fontSize: widget.titleSize,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
        ],
      ),
    );
  }
}
