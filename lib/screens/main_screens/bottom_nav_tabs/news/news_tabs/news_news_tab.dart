// import 'package:flutter/material.dart';
// import 'package:sync_score_application/core/consts.dart';
// import 'package:sync_score_application/screens/main_screens/bottom_nav_tabs/home/home_one_widgets.dart';
// import '../../home/home_tabs/team_detail/team_two_tabs/news_detail_screen.dart';
// import '../new_widgets.dart';
// import 'package:sync_score_application/base_client.dart';
//
//
// class NewsNewsTab extends StatefulWidget {
//   const NewsNewsTab({super.key});
//
//   @override
//   State<NewsNewsTab> createState() => _NewsNewsTabState();
// }
//
// class _NewsNewsTabState extends State<NewsNewsTab> {
//   List<dynamic> newsList = [];
//   bool isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchNews();
//   }
//
//   Future<void> _fetchNews() async {
//     try {
//       // Assuming your API endpoint is '/news'
//       final response = await BaseClient().get(null, path: 'https://node-m96t.onrender.com/api/news');
//
//       // If the response contains news data, parse it
//       if (response != null && response['data'] != null) {
//         setState(() {
//           newsList = response['data']; // Assuming the news data is in the 'data' field
//           isLoading = false; // Set loading to false once data is fetched
//         });
//       }
//     } catch (e) {
//       debugPrint('Error fetching news: $e');
//       setState(() {
//         isLoading = false; // Stop loading in case of an error
//       });
//     }
//   }
//
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
//               isShowPlay: false,
//               onTap: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (BuildContext context) => const NewsDetailScreen(),
//                   ),
//                 );
//               },
//             ),
//             NewItemsWidget(
//               image: "assets/main_images/news1.png",
//               title:
//                   "Manchester United 'extremely close' to signing Darwin Nunez",
//               date: "07/04/2024",
//               onTap: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (BuildContext context) => const NewsDetailScreen(),
//                   ),
//                 );
//               },
//             ),
//             NewItemsWidget(
//               image: "assets/main_images/news1.png",
//               title:
//                   "Manchester United 'extremely close' to signing Darwin Nunez",
//               date: "07/04/2024",
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

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/screens/main_screens/bottom_nav_tabs/home/home_one_widgets.dart';
import '../../home/home_tabs/team_detail/team_two_tabs/news_detail_screen.dart';
import '../new_widgets.dart';

class NewsNewsTab extends StatefulWidget {
  const NewsNewsTab({super.key});

  @override
  State<NewsNewsTab> createState() => _NewsNewsTabState();
}

class _NewsNewsTabState extends State<NewsNewsTab> {
  List<dynamic> newsList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    final url = Uri.parse('https://node-m96t.onrender.com/api/news');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Print the API response to check its structure
        debugPrint("API Response: $data");

        // Check if the data contains a 'data' key with a list
        if (data != null && data['articles'] != null) {
          debugPrint('dohddiohdhidhdiej');
          if (data['articles'].runtimeType != List) return;
          debugPrint('is here........');
          setState(() {
            newsList = data['articles']; // Assign the list of news
            isLoading = false;
          });
        } else {
          // Handle case where 'data' might not be a list or is null
          debugPrint('Error: API response does not contain valid data');
          setState(() {
            isLoading = false;
          });
        }
      } else {
        debugPrint('Error: ${response.statusCode}');
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      debugPrint('Error fetching news: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: dp, vertical: dp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: newsList.isEmpty
              ? [
            const Center(
              child: Text('No news available'),
            )
          ]
              : List<Widget>.from(newsList.map((newsItem) {
            return NewItemsWidget(
              image: newsItem['image'] ?? 'assets/main_images/news1.png',
              title: newsItem['title'] ?? 'No title available',
              date: newsItem['date'] ?? 'Unknown date',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                    const NewsDetailScreen(title: '', description: '', imageUrl: '',),
                  ),
                );
              },
            );
          })),
        ),
      ),
    );
  }
}