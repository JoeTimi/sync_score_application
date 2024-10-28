import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sync_score_application/core/consts.dart';

import '../../../home_widgets.dart';

class LineUpTab extends StatefulWidget {
  const LineUpTab({super.key});

  @override
  State<LineUpTab> createState() => _LineUpTabState();
}

class _LineUpTabState extends State<LineUpTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: dp),
            child: Container(
              color: const Color(0xFFF5F5F5),
              height: 650,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset("assets/main_icons/top.svg"),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset("assets/main_icons/center.svg"),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SvgPicture.asset("assets/main_icons/bottom.svg"),
                  ),
                  const Column(
                    children: <Widget>[
                      LineUpPlayerWidget(
                        number: "32",
                        name: "M. Lamb",
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: LineUpPlayerWidget(
                              number: "4",
                              name: "K. West",
                            ),
                          ),
                          Expanded(
                            child: LineUpPlayerWidget(
                              number: "18",
                              name: "M. Keynote",
                            ),
                          ),
                          Expanded(
                            child: LineUpPlayerWidget(
                              number: "3",
                              name: "A. Smith",
                              isShowYellow: true,
                            ),
                          ),
                          Expanded(
                            child: LineUpPlayerWidget(
                              number: "6",
                              name: "K. Kinsey",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: LineUpPlayerWidget(
                              number: "34",
                              name: "D. Partey",
                              isShowRed: true,
                            ),
                          ),
                          Expanded(
                            child: LineUpPlayerWidget(
                              number: "5",
                              name: "G. Marten",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: LineUpPlayerWidget(
                              number: "8",
                              name: "K. West",
                            ),
                          ),
                          Expanded(
                            child: LineUpPlayerWidget(
                              number: "7",
                              name: "M. Keynote",
                            ),
                          ),
                          Expanded(
                            child: LineUpPlayerWidget(
                              number: "35",
                              name: "A. Smith",
                              isShowBoth: true,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      LineUpPlayerWidget(
                        number: "9",
                        name: "A. Heard",
                      ),
                      SizedBox(height: 10),
                      LineUpPlayerWidget(
                        number: "32",
                        name: "M. Lamb",
                        isBlue: true,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: LineUpPlayerWidget(
                              number: "4",
                              name: "K. West",
                              isBlue: true,
                            ),
                          ),
                          Expanded(
                            child: LineUpPlayerWidget(
                              number: "18",
                              name: "M. Keynote",
                              isBlue: true,
                            ),
                          ),
                          Expanded(
                            child: LineUpPlayerWidget(
                              number: "3",
                              name: "A. Smith",
                              isShowYellow: true,
                              isBlue: true,
                            ),
                          ),
                          Expanded(
                            child: LineUpPlayerWidget(
                              number: "6",
                              name: "K. Kinsey",
                              isBlue: true,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: LineUpPlayerWidget(
                              number: "34",
                              name: "D. Partey",
                              isShowRed: true,
                              isBlue: true,
                            ),
                          ),
                          Expanded(
                            child: LineUpPlayerWidget(
                              number: "5",
                              name: "G. Marten",
                              isBlue: true,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: LineUpPlayerWidget(
                              number: "8",
                              name: "K. West",
                              isBlue: true,
                            ),
                          ),
                          Expanded(
                            child: LineUpPlayerWidget(
                              number: "7",
                              name: "M. Keynote",
                              isBlue: true,
                            ),
                          ),
                          Expanded(
                            child: LineUpPlayerWidget(
                              number: "35",
                              name: "A. Smith",
                              isShowBoth: true,
                              isBlue: true,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      LineUpPlayerWidget(
                        number: "9",
                        name: "A. Heard",
                        isBlue: true,
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
