import 'package:flutter/material.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_button.dart';
import 'package:inversaapp/src/common_widgets/common_dotted_border_card.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/home/presentation/screens/client_nav_bar.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class ConfirmOrderPlaceScreen extends StatelessWidget {
  static Route<ConfirmOrderPlaceScreen> route() {
    return MaterialPageRoute(
        builder: (context) => const ConfirmOrderPlaceScreen());
  }

  const ConfirmOrderPlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConfigColors.primary2,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          gapH80,
          CommonDottedBorderCard(
            height: 399,
            width: 343,
            borderColor: ConfigColors.white,
            backgroundColor: ConfigColors.primary,
            customRadius: const Radius.circular(20),
            padding: const EdgeInsets.all(16),
            showShadow: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Assets.correctDot.image(),
                const AppText.titleS24(
                  "Order Placed!",
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: ConfigColors.white,
                ),
                const AppText.paragraphI14(
                  "Your order successfully placed. Thank \nyou for placing an order.",
                  fontWeight: FontWeight.w400,
                  color: ConfigColors.white,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 154),
          CommonButton(
            text: "Check Details",
            onPress: () => Navigator.push(context, ClientNavigationBar.route()),
            synappButtonColor: SynappButtonColor.secondary,
          ),
        ],
      ),
    );
  }
}
