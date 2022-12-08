import 'package:fayrouz_currency/view/screens/coin/home_screen.dart';
import 'package:fayrouz_currency/view/widget/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../view_model/provider/coin/details_provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsProvider>(builder: (context, provider, child) {
      var data = [
        ChartData(
            "1y", provider.coinDetails?.percentChange_1y ?? 0),
        ChartData(
            "200d", provider.coinDetails?.percentChange_200.toDouble() ?? 0),
        ChartData(
            "60d", provider.coinDetails?.percentChange_60.toDouble() ?? 0),
        ChartData(
            "30d", provider.coinDetails?.percentChange_30.toDouble() ?? 0),
        ChartData(
            "14d", provider.coinDetails?.percentChange_14.toDouble() ?? 0),
        ChartData(
            "7d", provider.coinDetails?.percentChange_7d.toDouble() ?? 0),
        ChartData(
            "24h", provider.coinDetails?.percentChange_24h.toDouble() ?? 0),

      ];
      return Scaffold(
        body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .04,
                ),
                Stack(
                  children: [
                    Image.network(
                      provider.coinDetails!.imgURL ,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.25,
                      fit: BoxFit.cover,
                    ),
                    IconButton(
                        onPressed: () {
                          Get.offAll(Nav());
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                        )),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            provider.coinDetails!.name,
                            style: TextStyle(fontSize: 22),
                          ),

                          Container(
                            child: Row(children: [
                              Text(
                                'Rank',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                              Container(
                                height: MediaQuery.of(context).size.height * 0.053,
                                width: MediaQuery.of(context).size.width * 0.09,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color.fromRGBO(67, 67, 67, 1)),
                                child: Center(
                                    child: Text(
                                      provider.coinDetails!.rank.toString(),
                                      style: TextStyle(color: Colors.white, fontSize: 15),
                                    )),
                              )
                            ],),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        provider.coinDetails!.symbol ,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        'price',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Row(
                        children: [
                          Text( provider.coinDetails!.currentPrice.toString()),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Text(
                            provider.coinDetails!.percentChange_24h.toString(),
                            style: TextStyle(color: provider.coinDetails!.percentChange_24h > 0 ? Colors.green : Colors.red),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Center(
                        child: Container(

                          height: 200,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * .9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.0),


                          ),
                          child: Card(
                            color:  Color(0xff151f2c) ,
                            child: SfCartesianChart(
                              primaryXAxis: CategoryAxis(
                                isVisible: true,
                                majorGridLines: MajorGridLines(width: 1),
                                axisLine: AxisLine(width: 3),
                                labelStyle: TextStyle(
                                    color: Colors.white , fontSize: 20),
                                majorTickLines: MajorTickLines(size: 0),
                              ),
                              primaryYAxis: CategoryAxis(isVisible: false),
                              series: <ChartSeries<ChartData, String>>[
                                LineSeries(dataSource: data,
                                    dataLabelSettings: DataLabelSettings(
                                        isVisible: true),
                                    width: 3,
                                    color: Colors.green,
                                    xValueMapper: (ChartData sales, _ ) =>
                                        sales.x.toString(),
                                    yValueMapper: (ChartData sales,_ ) => sales.y
                                ),


                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.028,
                      ),
                      Text(
                        'Description',
                        style: TextStyle(fontSize: 18),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Html(data: provider.coinDetails!.description.toString(),)
                      ),
                    ],
                  ),
                )
              ],
            )),
      );
    });
  }
}
class ChartData {
  ChartData(this.x, this.y);

  String x;
  double y;
}