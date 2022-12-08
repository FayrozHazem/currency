import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../../core/themes.dart';
import '../../../view_model/provider/coin/details_provider.dart';
import '../../../view_model/provider/coin/home_provider.dart';
import '../../../view_model/provider/coin/profile_provider.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<DetailsProvider>(context);
    Provider.of<ProfileProvider>(context , listen: false).GetUser();
    return Consumer<HomeProvider>(builder: (context , provider , child){
      return Scaffold(
        appBar: AppBar(
          title: Text('Crypto Currency ',),
        ),
        body: ListView.builder(
            itemCount: provider.coins.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){
                  prov.getCoinDetails(provider.coins[index].id) ;
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .02),
                  child: Column(
                    children: [
                      SizedBox( height: MediaQuery.of(context).size.height * .015,),
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Themes.isDarkMode(context) ?  Color(0xff151f2c) : Colors.blueGrey,),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Row(
                          children: [
                            SizedBox(width: MediaQuery.of(context).size.width * .03,),
                            Text(provider.coins[index].rank.toString() ,),
                            SizedBox(width: MediaQuery.of(context).size.width * .023,),
                            CircleAvatar(
                              backgroundImage:NetworkImage(provider
                                  .coins[index].imgURL ==
                                  ""
                                  ? "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png"
                                  : provider.coins[index].imgURL),
                              radius: 20,
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width * .02,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(provider.coins[index].name ),
                                  Text(provider.coins[index].symbol ),
                                ],

                              ),
                            ),

                            SizedBox(width: MediaQuery.of(context).size.width * .37,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text( provider.coins[index].currentPrice.toString() , ),
                                  Text(provider.coins[index].priceChange .toStringAsFixed(3), style: TextStyle( color: provider.coins[index].priceChange > 0 ? Colors.green : Colors.red),),
                                  Text( '${provider.coins[index].priceChangePercentage.toStringAsFixed(3)}%', style: TextStyle(color: provider.coins[index].priceChangePercentage > 0 ? Colors.green : Colors.red),),
                                ],),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),

      );

    });
  }
}
