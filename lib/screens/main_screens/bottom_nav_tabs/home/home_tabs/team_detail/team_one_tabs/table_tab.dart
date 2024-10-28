import 'package:flutter/material.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/screens/initial_screens/auth_screens/auth_widgets.dart';

class TableTab extends StatefulWidget {
  const TableTab({super.key});

  @override
  State<TableTab> createState() => _TableTabState();
}

class _TableTabState extends State<TableTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: dp),
            child: Column(
              children: <Widget>[
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
