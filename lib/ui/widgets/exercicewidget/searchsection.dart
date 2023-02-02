// ignore: file_names
import 'package:appsport_project/ui/themes/themes.dart';
import 'package:flutter/material.dart';

class SearchSectionWidget extends StatelessWidget {
  const SearchSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5,left: 20,right: 20),
      //padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(30),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(child: TextField(
            autocorrect: true,
            cursorColor: Colors.black,
            cursorRadius: const Radius.circular(10),
            decoration: CustomThemes.textFieldStyle,
          )),
          InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: (){},
            child: Container(
              padding: const EdgeInsets.all(20),
              child: const Image(
                width:20,
                height:20,
                image: AssetImage("assets/images/loupe.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
