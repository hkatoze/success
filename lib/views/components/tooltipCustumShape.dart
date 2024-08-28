import 'package:flutter/material.dart';
import 'package:success/constants.dart';

class CustomToolTip extends StatelessWidget {
  final Widget message;
  final Widget child;

  const CustomToolTip({super.key, required this.message, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Ne rien faire lorsque le widget est tapé
      },
      child: SizedBox(
        height: kHeight(context) * 0.5,
        width: kWidth(context) * 0.7,
        child: Stack(
          children: [
            Positioned(
                top: 70,
                left: kWidth(context) * 0.25,
                right: kWidth(context) * 0.25,
                child: child),
            Positioned(
              left: kWidth(context) * 0.1,
              right: kWidth(context) * 0.05,
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.all(8),
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: CustomToolTipShape(),
                ),
                child: message,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomToolTipShape extends ShapeBorder {
  const CustomToolTipShape();

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          rect,
          const Radius.circular(8),
        ),
      )
      ..moveTo(rect.center.dx - 10, rect.bottom)
      ..lineTo(rect.center.dx, rect.bottom + 10)
      ..lineTo(rect.center.dx + 10, rect.bottom)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
