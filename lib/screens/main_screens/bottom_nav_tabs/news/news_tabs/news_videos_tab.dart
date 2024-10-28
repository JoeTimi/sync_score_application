import 'package:flutter/material.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/base_client.dart';
import 'package:sync_score_application/models/videos_model.dart'; // Assuming the video model is saved here

import '../../home/home_tabs/team_detail/team_two_tabs/news_detail_screen.dart';
import '../new_widgets.dart';


class NewsVideosTab extends StatefulWidget {
  const NewsVideosTab({super.key});

  @override
  State<NewsVideosTab> createState() => _NewsVideosTabState();
}

class _NewsVideosTabState extends State<NewsVideosTab> {
  List<Result> _videos = [];
  bool _isLoading = true;



  @override
  void initState() {
    super.initState();
    _fetchVideos();
  }

  Future<void> _fetchVideos() async {
    try {
      var response = await BaseClient().get("/videos"); // Adjust the endpoint
      print("API Response: $response");

      Welcome videoData = Welcome.fromJson(response); // Decode the response using your model
      // print("Parsed video data: ${videoData.toJson()}");
      print("Fetched videos: ${videoData.result}");
      setState(() {
        _videos = videoData.result ?? []; // Populate the video list
        _isLoading = false;
      });
      print("After setState: _videos count=${_videos.length}");
    }
      catch (e) {
      // Handle error
      print("Error fetching videos: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : _videos.isEmpty
        ? const Center(child: Text("No videos available"))
        : SingleChildScrollView(
           child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: dp, vertical: dp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            for (var video in _videos)
              NewOneItemsWidget(
                image: "assets/main_images/news3.png", // Use a default image for now
                title: video.videoTitle ?? "No Title", // Display video title
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          NewsDetailScreen(
                              videoUrl: video.videoUrl ?? "",
                            title: video.videoTitle ?? "No Title",
                            description: "Some description related to the video here.",
                            imageUrl: "http://example.com/path/to/image.jpg",
                          ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:sync_score_application/core/consts.dart';
//
// import '../../home/home_tabs/team_detail/team_two_tabs/news_detail_screen.dart';
// import '../new_widgets.dart';
//
// class NewsVideosTab extends StatefulWidget {
//   const NewsVideosTab({super.key});
//
//   @override
//   State<NewsVideosTab> createState() => _NewsVideosTabState();
// }
//
// class _NewsVideosTabState extends State<NewsVideosTab> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: dp, vertical: dp),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             NewOneItemsWidget(
//               image: "assets/main_images/news3.png",
//               title: "Dieng Leaves AL-Ahly for Turkey Join Al-Khoolood SC",
//               onTap: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (BuildContext context) => const NewsDetailScreen(),
//                   ),
//                 );
//               },
//             ),
//             NewOneItemsWidget(
//               image: "assets/main_images/news3.png",
//               title: "Dieng Leaves AL-Ahly for Turkey Join Al-Khoolood SC",
//               onTap: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (BuildContext context) => const NewsDetailScreen(),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
