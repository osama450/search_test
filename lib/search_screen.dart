import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:search_test/search.dart';
import 'package:search_test/search_provider.dart';
import 'package:search_test/widget/widgets/app_text.dart';

import 'helper_tools/size_config.dart';
import 'helper_tools/theme/app_colors.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  test() {
    int i = 0;
    for (i = 0; i < 5; i++) {
      print(i.toString());
    }
    print(i.toString());
  }

  Future df() {}
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();
  String text = '';

  @override
  Widget build(BuildContext context) {
    final categoriesData = Provider.of<SearchProvider>(context, listen: false);
    categoriesData.callAPIForSearchData(text);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary.withOpacity(0.7),
        title: AppText(
          text: 'صفحه البحث',
          fontSize: 3.5,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: TextFormField(
                          onChanged: (valeu) {
                            setState(() {
                              text = valeu;
                            });
                          },
                          autofocus: true,
                          controller: _controller,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      BorderSide(color: Colors.grey[300])),
                              labelStyle: TextStyle(
                                  color: AppColors.primary, fontSize: 16),
                              labelText: 'بحث')),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    FadeInUp(
                      child: OutlineButton(
                          child: Text('بحث'),
                          onPressed: () {
                            Provider.of<SearchProvider>(context, listen: false)
                                .callAPIForSearchData(_controller.text);
                            setState(() {
                              text = _controller.text;
                            });
                          }),
                    ),
                  ],
                ),
              )),
              text != ''
                  ? SizedBox(child: Consumer<SearchProvider>(
                      builder: (_, pragma, __) {
                        return pragma.getSearchData == null
                            ? Center(
                                child: SpinKitRotatingCircle(
                                color: AppColors.primary,
                                size: 50.0,
                              ))
                            : Text(pragma.list.name);
                      },
                    ))
                  : Center(child: Text(''))
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildList(Search search, BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Provider.of<SearchProvider>(context, listen: false).count == 0
      ? Center(
          child: OutlineButton(
            child: Text('no data in search'),
          ),
        )
      : GridView.builder(
          padding: EdgeInsets.only(top: 15),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            childAspectRatio: 0.750,
          ),
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (_, int index) {
            return FlatButton(
              padding: EdgeInsets.all(7),
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (_) => ShowProductView(
                //               id: datum.id.toString(),
                //             )));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 5),
                          color: AppColors.grey.withOpacity(0.150),
                          blurRadius: 10)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(children: [
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              search.image,
                              fit: BoxFit.fitWidth,
                              height: size.height * 0.170,
                            ),
                          ),
                        ),
                      ]),
                      Divider(),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: size.width * 0.3150,
                        child: AppText(
                          color: AppColors.primary,
                          text: search.name,
                          fontSize: 3.2,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          AppText(
                            text: '${search.price.toString()}',
                            color: Colors.black54,
                            fontSize: 3.2,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Row(
                            children: [
                              AppText(
                                text: 'جم',
                                color: Colors.black54,
                                fontSize: 3.1,
                              ),
                              //   Spacer(),
                              SizedBox(
                                width: getProportionateScreenWidth(20),
                              ),
                              AppText(
                                text: search.price,
                                color: Colors.black54,
                                fontSize: 3.1,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: getSizeText(3.5),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: 10,
        );
}
