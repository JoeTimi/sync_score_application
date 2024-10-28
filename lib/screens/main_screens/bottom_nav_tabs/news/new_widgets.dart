import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/clickable_widget.dart';

//news One items widget...
class NewOneItemsWidget extends StatelessWidget {
  final String image, title;
  final bool isShowPlay;
  final Function()? onTap;
  final String? videoUrl;

  const NewOneItemsWidget({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
    this.isShowPlay = true, this.videoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWellWidget(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 175,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                ),
              ),
              child: isShowPlay
                  ? Center(
                      child: SvgPicture.asset("assets/main_icons/play.svg"),
                    )
                  : const SizedBox(),
            ),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF1E1E1E),
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (videoUrl != null)
              IconButton(
                icon: const Icon(Icons.play_circle_filled),
                onPressed: () {
                  // Navigate to VideoPlayerScreen with videoUrl
                },
              ),
          ],
        ),
      ),
    );
  }
}
