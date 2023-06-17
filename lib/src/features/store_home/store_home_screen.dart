import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inversa/src/common_widgets/common_radio_button.dart';

class StoreHomeScreen extends StatelessWidget {
  const StoreHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(CupertinoIcons.text_alignleft),
      ),
      body: Center(
        child: SynappRadioButton(
          value: 2,
          title: "sdsd",
          groupValue: 1,
          onChanged: (value) {},
        ),
      ),
    );
  }
}
