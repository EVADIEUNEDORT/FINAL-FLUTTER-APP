import 'package:flutter/material.dart';
import 'package:second/constants/constants.dart';

class Optionwidget extends StatelessWidget {
  const Optionwidget({
    super.key,
    required this.height,
    required this.icon,
    required this.optionTitle,
    required this.description,
    this.rightWidget,
  });

  final double height;
  final Icon icon;
  final String optionTitle;
  final String description;
  final Widget? rightWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height / 10,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: Colors.grey[100]),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: height / 15.3,
              width: 190,
              child: Row(
                children: [
                  Container(
                    height: height / 15.3,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: blue),
                        color: white),
                    child: icon,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: height / 13.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          optionTitle,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          description,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (rightWidget != null) rightWidget!
          ],
        ),
      ),
    );
  }
}
