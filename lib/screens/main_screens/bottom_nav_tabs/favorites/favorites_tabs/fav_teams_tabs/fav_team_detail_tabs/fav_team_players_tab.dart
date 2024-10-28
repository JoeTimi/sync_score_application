import 'package:flutter/material.dart';
import 'package:sync_score_application/core/consts.dart';
import '../../../facorites_widgets.dart';

class FavTeamPlayerTab extends StatefulWidget {
  const FavTeamPlayerTab({super.key});

  @override
  State<FavTeamPlayerTab> createState() => _FavTeamPlayerTabState();
}

class _FavTeamPlayerTabState extends State<FavTeamPlayerTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: dp, vertical: dp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "All Players",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: blackColor.withOpacity(.48),
                fontSize: 8,
                fontWeight: FontWeight.w500,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                20,
                (index) {
                  return const FavPlayerItemsWidget(
                    title: "Erling Haaland",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
