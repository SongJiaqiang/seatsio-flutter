import 'package:flutter/material.dart';
import 'package:seatsio/seatsio.dart';

const String YourWorkspaceKey = "afcfc4d1-d11d-476d-9956-e2c4f6c5e769";
const String YourEventKey =
    "20210807-1000-eee8070a-cfd3-4cdd-9ab0-64ae38e84900";

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
      onWebViewCreated: (controller) {
        print("[seatsio]->[example]-> onWebViewCreated");
        _seatsioController = controller;
        _loadSeatsio();
      },
      onChartRendered: (chart) {
        print("[seatsio]->[example]-> onChartRendered");
      },
      onObjectSelected: (object) {
        print(
            "[seatsio]->[example]-> onObjectSelected, label: ${object.label}");
        _selectSeat(object);
      },
      onObjectDeselected: (object) {
        print(
            "[seatsio]->[example]-> onObjectDeselected, label: ${object.label}");
        _deselectSeat(object);
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
