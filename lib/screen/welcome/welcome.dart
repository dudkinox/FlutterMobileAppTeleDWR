/// Line chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:dwr0001/Application/StationPage.dart';
import 'package:dwr0001/Models/data_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// ignore: must_be_immutable
class AreaAndLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final List<charts.Series> seriesList2;
  final bool animate;
  var data;

  AreaAndLineChart(this.data, this.seriesList, this.seriesList2,
      {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory AreaAndLineChart.withSampleData(data) {
    return new AreaAndLineChart(
      data,
      _createSampleData(data),
      _createSampleData2(data),
      // Disable animations for image tests.
      animate: true,
    );
  }

  final ScrollController _controllerOne = ScrollController();

  get padding => null;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _controllerOne,
      isAlwaysShown: true,
      child: GridView.builder(
        controller: _controllerOne,
        itemCount: 2,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Card(
                color: Colors.blue[100],
                child: Text(
                  index == 0
                      ? " กราฟแสดงปริมาณน้ำฝน (มม.) "
                      : index == 1
                          ? " กราฟแสดงระดับน้ำ (ม.รทก.) "
                          : " กราฟแสดงปริมาณน้ำ (ลบม. / วินาที) ",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Flexible(
                flex: 2,
                child: Card(
                  color: Colors.blue[50],
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: new charts.LineChart(
                    index == 0
                        ? seriesList
                        : index == 1
                            ? seriesList2
                            : "",
                    animate: animate,
                    customSeriesRenderers: [
                      new charts.LineRendererConfig(
                          // ID used to link series to this renderer.
                          customRendererId: 'customArea' + index.toString(),
                          includeArea: true,
                          stacked: true),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildImageCard(int index) => Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      );

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, double>> _createSampleData(var data) {
    // ignore: deprecated_member_use
    List<LinearSales> rain = new List<LinearSales>(data.length);
    for (var i = 0; i < data.length; i++) {
      rain[i] = new LinearSales(
          double.parse(i.toString()), double.parse(data[i].Rain_15_M));
    }

    return [
      new charts.Series<LinearSales, double>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: rain,
      )
        // Configure our custom bar target renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'customArea0'),
    ];
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales2, double>> _createSampleData2(
      var data) {
    var number = data.length;
    // ignore: deprecated_member_use
    List<LinearSales2> rain_D = new List<LinearSales2>(number);
    for (var i = 0; i < number; i++) {
      rain_D[i] = new LinearSales2(
          double.parse(i.toString()), double.parse(data[i].Water_D));
    }
    // ignore: deprecated_member_use
    List<LinearSales2> rain_F = new List<LinearSales2>(number);
    for (var j = 0; j < number; j++) {
      rain_F[j] = new LinearSales2(double.parse(j.toString()),
          double.parse(data[j].Water_F == null ? "0.0" : ""));
    }

    return [
      new charts.Series<LinearSales2, double>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales2 sales, _) => sales.year2,
        measureFn: (LinearSales2 sales, _) => sales.sales2,
        data: rain_D,
      ),
      // Configure our custom bar target renderer for this series.
      new charts.Series<LinearSales2, double>(
        id: 'Tablet',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (LinearSales2 sales, _) => sales.year2,
        measureFn: (LinearSales2 sales, _) => sales.sales2,
        data: rain_F,
      )..setAttribute(charts.rendererIdKey, 'customArea1'),
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final double year;
  final double sales;

  LinearSales(this.year, this.sales);
}

class LinearSales2 {
  final double year2;
  final double sales2;

  LinearSales2(this.year2, this.sales2);
}
