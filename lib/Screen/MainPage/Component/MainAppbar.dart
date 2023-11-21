import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ovo_ui/Screen/Home/Component/dropdown_city.dart';
import 'package:ovo_ui/Screen/Home/Component/help_page.dart';

class mainappbar extends StatelessWidget {
  const mainappbar({Key? key, this.title}) : super(key: key);

  final String? title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: title == null
          ? Image.asset("assets/images/logoberes.png", height: 52)
          // dropdown()
          : Text(title!),
      actions: <Widget>[
        Padding(
            padding: const EdgeInsets.only(right: 17),
            child: IconButton(
              onPressed: () async {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return HelpPages();
                }));
              },
              icon: Icon(Icons.help),
            ) //SvgPicture.asset("assets/icons/bell.svg"),
            )
      ],
    );
  }
}
