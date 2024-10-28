import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sync_score_application/core/clickable_widget.dart';
import 'package:sync_score_application/core/consts.dart';

//time drop widget...
class TimeDropWidget extends StatefulWidget {
  const TimeDropWidget({super.key});

  @override
  State<TimeDropWidget> createState() => _TimeDropWidgetState();
}

class _TimeDropWidgetState extends State<TimeDropWidget> {
  String selectedTime = '';

  final List<String> timeItems = [
    "Today",
    "Weekly",
  ];

  @override
  void initState() {
    selectedTime = timeItems[1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 100,
      child: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            iconStyleData: IconStyleData(
              icon: SvgPicture.asset(
                "assets/main_icons/down_side1.svg",
              ),
            ),
            selectedItemBuilder: (BuildContext context) {
              return timeItems.map<Widget>((String item) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    item,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              }).toList();
            },
            items: timeItems
                .map(
                  (item) => DropdownMenuItem<String>(
                    value: item,
                    child: item == selectedTime
                        ? Text(
                            item,
                            style: const TextStyle(
                              color: blackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          )
                        : Text(
                            item,
                            style: const TextStyle(
                              color: Color(0xFFB1B2B2),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                  ),
                )
                .toList(),
            value: selectedTime,
            onChanged: (value) {
              setState(() {
                selectedTime = value as String;
              });
            },
            buttonStyleData: const ButtonStyleData(
              height: 30,
              width: double.infinity,
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              elevation: 0,
              offset: const Offset(0, -5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFFAFAFA),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      offset: const Offset(0, -4),
                      spreadRadius: 0,
                      color: blackColor.withOpacity(.10),
                    )
                  ]),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: WidgetStateProperty.all(2),
                thumbVisibility: WidgetStateProperty.all(true),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 30,
              padding: EdgeInsets.only(left: 10, right: 10),
            ),
          ),
        ),
      ),
    );
  }
}

//title widget...
class TitleWidget extends StatelessWidget {
  final String logo, name, flag, countryName, lastIcon;
  final Function()? onTap;

  const TitleWidget({
    super.key,
    required this.logo,
    required this.name,
    required this.flag,
    required this.countryName,
    this.onTap,
     this.lastIcon ="assets/main_icons/right_side2.svg",
  });

  @override
  Widget build(BuildContext context) {
    return InkWellWidget(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: <Widget>[
            Image.asset(
              height: 24,
              width: 24,
              logo,
            ),
            const SizedBox(width: 12),
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: blackColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 10),
            SvgPicture.asset(flag),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                countryName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: mainAppColor.withOpacity(.48),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(width: 10),
            SvgPicture.asset(lastIcon),
          ],
        ),
      ),
    );
  }
}

//league items widget...
class LeagueItemsWidget extends StatelessWidget {
  final String ft,
      tOneName,
      tTwoName,
      tOneLogo,
      tTwoLogo,
      tOnePoints,
      tTwoPoints;
  final bool isLive, isStared;
  final Function()? onTap, onStarTap;

