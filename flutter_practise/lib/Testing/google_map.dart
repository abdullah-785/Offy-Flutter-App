import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

List<Map<String, dynamic>> data = [
  {
    "id": "1",
    'globalKey': GlobalKey(),
    "position": LatLng(32.535544, 74.363879),
    "widget": CustomMarkerWidget(price: 100)
  },
  {
    "id": "2",
    'globalKey': GlobalKey(),
    "position": LatLng(32.550441, 74.395905),
    "widget": CustomMarkerWidget(price: 100)
  },
  {
    "id": "3",
    'globalKey': GlobalKey(),
    "position": LatLng(32.611853, 74.377217),
    "widget": CustomMarkerWidget(price: 100)
  },
];

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({super.key});

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final Map<String, Marker> _markers = {};

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(32.535544, 74.363879),
    zoom: 14.4746,
  );
  bool isLoading = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _onBuildComplete());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                InfoWindow(
                  title: "View Restaurant",
                );
                // controller
                //     .setMapStyle('AIzaSyA3NhMTrXcFL2szWurBAA5vZYI6l73kGaA');
              },
              markers: _markers.values.toSet(),
            )
          : ListView(
              children: [
                for (int i = 0; i < data.length; i++)
                  Transform.translate(
                    offset: Offset(MediaQuery.of(context).size.width * 2,
                        MediaQuery.of(context).size.height * 2),
                    child: RepaintBoundary(
                      key: data[i]['globalKey'],
                      child: data[i]['widget'],
                    ),
                  )
              ],
            ),
    );
  }

  Future<void> _onBuildComplete() async {
    print("It is working find");
    await Future.wait(data.map((value) async {
      Marker marker = await _generateMarkersFromWidgets(value);
      _markers[marker.markerId.value] = marker;
    }));
    setState(() {
      isLoading = true;
    });
  }

  Future<Marker> _generateMarkersFromWidgets(Map<String, dynamic> data) async {
    RenderRepaintBoundary boundary = data['globalKey']
        .currentContext
        ?.findRenderObject() as RenderRepaintBoundary;

    ui.Image image = await boundary.toImage();

    ByteData? byteData = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );
    return Marker(
        markerId: MarkerId(
          data['id'],
        ),
        position: data['position'],
        icon: BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List()),
        onTap: () {
          _showMyDialog(context);
        });
  }
}

//////////Secrets

// class Secrets {
//   static const String googleMapsApiKey =
//       'AIzaSyA3NhMTrXcFL2szWurBAA5vZYI6l73kGaA';
// }

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('AlertDialog Title'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('This is a demo alert dialog.'),
              Text('Would you like to approve of this message?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class CustomMarkerWidget extends StatefulWidget {
  const CustomMarkerWidget({super.key, required this.price});
  final int price;

  @override
  State<CustomMarkerWidget> createState() => _CustomMarkerWidgetState();
}

class _CustomMarkerWidgetState extends State<CustomMarkerWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 120,
          height: 120,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.orange),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 95,
                height: 95,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "9.6",
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          color: Colors.orange),
                    ),
                    Text(
                      "50%",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Icon(Icons.location_on, size: 60, color: Colors.orange)
      ],
    );
  }
}
