import 'package:flutter/material.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/screens/initial_screens/auth_screens/auth_widgets.dart';
import 'package:sync_score_application/screens/main_screens/bottom_nav_tabs/favorites/facorites_widgets.dart';

import '../../../home_one_widgets.dart';

class TableTwoTab extends StatefulWidget {
  final bool isShowDrop;

  const TableTwoTab({
    super.key,
    this.isShowDrop = false,
  });

  @override
  State<TableTwoTab> createState() => _TableTwoTabState();
}

class _TableTwoTabState extends State<TableTwoTab> {
  int selectedStage = 0;
  int selectedType = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: dp, vertical: dp),
            child: Column(
              children: <Widget>[
                if (widget.isShowDrop) const TableDropWidget(),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: OptionWidget(
                        height: 30,
                        width: double.infinity,
                        title: "Group Stage",
                        isSelected: selectedStage == 0 ? true : false,
                        onTap: () {
                          setState(() {
                            selectedStage = 0;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: OptionWidget(
                        height: 30,
                        width: double.infinity,
                        title: "Playoff Stage",
                        isSelected: selectedStage == 1 ? true : false,
                        onTap: () {
                          setState(() {
                            selectedStage = 1;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    OptionWidget(
                      height: 30,
                      width: 37,
                      title: "All",
                      isSelected: selectedType == 0 ? true : false,
                      onTap: () {
                        setState(() {
                          selectedType = 0;
                        });
                      },
                    ),
                    OptionWidget(
                      height: 30,
                      width: 50,
                      title: "Home",
                      isSelected: selectedType == 1 ? true : false,
                      onTap: () {
                        setState(() {
                          selectedType = 1;
                        });
                      },
                    ),
                    OptionWidget(
                      height: 30,
                      width: 50,
                      title: "Away",
                      isSelected: selectedType == 2 ? true : false,
                      onTap: () {
                        setState(() {
                          selectedType = 2;
                        });
                      },
                    ),
                  ],
                ),
                Container(
                  height: 36,
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    border: Border.all(
                      color: const Color(0xFFF1F1F1),
                      width: 1,
                    ),
                  ),
                  child: const Center(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "#",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0xFF34363D),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 6,
                          child: Text(
                            "Team",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xFF23262D),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            "M",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF23262D),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            "W",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF23262D),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            "D",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF23262D),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            "L",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF23262D),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(width: 4),
                        SizedBox(
                          width: 60,
                          child: Text(
                            "G",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF23262D),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            "PTS",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF23262D),
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  primary: false,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    return TeamItemWidget(
                      index: "${index + 1}",
                      icon: "assets/start_images/team1.png",
                      name: "Man City",
                      m: "31",
                      w: "21",
                      d: "7",
                      l: "3",
                      g: "99:26",
                      pts: "70",
                      isClickDisable: true,
                      lineColor: index.isEven
                          ? const Color(0xFF3766CF)
                          : const Color(0xFFFF6900),
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
