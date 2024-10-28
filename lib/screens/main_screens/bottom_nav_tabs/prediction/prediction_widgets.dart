import 'package:flutter/material.dart';
import 'package:sync_score_application/core/clickable_widget.dart';
import 'package:sync_score_application/core/consts.dart';

//prediction items widget...
class PredictionItemsWidget extends StatefulWidget {
  final String tOneLogo, tOneName, tTwoLogo, tTwoName, time;
  final Function()? onTap;

  const PredictionItemsWidget({
    super.key,
    required this.tOneLogo,
    required this.tOneName,
    required this.tTwoLogo,
    required this.tTwoName,
    this.onTap,
    required this.time,
  });

  @override
  State<PredictionItemsWidget> createState() => _PredictionItemsWidgetState();
}

class _PredictionItemsWidgetState extends State<PredictionItemsWidget> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 10, bottom: 16),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xFFC2C2C2),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWellWidget(
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
              },
              child: Container(
                height: 44,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: selectedIndex == 0
                      ? mainAppColor
                      : const Color(0xFFEDE9F5),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset(
                        height: 20,
                        width: 20,
                        widget.tOneLogo,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.tOneName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: selectedIndex == 0
                              ? whiteColor
                              : const Color(0xFF23262D),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.time,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFF23262D),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                "FT",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: blackColor.withOpacity(.48),
                  fontSize: 8,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: InkWellWidget(
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
              },
              child: Container(
                height: 44,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: selectedIndex == 1
                      ? mainAppColor
                      : const Color(0xFFEDE9F5),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset(
                        height: 20,
                        width: 20,
                        widget.tTwoLogo,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.tTwoName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: selectedIndex == 1
                              ? whiteColor
                              : const Color(0xFF23262D),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//prediction points widget...
class PredictionPointWidget extends StatelessWidget {
  final String title, points;
  final bool isRightPadding;

  const PredictionPointWidget({
    super.key,
    required this.title,
    required this.points,
    this.isRightPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(right: isRightPadding ? 18 : 0),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: const Color(0xFFD4D4D4),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF23262D),
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              points,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF23262D),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
