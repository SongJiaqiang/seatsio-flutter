import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:seatsio/seatsio.dart';

const String YourWorkspaceKey = "";
const String YourEventKey = "";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seatsio Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Seatsio Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SeatsioWebViewController? _seatsioController;
  final List<String> selectedObjectLabels = ['Try to click a seat object'];

  late SeatingChartConfig _chartConfig;

  @override
  void initState() {
    super.initState();

    _chartConfig = SeatingChartConfig.init().rebuild((b) => b
      ..workspaceKey = YourWorkspaceKey
      ..eventKey = YourEventKey
      ..enableHoldSucceededCallback = true
      ..enableHoldFailedCallback = true
      ..enableObjectClickedCallback = false // Set this to false if you want to have the objectToolTip to be shown
      ..session = "start");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 456,
              child: _buildSeatsioView(),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                  itemCount: selectedObjectLabels.length,
                  itemBuilder: (_, index) => Text(selectedObjectLabels[index])),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadSeatsio,
        child: Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildSeatsioView() {
    return SeatsioWebView(
      enableDebug: true,
      onWebViewCreated: (controller) {
        print("[Seatsio]->[example]-> onWebViewCreated");
        _seatsioController = controller;
        _loadSeatsio();
      },
      onChartRendered: (chart) {
        print("[Seatsio]->[example]-> onChartRendered");
      },
      onChartRenderingFailed: () {
        print("[Seatsio]->[example]-> onChartRenderingFailed");
      },
      onObjectSelected: (object, type) {
        print(
            "[Seatsio]->[example]-> onObjectSelected, label: ${object.label}");
        _selectSeat(object);
      },
      onObjectDeselected: (object, type) {
        print(
            "[Seatsio]->[example]-> onObjectDeselected, label: ${object.label}");
        _deselectSeat(object);
      },
      onHoldSucceeded: (objects, ticketTypes) {
        print(
            "[Seatsio]->[example]-> onObjectSelected, objects: $objects | ticket types: $ticketTypes");
      },
    );
  }

  void _selectSeat(SeatsioObject object) {
    setState(() {
      selectedObjectLabels.add(object.label);
    });
  }

  void _deselectSeat(SeatsioObject object) {
    if (selectedObjectLabels.contains(object.label)) {
      setState(() {
        selectedObjectLabels.remove(object.label);
      });
    }
  }

  void _loadSeatsio() {
    final newChartConfig = _chartConfig.rebuild((b) => b..showLegend = false);
    _seatsioController?.reload(newChartConfig);
  }
}
