import 'package:flutter/material.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/core/text_form_field_widget.dart';


class WinnersTab extends StatefulWidget {
  const WinnersTab({super.key});

  @override
  State<WinnersTab> createState() => _WinnersTabState();
}

class _WinnersTabState extends State<WinnersTab> {
  TextEditingController myDateController = TextEditingController();

  @override
  void initState() {
    myDateController.text = "2021/05/22  - 2021/08/12";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: dp, vertical: dp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormFieldWidget(
              hintText: '@gmail.com',
              labelText: "Select Date",
              myController: myDateController,
              textInputType: TextInputType.datetime,
            ),
          ],
        ),
      ),
    );
  }
}
