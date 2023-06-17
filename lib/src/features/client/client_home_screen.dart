import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inversa/src/assets/assets.gen.dart';
import 'package:inversa/src/common_widgets/common_dotted_border_card.dart';

class ClientHomeScreen extends StatelessWidget {
  const ClientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(CupertinoIcons.text_alignleft),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonDottedBorderCard(
                customRadius: const Radius.circular(6),
                alignment: Alignment.center,
                child: Assets.scanCodeLightScreen.svg(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
