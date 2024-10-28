import 'package:flutter/material.dart';
import 'package:sync_score_application/core/consts.dart';

import '../../../home_one_widgets.dart';
import 'news_detail_screen.dart';

class NewsTab extends StatefulWidget {
  const NewsTab({super.key});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: dp, vertical: dp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20),
                NewItemsWidget(
                  image: "assets/main_images/news1.png",
                  title:
                      "Manchester United 'extremely close' to signing Darwin Nunez",
                  date: "07/04/2024",
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const NewsDetailScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
