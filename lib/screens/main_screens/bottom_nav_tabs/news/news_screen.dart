import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sync_score_application/core/clickable_widget.dart';
import 'package:sync_score_application/core/consts.dart';

import 'news_tabs/news_news_tab.dart';
import 'news_tabs/news_transfer_tab.dart';
import 'news_tabs/news_videos_tab.dart';

class NewsScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const NewsScreen({super.key, required this.scaffoldKey});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFFFAFAFA),
          body: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.fromLTRB(dp, 30, dp, dp),
                color: mainAppColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SvgPicture.asset("assets/start_icons/logo2.svg"),
                        InkWellWidget(
                          onTap: () {
                            widget.scaffoldKey.currentState!.openEndDrawer();
                          },
                          child: SvgPicture.asset(
                            "assets/main_icons/menu.svg",
                            colorFilter: const ColorFilter.mode(
                              whiteColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "NEWS",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(
                      height: 32,
                      child: TabBar(
                        labelColor: whiteColor,
                        unselectedLabelColor: Color(0xFF859AA5),
                        dividerHeight: 0,
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: whiteColor,
                        indicatorWeight: 1,
                        tabAlignment: TabAlignment.start,
                        padding: EdgeInsets.zero,
                        indicatorPadding: EdgeInsets.zero,
                        labelStyle: TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        unselectedLabelStyle: TextStyle(
                          color: Color(0xFF859AA5),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        tabs: [
                          Tab(
                            text: "NEWS",
                          ),
                          Tab(
                            text: "VIDEOS",
                          ),
                          Tab(
                            text: "TRANSFER",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: <Widget>[
                    NewsNewsTab(),
                    NewsVideosTab(),
                    NewsTransferTab(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
