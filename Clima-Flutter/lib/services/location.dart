import 'package:geolocator/geolocator.dart';

class Location {
  double latitude, longitude;
  void getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      latitude = latitude ?? 0;
      longitude = longitude ?? 0;
    }
  }
}
