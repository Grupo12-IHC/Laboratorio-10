import 'dart:math';

import 'package:chat_unsa/contacto.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GraficChart extends StatefulWidget {
  final Widget child;

  GraficChart(Contacto contacto, {Key key, this.child}) : super(key: key);

  _GraficChart createState() => _GraficChart();
}

class _GraficChart extends State<GraficChart> {
  List<charts.Series<Pollution, String>> _seriesData;
  List<charts.Series<Task, String>> _seriesPieData;
  List<charts.Series<Sales, int>> _seriesLineData;
  List<charts.Series<GaugeSegment, String>>_createSampleData;
  List<charts.Series<LinearSales, int>> _bucketingSampleData;
  List<charts.Series> seriesList;

  _generateData() {
    var data1 = [
      new Pollution(1980, 'Ingenieria', 30),
      new Pollution(1980, 'Sociales', 40),
      new Pollution(1980, 'Biomedicas', 50),
    ];
    var data2 = [
      new Pollution(1985, 'Ingenieria', 80),
      new Pollution(1980, 'Sociales', 90),
      new Pollution(1985, 'Biomedicas', 70),
    ];
    var data3 = [
      new Pollution(1985, 'Ingenieria', 100),
      new Pollution(1980, 'Sociales', 120),
      new Pollution(1985, 'Biomedica', 140),
    ];

    var piedata = [
      new Task('Turismo y Hoteleria', 35.8, Color(0xff3366cc)),
      new Task('Marketing', 8.3, Color(0xff990099)),
      new Task('Ing. Industrial', 10.8, Color(0xff109618)),
      new Task('Arquitectura', 15.6, Color(0xfffdbe19)),
      new Task('Medicina', 19.2, Color(0xffff9900)),
      new Task('Otros', 10.3, Color(0xffdc3912)),
    ];

    var linesalesdata = [
      new Sales(0, 45),
      new Sales(1, 56),
      new Sales(2, 55),
      new Sales(3, 60),
      new Sales(4, 61),
      new Sales(5, 70),
    ];
    var linesalesdata1 = [
      new Sales(0, 35),
      new Sales(1, 46),
      new Sales(2, 45),
      new Sales(3, 50),
      new Sales(4, 51),
      new Sales(5, 60),
    ];

    var linesalesdata2 = [
      new Sales(0, 20),
      new Sales(1, 24),
      new Sales(2, 25),
      new Sales(3, 40),
      new Sales(4, 45),
      new Sales(5, 60),
    ];

    var piedata2 = [
      new GaugeSegment('Low', 75),
      new GaugeSegment('Acceptable', 100),
      new GaugeSegment('High', 50),
      new GaugeSegment('Highly Unusual', 5),
    ];

    var buckDeskdata = [
      new LinearSales(52, 0.75, 14.0),
    ];

    var buckHomedata = [
      new LinearSales(34, 0.5, 15.0),
    ];
    var buckTabletdata = [
      new LinearSales(45, 0.3, 18.0),
    ];
    var buckMobiledata = [
      new LinearSales(56, 0.8, 17.0),
    ];
    var buckChromedata = [
      new LinearSales(25, 0.6, 13.0),
    ];

    var myFakeOtherData = [
      new LinearSales(10, 0.25, 15.0),
      new LinearSales(12, 0.075, 14.0),
      new LinearSales(13, 0.225, 15.0),
      new LinearSales(16, 0.03, 14.0),
      new LinearSales(24, 0.04, 13.0),
      new LinearSales(37, 0.1, 14.5),
    ];

    _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2017',
        data: data1,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff990099)),
      ), 
    );


    _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2018',
        data: data2,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
           charts.ColorUtil.fromDartColor(Color(0xff109618)),
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2019',
        data: data3,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
       fillColorFn: (Pollution pollution, _) =>
          charts.ColorUtil.fromDartColor(Color(0xffff9900)),
      ),
    );

    _seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Air Pollution',
        data: piedata,
         labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'Air Pollution',
        data: linesalesdata,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
        id: 'Air Pollution',
        data: linesalesdata1,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffff9900)),
        id: 'Air Pollution',
        data: linesalesdata2,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );

    _createSampleData.add(
      charts.Series(
        //colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffff9900)),
        id: 'Segments',
        domainFn: (GaugeSegment segment, _) => segment.segment,
        measureFn: (GaugeSegment segment, _) => segment.size,
        data: piedata2,
      ),
    );

    _bucketingSampleData.add(
      charts.Series(
       id: 'Biblioteca',
          colorFn: (LinearSales sales, _) =>
              charts.MaterialPalette.blue.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.revenueShare,
          radiusPxFn: (LinearSales sales, _) => sales.radius,
          data: buckDeskdata,
      ),
    );

    _bucketingSampleData.add(
      charts.Series(
       id: 'Residencia del estudiante',
          colorFn: (LinearSales sales, _) =>
              charts.MaterialPalette.red.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.revenueShare,
          radiusPxFn: (LinearSales sales, _) => sales.radius,
          data: buckTabletdata,
      ),
    );

    _bucketingSampleData.add(
      charts.Series(
      id: 'Aulas de Laboratorio',
          colorFn: (LinearSales sales, _) =>
              charts.MaterialPalette.green.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.revenueShare,
          radiusPxFn: (LinearSales sales, _) => sales.radius,
          data: buckMobiledata,
      ),
    );

    _bucketingSampleData.add(
      charts.Series(
      id: 'Parques',
          colorFn: (LinearSales sales, _) =>
              charts.MaterialPalette.purple.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.revenueShare,
          radiusPxFn: (LinearSales sales, _) => sales.radius,
          data: buckChromedata,
      ),
    );

    _bucketingSampleData.add(
      charts.Series(
      id: 'Centro Comercial',
          colorFn: (LinearSales sales, _) =>
              charts.MaterialPalette.indigo.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.revenueShare,
          radiusPxFn: (LinearSales sales, _) => sales.radius,
          data: buckHomedata,
      ),
    );

    _bucketingSampleData.add (
      charts.Series(
       id: 'Otros',
          colorFn: (LinearSales sales, _) =>
              charts.MaterialPalette.gray.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.revenueShare,
          radiusPxFn: (LinearSales sales, _) => sales.radius,
          data: myFakeOtherData,
      ),
    );

  }

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesData = List<charts.Series<Pollution, String>>();
    _seriesPieData = List<charts.Series<Task, String>>();
    _seriesLineData = List<charts.Series<Sales, int>>();
    _createSampleData = List<charts.Series<GaugeSegment, String>>();
    _bucketingSampleData = List<charts.Series<LinearSales, int>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF850000),
            //backgroundColor: Color(0xff308e1c),
            bottom: TabBar(
              indicatorColor: Color(0xff9962D0),
              tabs: [
                Tab(
                  icon: Icon(FontAwesomeIcons.solidChartBar),
                ),
                Tab(icon: Icon(FontAwesomeIcons.chartPie)),
                Tab(icon: Icon(FontAwesomeIcons.chartLine)),
                Tab(icon: Icon(FontAwesomeIcons.chartArea)),
                Tab(icon: Icon(FontAwesomeIcons.chartLine)),  
              ],
            ),
            title: Text('Graficos'),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.all(3.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                            'Grafico de frecuencias de las facultades de la UNSA, envio de audio, archivos y texto',
                            style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                        Expanded(
                          child: charts.BarChart(
                            _seriesData,
                            animate: true,
                            barGroupingType: charts.BarGroupingType.grouped,
                            //behaviors: [new charts.SeriesLegend()],
                            animationDuration: Duration(seconds: 5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                            'Tiempo de uso de acuerdo a las Escuelas Profesionales - UNSA',style: TextStyle(fontSize: 24.0,
                            fontWeight: FontWeight.bold),),
                            SizedBox(height: 10.0,),
                        Expanded(
                          child: charts.PieChart(
                            _seriesPieData,
                            animate: true,
                            animationDuration: Duration(seconds: 5),
                             behaviors: [
                            new charts.DatumLegend(
                              outsideJustification: charts.OutsideJustification.endDrawArea,
                              horizontalFirst: false,
                              desiredMaxRows: 2,
                              cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                              entryTextStyle: charts.TextStyleSpec(
                                  color: charts.MaterialPalette.purple.shadeDefault,
                                  fontFamily: 'Georgia',
                                  fontSize: 11),
                            )
                          ],
                           defaultRenderer: new charts.ArcRendererConfig(
                              arcWidth: 100,
                             arcRendererDecorators: [
          new charts.ArcLabelDecorator(
              labelPosition: charts.ArcLabelPosition.inside)
        ])),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                            'Uso de la aplicacion en los primeros 5 meses',style: TextStyle(fontSize: 24.0,
                            fontWeight: FontWeight.bold),),
                        Expanded(
                          child: charts.LineChart(
                            _seriesLineData,
                            defaultRenderer: new charts.LineRendererConfig(
                                includeArea: true, stacked: true),
                            animate: true,
                            animationDuration: Duration(seconds: 5),
                            behaviors: [
        new charts.ChartTitle('Meses',
            behaviorPosition: charts.BehaviorPosition.bottom,
            titleOutsideJustification:charts.OutsideJustification.middleDrawArea),
        new charts.ChartTitle('Tiempo de uso (Horas)',
            behaviorPosition: charts.BehaviorPosition.start,
            titleOutsideJustification: charts.OutsideJustification.middleDrawArea),
        new charts.ChartTitle('Escuelas Profesionales',
            behaviorPosition: charts.BehaviorPosition.end,
            titleOutsideJustification:charts.OutsideJustification.middleDrawArea,
            )   
      ]
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(3.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                            'Lugares donde se hace uso de la aplicacion',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                        Expanded(
                          child: charts.ScatterPlotChart(
                            _bucketingSampleData,
                            animate: true,
                            //barGroupingType: charts.BarGroupingType.grouped,
                            primaryMeasureAxis: new charts.BucketingAxisSpec(
                               threshold: 0.1,
                            tickProviderSpec: new charts.BucketingNumericTickProviderSpec(
                              desiredTickCount: 3)),
                            //behaviors: [new charts.SeriesLegend()],
                            behaviors: [
                              new charts.SeriesLegend(position: charts.BehaviorPosition.end),
                             ],
                            animationDuration: Duration(seconds: 5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(3.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                            'Grafico circular de calibre sobre el Tiempo de uso',
                            style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                        Expanded(
                          child: charts.PieChart(
                            _createSampleData,
                            animate: true,
                            defaultRenderer: new charts.ArcRendererConfig(
                            arcWidth: 30, 
                            startAngle: 4 / 5 * pi, 
                            arcLength: 7 / 5 * pi)
                            ),
                            //animationDuration: Duration(seconds: 5),
                          ),                
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Pollution {
  String place;
  int year;
  int quantity;

  Pollution(this.year, this.place, this.quantity);
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}

class Sales {
  int yearval;
  int salesval;

  Sales(this.yearval, this.salesval);
}

class GaugeSegment {
  String segment;
  int size;

  GaugeSegment(this.segment, this.size);
}

class LinearSales {
  final int year;
  final double revenueShare;
  final double radius;

  LinearSales(this.year, this.revenueShare, this.radius);
}

