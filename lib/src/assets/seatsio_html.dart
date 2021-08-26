final String seatsioHTML = """
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdn-%region%.seatsio.net/chart.js" type="text/javascript"></script>
  </head>
    <body style="margin: 0; padding: 0">
      <div id="chart" style="width: 100%; height: 100%;"></div>
      <script>
        let chart = new seatsio.SeatingChart(%configAsJs%).render()

        // [begin] Bridge some functions of Seatsio 
        
        function listCategories(data, callback) {
            chart.listCategories(categories => callback(JSON.stringify(categories)));
        }

        function changeConfig(data, callback) {
            chart.changeConfig(JSON.parse(data))
            callback(data)
        }

        // [end]

        // Register channel to post message to Flutter.
        function postMessageToFlutter(jsonString) {
          FlutterJsBridge.postMessage(jsonString);
        }

      </script>
  </body>
</html>
""";

final String seatsioHTML4Android = """
<html>
  <head>
    <script src="https://cdn-%region%.seatsio.net/chart.js" type="text/javascript"></script>
  </head>
    <body style="margin: 0; padding: 0">
      <div id="chart" style="width: 100%; height: 100%;"></div>
      <script>
        function asyncCallSuccess(requestId) { return result => Native.asyncCallSuccess(JSON.stringify(result), requestId) }
        function asyncCallError(requestId) { return result => Native.asyncCallError(requestId) }
        
        let chart = new seatsio.SeatingChart(%configAsJs%).render()
      </script>
  </body>
</html>;
""";

final String seatsioHTML4Ios = """
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdn-%region%.seatsio.net/chart.js" type="text/javascript"></script>
</head>
<body style="margin: 0; padding: 0;">
    <div id="chart" style="width: 100%; height: 100%;"></div>

    <script>
        let chart = new seatsio.SeatingChart(%configAsJs%).render();

        window.bridge.register("selectObjects", function(objects) {
            chart.selectObjects(objects)
        });

        window.bridge.register("deselectObjects", function(objects) {
            chart.deselectObjects(objects)
        });

        window.bridge.register("selectCategories", function(categories) {
            chart.selectCategories(categories)
        });

        window.bridge.register("deselectCategories", function(categories) {
            chart.deselectCategories(categories)
        });

        window.bridge.register("getHoldToken", function(data, callback) {
            callback(chart.holdToken)
        });

        window.bridge.register("zoomToSelectedObjects", function(data, callback) {
            chart.zoomToSelectedObjects()
        });

        window.bridge.register("rerender", function(data, callback) {
            chart.rerender()
        });

        window.bridge.register("resetView", function(data, callback) {
            chart.resetView()
        });

        window.bridge.register("startNewSession", function(data, callback) {
            chart.startNewSession()
        });

        window.bridge.register("selectBestAvailable", function(data, callback) {
            chart.selectBestAvailable(JSON.parse(data))
        });

        window.bridge.register("listSelectedObjects", function(data, callback) {
            chart.listSelectedObjects(objects => callback(JSON.stringify(objects)))
        });

        window.bridge.register("listCategories", function(data, callback) {
            chart.listCategories(categories => callback(JSON.stringify(categories)))
        });

        window.bridge.register("findObject", function(data, callback) {
            chart.findObject(data, object => callback(JSON.stringify(object)), () => { callback() })
        });

        window.bridge.register("clearSelection", function(data, callback) {
            chart.clearSelection(() => callback())
        });

        window.bridge.register("changeConfig", function(data, callback) {
            chart.changeConfig(JSON.parse(data))
        });
    </script>
</body>
</html>
""";
