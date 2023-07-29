// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/common_widgets/common_app_bar.dart';
import 'package:inversaapp/src/common_widgets/common_education_card.dart';
import 'package:inversaapp/src/common_widgets/common_scaffold.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:video_player/video_player.dart';

class EducationDetailsScreen extends ConsumerStatefulWidget {
  const EducationDetailsScreen({super.key, required this.educationInfo});
  final Widget educationInfo;
  static route(Widget education) {
    return MaterialPageRoute(
      builder: (_) => EducationDetailsScreen(educationInfo: education),
    );
  }

  @override
  ConsumerState<EducationDetailsScreen> createState() =>
      _EducationDetailsScreenState();
}

class _EducationDetailsScreenState
    extends ConsumerState<EducationDetailsScreen> {
  late final VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    // final educationVideos = ref.watch(educationVideoProvider);
    // final videoUrl = educationVideos.asData?.value.first['url'];
    _videoPlayerController =
        VideoPlayerController.asset('assets/splash_video.mp4');
    _videoPlayerController.addListener(() {
      setState(() {});
    });
    _videoPlayerController.initialize().then((_) => setState(() {}));
    _videoPlayerController.pause();
    super.initState();
  }

  void _playPauseVideo() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
    } else {
      _videoPlayerController.play();
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

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
        title: "Education Details",
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: VideoPlayer(
                    _videoPlayerController,
                  ),
                ),
                IconButton(
                  iconSize: 30,
                  onPressed: () {
                    _playPauseVideo();
                  },
                  icon: _videoPlayerController.value.isPlaying
                      ? const Icon(Icons.pause_circle, color: Colors.white)
                      : const Icon(Icons.play_circle, color: Colors.white),
                ),
              ],
            ),
            gapH12,
            CommonEducationCard(
              image: widget.educationInfo,
            ),
          ],
        ),
      ),
    );
  }
}
