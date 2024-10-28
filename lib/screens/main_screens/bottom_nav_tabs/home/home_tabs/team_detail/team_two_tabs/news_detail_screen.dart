import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sync_score_application/core/clickable_widget.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class NewsDetailScreen extends StatefulWidget {
  final String videoUrl;
  final String title;
  final String description;
  final String imageUrl; // URL for the image if needed


  const NewsDetailScreen ({
    super.key,
    this.videoUrl = '',
    this.title = 'No Title Available',
    this.description = 'No Description Available',
    this.imageUrl = 'assets/main_image/placeholder.jpg',
  });

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  late VideoPlayerController _controller;
  ChewieController? _chewieController;
  bool _isError = false;


  @override
  void initState() {
    super.initState();
    if (widget.videoUrl.isNotEmpty){
      _initializeVideoPlayer();
    }
  }

  Future<void> _initializeVideoPlayer() async {
    try{
      _controller = VideoPlayerController.network(widget.videoUrl);
      await _controller.initialize();
      if (mounted) {
        setState(() {
          _chewieController = ChewieController(
            videoPlayerController: _controller,
            autoPlay: true,
            aspectRatio: _controller.value.aspectRatio,
            looping: false,
          );
        });
      }
    } catch (error) {
      setState(() {
        _isError = true;
      });
      debugPrint('Error initializing video player: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: mainAppColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFFFAFAFA),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWellWidget(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50,
                  color: mainAppColor,
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(dp),
                          child: SizedBox(
                            width: 50,
                            height: 30,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: SvgPicture.asset(
                                height: 10,
                                width: 6,
                                "assets/main_icons/left_side.svg",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            widget.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: whiteColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(dp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.title,
                          style: const TextStyle(
                            color: Color(0xFF23262D),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Some publication date or additional info here.",
                          style: TextStyle(
                            color: Color(0xFF64666B),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Container(
                          height: 186,
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(widget.imageUrl),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text(
                          widget.description,
                          style: const TextStyle(
                            color: Color(0xFF64666B),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 12),
                        if (widget.videoUrl.isNotEmpty && !_isError)
                          _chewieController != null
                        ? Chewie(controller: _chewieController!,)
                              : const CircularProgressIndicator()
                        else if (_isError)
                          const Text(
                            'Error loading video',
                            style: TextStyle(color: Colors.red),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
    @override
    void dispose() {
      _controller.dispose();
      _chewieController?.dispose();
      super.dispose();
    }
}