  const LeagueItemsWidget({
    super.key,
    this.onTap,
    required this.ft,
    required this.tOneName,
    required this.tTwoName,
    required this.tOneLogo,
    required this.tTwoLogo,
    required this.tOnePoints,
    required this.tTwoPoints,
    required this.isLive,
    required this.isStared,
    this.onStarTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWellWidget(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: blackColor.withOpacity(.06),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: 48,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: blackColor.withOpacity(.06),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  if (isLive)
                    Align(
                      alignment: Alignment.centerLeft,
                      child:
                          SvgPicture.asset("assets/main_icons/live_line.svg"),
                    ),
                  Center(
                    child: RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: ft,
                        style: const TextStyle(
                          color: mainAppColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Fellix",
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "\nFT",
                            style: TextStyle(
                              color: blackColor.withOpacity(.48),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Fellix",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset(
                        height: 16,
                        width: 16,
                        tOneLogo,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          tOneName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        tOnePoints,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: <Widget>[
                      Image.asset(
                        height: 16,
                        width: 16,
                        tTwoLogo,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          tTwoName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        tTwoPoints,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            IconButtonWidget(
              onPressed: onStarTap,
              icon: SvgPicture.asset(
                isStared
                    ? "assets/main_icons/fill_star.svg"
                    : "assets/main_icons/star.svg",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//status items widget...
class StatusItemsWidget extends StatelessWidget {
  final String title, subTitle, icon, number, score;
  final bool isShowScore, isLeft;

  const StatusItemsWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.number,
    required this.score,
    required this.isShowScore,
    required this.isLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 12,
          width: 1,
          color: const Color(0xFF5D5669).withOpacity(.16),
          margin: const EdgeInsets.symmetric(vertical: 4),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: isLeft
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: blackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          subTitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: blackColor.withOpacity(.48),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SvgPicture.asset(icon),
                  const SizedBox(height: 4),
                  Text(
                    number,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: blackColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  if (isShowScore)
                    Container(
                      height: 16,
                      width: 30,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE55A53).withOpacity(.36),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          score,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFFE55A53),
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
            Expanded(
              child: isLeft == false
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: blackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          subTitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: blackColor.withOpacity(.48),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
            )
          ],
        ),
      ],
    );
  }
}

//row widget...
class RowWidget extends StatelessWidget {
  final String icon, title;

  const RowWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SvgPicture.asset(icon),
        const SizedBox(width: 4),
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: blackColor,
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

//line up player widget...
class LineUpPlayerWidget extends StatelessWidget {
  final String number, name;
  final bool isShowRed, isShowYellow, isShowBoth, isBlue;

  const LineUpPlayerWidget({
    super.key,
    required this.number,
    required this.name,
    this.isShowRed = false,
    this.isShowYellow = false,
    this.isShowBoth = false,
    this.isBlue = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 24,
              width: 24,
              margin: const EdgeInsets.only(
                  left: 10, bottom: 4, top: 10, right: 10),
              decoration: BoxDecoration(
                color:
                    isBlue ? const Color(0xFF93C5FD) : const Color(0xFFFFA39E),
                shape: BoxShape.circle,
                border: Border.all(
                  color: isBlue
                      ? const Color(0xFF3465D1)
                      : const Color(0xFFC94038),
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  number,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: blackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            if (isShowYellow)
              Positioned(
                right: 0,
                top: 0,
                child: SvgPicture.asset("assets/main_icons/yellow.svg"),
              ),
            if (isShowRed)
              Positioned(
                right: -6,
                top: 0,
                child: SvgPicture.asset("assets/main_icons/pink.svg"),
              ),
            if (isShowBoth)
              Positioned(
                right: -10,
                top: 0,
                child: Stack(
                  children: <Widget>[
                    SvgPicture.asset("assets/main_icons/pink.svg"),
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: SvgPicture.asset("assets/main_icons/yellow.svg"),
                    ),
                  ],
                ),
              ),
          ],
        ),
        Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: blackColor,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

//stats items widget...
class StatsItemsWidget extends StatelessWidget {
  final String onePer, twoPer, title;
  final double oneValue, twoValue;

  const StatsItemsWidget({
    super.key,
    required this.onePer,
    required this.twoPer,
    required this.title,
    required this.oneValue,
    required this.twoValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 26),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                onePer,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: blackColor.withOpacity(.48),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: blackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                twoPer,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: blackColor.withOpacity(.48),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: const Color(0xFF5D5669).withOpacity(.16),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: LinearPercentIndicator(
                    padding: EdgeInsets.zero,
                    lineHeight: 8,
                    isRTL: true,
                    barRadius: const Radius.circular(6),
                    percent: oneValue,
                    backgroundColor: const Color(0xFF5D5669).withOpacity(.16),
                    progressColor: const Color(0xFF746C82),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: const Color(0xFF5D5669).withOpacity(.16),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: LinearPercentIndicator(
                    padding: EdgeInsets.zero,
                    lineHeight: 8,
                    barRadius: const Radius.circular(6),
                    percent: twoValue,
                    backgroundColor: const Color(0xFF5D5669).withOpacity(.16),
                    progressColor: const Color(0xFFF87871),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
