import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class GoogleMapWidget extends StatelessWidget {
  const GoogleMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(
            center: LatLng(51.509364, -0.128928),
            zoom: 5.0,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              // urlTemplate:
              //     'https://stamen-tiles.a.ssl.fastly.net/toner-background/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.flutter_travel_app',
            ),
            PolygonLayer(
              polygonCulling: false,
              polygons: [
                Polygon(
                  points: [
                    LatLng(36.95, -9.5),
                    LatLng(42.25, -9.5),
                    LatLng(42.25, -6.2),
                    LatLng(36.95, -6.2),
                  ],
                  color: Colors.blue.withOpacity(0.2),
                  borderStrokeWidth: 2,
                  borderColor: Colors.blue,
                  isFilled: true,
                ),
              ],
            ),
            PolylineLayer(
              polylines: [
                Polyline(
                  points: [
                    LatLng(38.73, -9.14), // Lisbon, Portugal
                    LatLng(51.50, -0.12), // London, United Kingdom
                    LatLng(52.37, 4.90), // Amsterdam, Netherlands
                  ],
                  color: Colors.blue,
                  strokeWidth: 2,
                ),
                Polyline(
                  points: [
                    LatLng(28.613939, 77.209023),
                    LatLng(22.5726, 88.3639),
                    LatLng(13.0827, 80.2707),
                    LatLng(19.075983, 72.877655),
                    LatLng(28.613939, 77.209023),
                  ],
                  borderColor: Colors.red,
                  color: Colors.blue,
                  strokeWidth: 2,
                  isDotted: true,
                ),
              ],
            ),
            CircleLayer(
              circles: [
                CircleMarker(
                  point: LatLng(28.613939, 77.209023),
                  radius: 10000,
                  useRadiusInMeter: true,
                  color: Colors.red.withOpacity(0.3),
                  borderColor: Colors.red.withOpacity(0.7),
                  borderStrokeWidth: 2,
                ),
              ],
            ),
            MarkerLayer(
              markers: [
                buildMarker(LatLng(39.3999, -8.2245), "Amor"), // Portugal
                buildMarker(LatLng(55.3781, -3.4360), "Love"), // England
                buildMarker(LatLng(46.2276, 2.2137), "Aimer"), // France
                buildMarker(LatLng(52.1326, 5.2913), "Liefde"), // Netherlands
                buildMarker(LatLng(51.1657, 10.4515), "Liebe"), // Germany
              ],
            ),
          ],
        ),
      ],
    );
  }
}

TextStyle getDefaultTextStyle() {
  return const TextStyle(
    fontSize: 12,
    backgroundColor: Colors.blue,
    color: Colors.white,
  );
}

Container buildTextWidget(String word) {
  return Container(
    alignment: Alignment.center,
    child: Text(
      word,
      textAlign: TextAlign.center,
      style: getDefaultTextStyle(),
    ),
  );
}

Marker buildMarker(LatLng coordinates, String word) {
  return Marker(
    point: coordinates,
    width: 100,
    height: 12,
    builder: (context) => buildTextWidget(word),
  );
}
