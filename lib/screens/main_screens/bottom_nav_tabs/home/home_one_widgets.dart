import 'package:flutter/material.dart';
import 'package:sync_score_application/core/clickable_widget.dart';
import 'package:sync_score_application/core/consts.dart';

//option widget
class OptionWidget extends StatelessWidget {
  final String title;
  final double height, width;
  final bool isSelected, isRightP;
  final Function()? onTap;

  const OptionWidget({
    super.key,
    required this.title,
    required this.height,
    required this.width,
    required this.isSelected,
    this.onTap,
    this.isRightP = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWellWidget(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        margin: EdgeInsets.only(right: isRightP ? 10 : 0),
        decoration: BoxDecoration(
          color: isSelected ? mainAppColor : whiteColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: isSelected ? whiteColor : mainAppColor,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

//matches items widget...
class MatchesItemsWidget extends StatelessWidget {
  final String leagueName, tOneLogo, tOneName, tTwoLogo, tTwoName, time, date;
  final bool isBorderTop;
  final Function()? onTap;

  const MatchesItemsWidget({
    super.key,
    required this.tOneLogo,
    required this.tOneName,
    required this.tTwoLogo,
    required this.tTwoName,
    required this.time,
    required this.date,
    this.onTap,
    this.isBorderTop = true,
    this.leagueName = "",
  });

  @override
  Widget build(BuildContext context) {
    return InkWellWidget(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 10, bottom: 16),
        decoration: BoxDecoration(
          border: isBorderTop
              ? const Border(
                  top: BorderSide(
                    color: Color(0xFFC2C2C2),
                    width: 1,
                  ),
                )
              : const Border(
                  bottom: BorderSide(
                    color: Color(0xFFC2C2C2),
                    width: 1,
                  ),
                ),
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    leagueName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      height: 1,
                      color: blackColor.withOpacity(.48),
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    date,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      height: 1,
                      color: blackColor.withOpacity(.48),
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Image.network(
                        height: 20,
                        width: 20,
                        tOneLogo,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        tOneName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFF23262D),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  time,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF23262D),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image.network(
                        height: 20,
                        width: 20,
                        tTwoLogo,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        tTwoName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFF23262D),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//news items widget...
class NewItemsWidget extends StatelessWidget {
  final String image, title, date;
  final Function()? onTap;

  const NewItemsWidget({
    super.key,
    required this.image,
    required this.title,
    required this.date,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWellWidget(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: <Widget>[
            Container(
              height: 82,
              width: 120,
              margin: const EdgeInsets.only(right: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF23262D),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Date - $date",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: blackColor.withOpacity(.48),
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
