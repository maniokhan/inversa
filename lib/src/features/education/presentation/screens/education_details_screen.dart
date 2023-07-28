// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/common_widgets/common_app_bar.dart';
import 'package:inversaapp/src/common_widgets/common_education_card.dart';
import 'package:inversaapp/src/common_widgets/common_scaffold.dart';
import 'package:inversaapp/src/theme/config_colors.dart';

class EducationDetailsScreen extends ConsumerWidget {
  final Widget educationInfo;
  static route(Widget education) {
    return MaterialPageRoute(
      builder: (_) => EducationDetailsScreen(educationInfo: education),
    );
  }

  const EducationDetailsScreen({
    super.key,
    required this.educationInfo,
  });

  @override
  Widget build(BuildContext context, ref) {
    return CommonScaffold(
      isScaffold: true,
      appBar: CommonAppBar(
        showleading: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: ConfigColors.white,
          ),
        ),
        title: "Education Details",
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CommonEducationCard(
              onTap: () {},
              image: educationInfo,
            ),
          ],
        ),
      ),
    );
  }
}
