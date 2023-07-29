import 'package:flutter/material.dart';
import 'package:inversaapp/src/theme/config_colors.dart';

class CommonScaffold extends StatelessWidget {
  final Widget appBar;
  final Widget body;
  final bool isScaffold;
  const CommonScaffold({
    Key? key,
    required this.appBar,
    required this.body,
    this.isScaffold = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isScaffold) {
      return Scaffold(
        body: Container(
          color: ConfigColors.primary,
          child: SafeArea(
            child: Column(
              children: [
                appBar,
                Expanded(
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: body,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Container(
        color: ConfigColors.primary,
        child: SafeArea(
          child: Column(
            children: [
              appBar,
              Expanded(
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: body,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
