import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sync_score_application/base_client.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/models/news_models.dart';
import '../../home/home_tabs/team_detail/team_two_tabs/news_detail_screen.dart';
import '../new_widgets.dart';



class NewsTransferTab extends StatefulWidget {
  const NewsTransferTab({super.key});

  @override
  State<NewsTransferTab> createState() => _NewsTransferTabState();
}

class _NewsTransferTabState extends State<NewsTransferTab> {
  List<Article> newsList = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    try {
      final response = await BaseClient().get('/news'); // Adjust endpoint if necessary
      final data = json.decode(response); // Decode JSON response

      // Print the API response for debugging
      debugPrint("API Response: $data");

      // Check and parse the articles from the response
      if (data != null && data['articles'] != null) {
        debugPrint('Data successfully received');
        if (data['articles'] is List) {
          setState(() {
            newsList = (data['articles'] as List).map<Article>((json) => Article.fromJson(json)).toList();
            _isLoading = false;
          });
        }
      } else {
        debugPrint('Error: API response does not contain valid data');
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint('Error fetching news: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: dp, vertical: dp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: newsList.map((article) {
            return NewOneItemsWidget(
              image: article.urlToImage ?? "assets/main_images/news3.png",
              title: article.title ?? "No Title",
              isShowPlay: false,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => NewsDetailScreen(
                      title: article.title ?? "No Title",
                      description: article.description ?? "No Description Available",
                      imageUrl: article.urlToImage ?? "assets/main_images/news3.png",
                      videoUrl: article.url ?? "", // Placeholder for video if needed
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}


