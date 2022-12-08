import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../core/themes.dart';
import '../../../view_model/provider/coin/search_provider.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  TextEditingController search = TextEditingController() ;
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(builder: (context,provider,child){
      return Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top * 1),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Themes.isDarkMode(context) ? Color.fromRGBO(66, 66, 66, 1)
                      : Colors.white,
                  child: TextFormField(
                    onChanged: (value){
                      provider.getSearchCoin(value);
                    } ,
                    controller: search ,
                    decoration: InputDecoration(
                        hintText:'Searsh',
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                        suffixIcon: (IconButton(
                          onPressed: () {
                            search.clear() ;
                          },
                          icon: CircleAvatar(
                              radius: 12,
                              backgroundColor: Color.fromRGBO(195, 195, 195, 1),
                              child: Icon(
                                Icons.clear,
                              )),
                        ))),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                search.text.isEmpty ? Center(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*.2,),
                      SvgPicture.asset('asset/undraw_the_search_s0xf.svg' , width: 200,),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                      Text( 'Search for Coin',style: TextStyle(fontSize: 17),)
                    ],
                  ),
                ) : Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                      itemCount: provider.searchCoins.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 15, right: 15, left: 15),
                                  child: Container(
                                    width: double.infinity,
                                    height:
                                    MediaQuery.of(context).size.height *
                                        .11,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20) , ),color: Color.fromRGBO(21, 31, 43, 1)
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 15,
                                        ),
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(provider
                                              .searchCoins[index]
                                              .imageUrl ==
                                              ""
                                              ? "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png"
                                              : provider
                                              .searchCoins[index].imageUrl),
                                          radius: 20,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                provider
                                                    .searchCoins[index].name,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontSize: 10),
                                              ),
                                              Text(
                                                provider.searchCoins[index]
                                                    .symbol,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              .42,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "rank",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                provider
                                                    .searchCoins[index].rank
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.green),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ));
                      }),
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                      itemCount: provider.searchCoins.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 15, right: 15, left: 15),
                                  child: Container(
                                    width: double.infinity,
                                    height:
                                    MediaQuery.of(context).size.height *
                                        .11,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20)),
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 15,
                                        ),
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(provider
                                              .searchCoins[index]
                                              .imageUrl ==
                                              ""
                                              ? "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png"
                                              : provider
                                              .searchCoins[index].imageUrl),
                                          radius: 20,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                provider
                                                    .searchCoins[index].name,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontSize: 10),
                                              ),
                                              Text(
                                                provider.searchCoins[index]
                                                    .symbol,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              .42,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "rank",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                provider
                                                    .searchCoins[index].rank
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.green),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ));
                      }),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
