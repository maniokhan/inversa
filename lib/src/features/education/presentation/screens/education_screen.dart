import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/common_widgets/common_app_bar.dart';
import 'package:inversaapp/src/common_widgets/common_education_card.dart';
import 'package:inversaapp/src/common_widgets/common_scaffold.dart';
import 'package:inversaapp/src/features/education/presentation/provider/education_provider.dart';
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
  VideoPlayerController? _videoPlayerController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final educationVideos = ref.watch(educationVideoProvider);
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
      body: educationVideos.when(
        data: (data) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
            child: GridView.builder(
              itemCount: data.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 3 / 3.5,
              ),
              itemBuilder: (context, index) {
                final educationdata = data.elementAt(index);
                final url = educationdata['url'].toString();
                _videoPlayerController = VideoPlayerController.network(
                  url,
                )..initialize().then((_) {
                    _videoPlayerController!.pause();
                  });
                return CommonEducationCard(
                  onTap: () {
                    Navigator.push(
                        context, EducationDetailsScreen.route(educationdata));
                  },
                  image: Stack(
                    alignment: Alignment.center,
                    children: [
                      AspectRatio(
                        aspectRatio: 3 / 2,
                        child: VideoPlayer(_videoPlayerController!),
                      ),
                      const Icon(Icons.play_circle, color: Colors.white),
                    ],
                  ),
                  title: educationdata['title'].toString(),
                  description: educationdata['descriptions'].toString(),
                );
              },
            ),
          );
        },
        error: (error, stackTrace) {
          return const Center(
            child: Text("Something went wrong"),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
