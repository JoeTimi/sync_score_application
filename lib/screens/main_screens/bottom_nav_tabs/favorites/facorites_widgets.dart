import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sync_score_application/core/clickable_widget.dart';
import 'package:sync_score_application/core/consts.dart';

//team last status widget...
class TeamLastStatusWidget extends StatelessWidget {
  final String logo, name, one, two, three, four, five;
  final Function()? onTap;

  const TeamLastStatusWidget({
    super.key,
    required this.logo,
    required this.name,
    required this.one,
    required this.two,
    required this.three,
    required this.four,
    required this.five,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWellWidget(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(height: 18, width: 18, logo),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF23262D),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 4),
                RichText(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: "$one ",
                    style: TextStyle(
                      color: one == "L"
                          ? const Color(0xFFFF0D00)
                          : one == "W"
                              ? const Color(0xFF48AB93)
                              : const Color(0xFF746C82),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Fellix",
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "$two ",
                        style: TextStyle(
                          color: two == "L"
                              ? const Color(0xFFFF0D00)
                              : two == "W"
                                  ? const Color(0xFF48AB93)
                                  : const Color(0xFF746C82),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Fellix",
                        ),
                      ),
                      TextSpan(
                        text: "$three ",
                        style: TextStyle(
                          color: three == "L"
                              ? const Color(0xFFFF0D00)
                              : three == "W"
                                  ? const Color(0xFF48AB93)
                                  : const Color(0xFF746C82),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Fellix",
                        ),
                      ),
                      TextSpan(
                        text: "$four ",
                        style: TextStyle(
                          color: four == "L"
                              ? const Color(0xFFFF0D00)
                              : four == "W"
                                  ? const Color(0xFF48AB93)
                                  : const Color(0xFF746C82),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Fellix",
                        ),
                      ),
                      TextSpan(
                        text: "$five ",
                        style: TextStyle(
                          color: five == "L"
                              ? const Color(0xFFFF0D00)
                              : five == "W"
                                  ? const Color(0xFF48AB93)
                                  : const Color(0xFF746C82),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Fellix",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          SvgPicture.asset("assets/main_icons/right_side2.svg")
        ],
      ),
    );
  }
}

//players items widgets...
class PlayersItemsWidgets extends StatelessWidget {
  final String number, name, logo, city, goals, goalsRatio, matches;

  const PlayersItemsWidgets({
    super.key,
    required this.number,
    required this.goals,
    required this.goalsRatio,
    required this.matches,
    required this.name,
    required this.logo,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 40,
            child: Text(
              number,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF121212),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF121212),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: <Widget>[
                    Image.asset(
                      height: 11.36,
                      width: 11.36,
                      logo,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        city,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFFA4A4A4),
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              goals,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF121212),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              goals,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF23AE00),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              matches,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFA4A4A4),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//match time items widget...
class MatchTimeItemsWidget extends StatelessWidget {
  final String tOneName, tTwoName, tOneLogo, tTwoLogo, timeDate;
  final Function()? onNotificationTap;

  const MatchTimeItemsWidget({
    super.key,
    required this.tOneName,
    required this.tTwoName,
    required this.tOneLogo,
    required this.tTwoLogo,
    required this.timeDate,
    this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(
                      height: 18,
                      width: 18,
                      tOneLogo,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        tOneName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFF23262D),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: <Widget>[
                    Image.asset(
                      height: 18,
                      width: 18,
                      tTwoLogo,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        tTwoName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFF23262D),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            timeDate,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.end,
            style: const TextStyle(
              color: Color(0xFF64666B),
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWellWidget(
                onTap: onNotificationTap,
                child: SvgPicture.asset("assets/main_icons/notification.svg"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//table drop widget...
class TableDropWidget extends StatefulWidget {
  const TableDropWidget({super.key});

  @override
  State<TableDropWidget> createState() => _TableDropWidgetState();
}

class _TableDropWidgetState extends State<TableDropWidget> {
  String selectedLeague = '';

  final List<String> leagueItems = [
    "Premier League",
    "Weekly",
  ];

  @override
  void initState() {
    selectedLeague = leagueItems[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: const Color(0xFFCDCDCD),
          width: 1,
        ),
      ),
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
              return leagueItems.map<Widget>((String item) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    item,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Color(0xFF23262D),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              }).toList();
            },
            items: leagueItems
                .map(
                  (item) => DropdownMenuItem<String>(
                    value: item,
                    child: item == selectedLeague
                        ? Text(
                            item,
                            style: const TextStyle(
                              color: Color(0xFF23262D),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          )
                        : Text(
                            item,
                            style: const TextStyle(
                              color: Color(0xFFB1B2B2),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                  ),
                )
                .toList(),
            value: selectedLeague,
            onChanged: (value) {
              setState(() {
                selectedLeague = value as String;
              });
            },
            buttonStyleData: const ButtonStyleData(
              height: 40,
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
                borderRadius: BorderRadius.circular(5),
                color: whiteColor,
                border: Border.all(
                  color: const Color(0xFFCDCDCD),
                  width: 1,
                ),
              ),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: WidgetStateProperty.all(2),
                thumbVisibility: WidgetStateProperty.all(true),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
              padding: EdgeInsets.only(left: 10, right: 10),
            ),
          ),
        ),
      ),
    );
  }
}

//fav player items widget...
class FavPlayerItemsWidget extends StatefulWidget {
  final String title;

  const FavPlayerItemsWidget({
    super.key,
    required this.title,
  });

  @override
  State<FavPlayerItemsWidget> createState() => _FavPlayerItemsWidgetState();
}

class _FavPlayerItemsWidgetState extends State<FavPlayerItemsWidget> {
  bool isStared = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: <Widget>[
          Container(
            height: 20,
            width: 20,
            margin: const EdgeInsets.only(right: 10),
            decoration: const BoxDecoration(
              color: Color(0xFFD9D9D9),
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              widget.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF121212),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          InkWellWidget(
            onTap: () {
              setState(() {
                isStared = !isStared;
              });
            },
            child: SvgPicture.asset(
              isStared
                  ? "assets/main_icons/fill_star.svg"
                  : "assets/main_icons/star.svg",
            ),
          ),
        ],
      ),
    );
  }
}
