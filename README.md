<img alt='seatsio-logo' src='https://www.seats.io/assets/v77/static/brandassets/seatsio-black.svg' width='100%'/>

## Description

A Flutter plugin for [Seatsio](https://www.seats.io/).

This is the Flutter version of seatsio SDK, which can help you integrate the seating chart into Flutter apps.
If you want to know more about seatsio's SDK, please go to [seats.io](https://docs.seats.io/).

<img alt='seatsio-flutter-demo' src='https://github.com/SongJiaqiang/seatsio-flutter/raw/main/seatsio-flutter-demo.gif' width='200'/>

## Getting Started

First, add `seatsio` as a dependency in your `pubspec.yaml` file.

``` yaml
dependencies:
  flutter:
    sdk: flutter

  seatsio: ^0.4.0
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
        print("[Seatsio]->[example]-> onWebViewCreated");
        _seatsioController = controller;
        _loadSeatsio();
      },
      onChartRendered: (_) =>
          print("[Seatsio]->[example]-> onChartRendered"),
      onChartRenderingFailed: () =>
          print("[Seatsio]->[example]-> onChartRenderingFailed"),
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
      onHoldTokenExpired: () {
        print("[Seatsio]->[example]-> onHoldTokenExpired");
      },
      onSessionInitialized: (holdToken) {
        print(
            "[Seatsio]->[example]-> onSessionInitialized, holdToken: $holdToken");
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
