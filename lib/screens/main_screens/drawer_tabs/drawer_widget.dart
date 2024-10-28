import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sync_score_application/core/consts.dart';

//table drop widget...
class CountryDropWidget extends StatefulWidget {
  const CountryDropWidget({super.key});

  @override
  State<CountryDropWidget> createState() => _CountryDropWidgetState();
}

class _CountryDropWidgetState extends State<CountryDropWidget> {
  String selectedCountry = '';

  final List<String> countryItems = [
    "UK",
    "America",
  ];

  @override
  void initState() {
    selectedCountry = countryItems[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: double.infinity,
      padding: EdgeInsets.only(left: 20,right: 10),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFD9D9D9),
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
                "assets/main_icons/right_side.svg",
              ),
            ),
            selectedItemBuilder: (BuildContext context) {
              return countryItems.map<Widget>((String item) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    item,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Color(0xFF17191C),
                      fontSize: 12,
                      fontFamily: "Fellix",
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              }).toList();
            },
            items: countryItems
                .map(
                  (item) => DropdownMenuItem<String>(
                    value: item,
                    child: item == selectedCountry
                        ? Text(
                            item,
                            style: const TextStyle(
                              color: Color(0xFF17191C),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Fellix",
                            ),
                            overflow: TextOverflow.ellipsis,
                          )
                        : Text(
                            item,
                            style: const TextStyle(
                              color: Color(0xFFB1B2B2),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Fellix",
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                  ),
                )
                .toList(),
            value: selectedCountry,
            onChanged: (value) {
              setState(() {
                selectedCountry = value as String;
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
                  color: const Color(0xFFD9D9D9),
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
