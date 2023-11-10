import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class UserLocationDetails extends StatefulWidget {
  const UserLocationDetails({
    Key? key,
    this.width,
    this.height,
    required this.fontSize,
    required this.startCoordinate,
    required this.endCoordinate,
    required this.iOSGoogleMapsApiKey,
    required this.androidGoogleMapsApiKey,
    required this.webGoogleMapsApiKey,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double fontSize;
  final LatLng startCoordinate;
  final LatLng endCoordinate;
  final String iOSGoogleMapsApiKey;
  final String androidGoogleMapsApiKey;
  final String webGoogleMapsApiKey;

  @override
  _UserLocationDetailsState createState() => _UserLocationDetailsState();
}

class _UserLocationDetailsState extends State<UserLocationDetails> {
  String durationString = '';

  String get googleMapsApiKey {
    if (kIsWeb) {
      return widget.webGoogleMapsApiKey;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return '';
      case TargetPlatform.iOS:
        return widget.iOSGoogleMapsApiKey;
      case TargetPlatform.android:
        return widget.androidGoogleMapsApiKey;
      default:
        return widget.webGoogleMapsApiKey;
    }
  }

  _retrieveDuration() async {
    double startLatitude = widget.startCoordinate.latitude;
    double startLongitude = widget.startCoordinate.longitude;
    double destinationLatitude = widget.endCoordinate.latitude;
    double destinationLongitude = widget.endCoordinate.longitude;

    var url = Uri.parse(
      'https://maps.googleapis.com/maps/api/distancematrix/json?destinations=$destinationLatitude,$destinationLongitude&origins=$startLatitude,$startLongitude&key=$googleMapsApiKey',
    );
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      final String durationText =
          jsonResponse['rows'][0]['elements'][0]['duration']['text'];
      setState(() {
        durationString = durationText;
      });
    } else {
      debugPrint('ERROR in calculating duration');
    }
  }

  @override
  void initState() {
    _retrieveDuration();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          durationString,
          // style: FlutterFlowTheme.of(context).bodyText1.override(
          //       fontFamily: 'Montserrat',
          //       color: const Color.fromARGB(151, 0, 0, 0),
          //       fontSize: widget.fontSize,
          //       fontWeight: FontWeight.w400,
          //     ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
          child: Text(
            'away',
            // style: FlutterFlowTheme.of(context).bodyText1.override(
            //       fontFamily: 'Montserrat',
            //       color: Color.fromARGB(151, 0, 0, 0),
            //       fontSize: widget.fontSize,
            //       fontWeight: FontWeight.w400,
            //     ),
          ),
        ),
      ],
    );
  }
}
