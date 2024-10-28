import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sync_score_application/base_client.dart';
import 'package:sync_score_application/core/consts.dart';

import '../../../../../../../models/news_models.dart';
import '../../../home_one_widgets.dart';
import 'news_detail_screen.dart';

class NewsTab extends StatefulWidget {
  const NewsTab({super.key});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
 late Future<Welcome> _newsFuture;
  @override
  void initState() {
    super.initState();
    _newsFuture = fetchNews(); // Initialize the future to fetch news
  }

  Future<Welcome> fetchNews() async {
    BaseClient client = BaseClient();
    final response = await client.get('/news'); // Use the correct API endpoint

    if (response != null) {
      return Welcome.fromJson(response); // Parse response into model
    } else {
      throw Exception('Failed to load news');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: dp, vertical: dp),
            child: FutureBuilder<Welcome>(
              future: _newsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  final articles = snapshot.data?.articles ?? [];
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      final article = articles[index];
                      return NewItemsWidget(
                        image: article.urlToImage ?? 'assets/main_images/news_placeholder.png',
                        title: article.title ?? 'No Title',
                        date: article.publishedAt != null
                            ? DateFormat('MM/dd/yyyy').format(article.publishedAt!)
                            : 'Date Unavailable',
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => const NewsDetailScreen(),
                            ),
                          );
                        },
                      );
                    },
                  );
                } else {
                  return Center(child: Text('No news found.'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: dp, vertical: dp),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 const SizedBox(height: 20),
//                 NewItemsWidget(
//                   image: "assets/main_images/news1.png",
//                   title:
//                       "Manchester United 'extremely close' to signing Darwin Nunez",
//                   date: "07/04/2024",
//                   onTap: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (BuildContext context) =>
//                             const NewsDetailScreen(),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
