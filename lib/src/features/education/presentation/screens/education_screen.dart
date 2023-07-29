import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_app_bar.dart';
import 'package:inversaapp/src/common_widgets/common_education_card.dart';
import 'package:inversaapp/src/common_widgets/common_scaffold.dart';
import 'package:inversaapp/src/features/education/presentation/screens/education_details_screen.dart';
import 'package:inversaapp/src/theme/config_colors.dart';

class EducationScreen extends ConsumerStatefulWidget {
  static Route<EducationScreen> route() {
    return MaterialPageRoute(builder: (context) => const EducationScreen());
  }

  const EducationScreen({super.key});

  @override
  ConsumerState<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends ConsumerState<EducationScreen> {
  final List<Widget> educationVideo = <Widget>[
    Assets.education1.image(),
    Assets.education2.image(),
    Assets.education3.image(),
    Assets.education4.image(),
    Assets.education5.image(),
    Assets.education6.image(),
  ];
  @override
  Widget build(BuildContext context) {
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
        title: "Education",
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
        child: GridView.builder(
          itemCount: educationVideo.length,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 3 / 3.5,
          ),
          itemBuilder: (context, index) {
            return CommonEducationCard(
              onTap: () {
                Navigator.push(context,
                    EducationDetailsScreen.route(educationVideo[index]));
              },
              image: Stack(
                alignment: Alignment.center,
                children: [
                  educationVideo[index],
                  const Icon(Icons.play_circle, color: Colors.white),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
