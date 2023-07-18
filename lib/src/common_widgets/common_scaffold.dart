import 'package:flutter/material.dart';
import 'package:inversaapp/src/common_widgets/common_app_bar.dart';
import 'package:inversaapp/src/theme/config_colors.dart';

class CommonScaffold extends StatelessWidget {
  final CommonAppBar appBar;
  final Widget body;
  const CommonScaffold({
    Key? key,
    required this.appBar,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ConfigColors.primary2,
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
