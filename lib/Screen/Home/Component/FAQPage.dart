import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ovo_ui/Constant/ProductJsModel.dart';
import 'package:ovo_ui/Screen/Home/Component/faq_services.dart';

class FAQPages extends StatefulWidget {
  @override
  _FAQPages createState() => _FAQPages();
}

class _FAQPages extends State<FAQPages> {
  List<FAQmodel> listfaqjs = [];

  _getData() async {
    listfaqjs = await getFAQJson.getFAQJs();
    setState(() {});
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQ"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                        offset: Offset(0, 5),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                    ],
                  ),
                  child: listfaqjs != null
                      ? listfaqjs.length > 0
                          ? Container(
                              margin: EdgeInsets.all(8),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(listfaqjs[index].judulfaq,
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black87)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(listfaqjs[index].deskripsifaq,
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w200,
                                            color: Colors.black87)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ]),
                            )
                          : SizedBox()
                      : SizedBox(),
                );
              },
              childCount: listfaqjs.length != null ? listfaqjs.length : 0,
            ),
          ),
        ],
      ),
    );
  }
}
