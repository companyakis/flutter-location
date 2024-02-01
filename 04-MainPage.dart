import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //location variables
  double currentLatitude = 0.0;
  double currentLongitude = 0.0;

  Future<void> getLocationInfo() async {
    var currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      currentLatitude = currentLocation.latitude;
      currentLongitude = currentLocation.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Location"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Latitude: $currentLatitude",
                style: TextStyle(fontSize: 20, color: Colors.blue)),
            const SizedBox(height: 20),
            Text("Longitude: $currentLongitude",
                style: TextStyle(fontSize: 20, color: Colors.blue)),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  getLocationInfo();
                },
                child: const Text("Get Location Info"))
          ],
        ),
      ),
    );
  }
}
