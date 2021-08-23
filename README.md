# seatsio

## Description
Seatsio SDK for Flutter.
</br>
![seatsio-flutter-demo](https://github.com/SongJiaqiang/seatsio-flutter/raw/main/seatsio-flutter-demo.gif)

## Getting Started

First, add `seatsio` as a dependency in your `pubspec.yaml` file.
``` yaml
dependencies:
  flutter:
    sdk: flutter

  seatsio: ^0.0.3
```

Then, import `seatsio` package to your dart file.
``` dart
import 'package:seatsio/seatsio.dart';
```

Finally, config your seatsio chart with some parameters.
``` dart

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

```

