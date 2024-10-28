import 'package:flutter/material.dart';
import 'package:sync_score_application/core/clickable_widget.dart';
import 'package:sync_score_application/core/consts.dart';

//line widget...
class LineWidget extends StatelessWidget {
  final double top, bottom;
  final Color lineColor;

  const LineWidget({
    super.key,
    this.top = 10,
    this.bottom = 10,
    this.lineColor = textColorOne,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: double.infinity,
      color: textColorOne.withOpacity(.50),
      margin: EdgeInsets.only(top: top, bottom: bottom),
    );
  }
}

//tea, items widget...
class TeamItemWidget extends StatefulWidget {
  final String index, icon, name, m, w, d, l, g, pts;
  final Color lineColor;
  final bool isClickDisable;

  const TeamItemWidget({
    super.key,
    required this.index,
    required this.icon,
    required this.name,
    this.lineColor = whiteColor,
    this.m = "",
    this.w = "",
    this.d = "",
    this.l = "",
    this.g = "",
    this.pts = "",
    this.isClickDisable = false,
  });

  @override
  State<TeamItemWidget> createState() => _TeamItemWidgetState();
}

class _TeamItemWidgetState extends State<TeamItemWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWellWidget(
      onTap: widget.isClickDisable
          ? null
          : () {
              setState(() {
                isSelected = !isSelected;
              });
            },
      child: Container(
        height: 36,
        width: double.infinity,
        padding: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFEBF0FA) : whiteColor,
          border: Border(
            bottom: BorderSide(
              color: isSelected
                  ? const Color(0xFFEBF0FA)
                  : const Color(0xFFF1F1F1),
              width: 1,
            ),
            left: BorderSide(
              color: isSelected
                  ? const Color(0xFFEBF0FA)
                  : const Color(0xFFF1F1F1),
              width: 1,
            ),
            right: BorderSide(
              color: isSelected
                  ? const Color(0xFFEBF0FA)
                  : const Color(0xFFF1F1F1),
              width: 1,
            ),
          ),
        ),
        child: Center(
          child: Row(
            children: <Widget>[
              Container(
                height: 36,
                width: 2,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: widget.lineColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Text(
                widget.index,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFF34363D),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 6,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset(
                      height: 20,
                      width: 20,
                      widget.icon,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      widget.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF34363D),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  widget.m,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF23262D),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  widget.w,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF23262D),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  widget.d,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF23262D),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  widget.l,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF23262D),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              SizedBox(
                width: 60,
                child: Text(
                  widget.g,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF23262D),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  widget.pts,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
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
    );
  }
}
