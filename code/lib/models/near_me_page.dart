import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'navigation_menu.dart';  

class NearMePage extends StatefulWidget {
  const NearMePage({super.key});

  @override
  _NearMePageState createState() => _NearMePageState();
}

class _NearMePageState extends State<NearMePage> {
  static const String ACCESS_TOKEN = String.fromEnvironment("ACCESS_TOKEN");
  late MapboxMap _mapboxMap;

  @override
  void initState() {
    super.initState();
    _setAccessToken();
  }

  void _setAccessToken() {
    if (ACCESS_TOKEN.isEmpty) {
      print('Error: Access token is not set.');
    } else {
      MapboxOptions.setAccessToken(ACCESS_TOKEN);
      print('Access token set successfully.');
    }
  }

  Future<geolocator.Position> _getUserLocation() async {
    bool serviceEnabled;
    geolocator.LocationPermission permission;

    serviceEnabled = await geolocator.Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await geolocator.Geolocator.checkPermission();
    if (permission == geolocator.LocationPermission.denied) {
      permission = await geolocator.Geolocator.requestPermission();
      if (permission == geolocator.LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == geolocator.LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await geolocator.Geolocator.getCurrentPosition();
  }

  Future<void> _setMapToUserLocation() async {
    try {
      geolocator.Position userPosition = await _getUserLocation();
      double userLat = userPosition.latitude;
      double userLon = userPosition.longitude;

      _mapboxMap.setCamera(
        CameraOptions(
          center: Point(
            coordinates: Position(userLon, userLat),
          ),
          zoom: 14.0, 
        ),
      );

      var pointAnnotationManager =
          await _mapboxMap.annotations.createPointAnnotationManager();
      pointAnnotationManager.create(
        PointAnnotationOptions(
          geometry: Point(coordinates: Position(userLon, userLat)),
          iconImage: "assets/marker.png", 
        ),
      );
    } catch (e) {
      print('Error setting map to user location: $e');
    }
  }

  Future<void> _flyToUserLocation() async {
    try {
      geolocator.Position userPosition = await _getUserLocation();
      double userLat = userPosition.latitude;
      double userLon = userPosition.longitude;

      _mapboxMap.flyTo(
        CameraOptions(
          center: Point(
            coordinates: Position(userLon, userLat),
          ),
          zoom: 14.0,
        ),
        MapAnimationOptions(
          duration: 1500,
        ),
      );

      var pointAnnotationManager =
          await _mapboxMap.annotations.createPointAnnotationManager();
      pointAnnotationManager.create(
        PointAnnotationOptions(
          geometry: Point(coordinates: Position(userLon, userLat)),
          iconImage: "assets/marker.png", 
        ),
      );
    } catch (e) {
      print('Error getting user location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Near Me'),
        actions: const [
        NavigationMenu(), 
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                _flyToUserLocation();
              },
              child: const Text('Find Restaurants Near Me'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ACCESS_TOKEN.isEmpty
                  ? const Center(child: Text('Access Token not set'))
                  : MapWidget(
                      onMapCreated: (MapboxMap mapboxMap) {
                        _mapboxMap = mapboxMap;

                        _setMapToUserLocation();

                        _mapboxMap.setOnMapTapListener((context) {
                          final coordinates = context.touchPosition;
                          print('Map tapped at: ${coordinates}');
                        });

                        _mapboxMap.setDebugOptions([
                          MapWidgetDebugOptions.tileBorders,
                          MapWidgetDebugOptions.camera,
                        ]);
                      },
                      cameraOptions: CameraOptions(
                        zoom: 12.0,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
