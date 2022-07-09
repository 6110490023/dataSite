import 'package:basicflutter/component/chartBar-conponent.dart';
import 'package:basicflutter/component/chartLine-conponent.dart';
import 'package:flutter/material.dart';
import '../../service/api-service.dart';
class InsightManpower extends StatefulWidget {
  const InsightManpower({Key? key}) : super(key: key);

  @override
  State<InsightManpower> createState() => _InsightManpowerState();
}

class _InsightManpowerState extends State<InsightManpower> {
  APIService apiService = APIService();
  List charts =  [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.charts = apiService.getManPowerChart();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insight Manpower'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width * 0.95 ,
              child: ChartLine(charts),
            ),

          SizedBox(
            height: 30,
          ),
        SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width *0.95,
              child: ChartBar(charts),
            ),
        ],
      ),
    );
  }
}
