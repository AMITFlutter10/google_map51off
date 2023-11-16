import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
CameraPosition  initialCameraPosition = CameraPosition(
    target: LatLng(26.8206,30.8025),
    tilt: 90,
    bearing: 0,
    zoom: 6
);
class _MyHomePageState extends State<MyHomePage> {
 late GoogleMapController googleMapController;

  late LatLng currentPosition;
 onCameraMove(CameraPosition position)=> currentPosition= position.target;
 Set<Marker> myMarker ={
   Marker(
       markerId: MarkerId("l1"),
       position: LatLng(
           initialCameraPosition.target.longitude,
           initialCameraPosition.target.latitude
       )
   ),
   Marker(
       markerId: MarkerId("l2"),
       position: LatLng(
           initialCameraPosition.target.longitude,
           initialCameraPosition.target.latitude
       )
   )
 };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        onMapCreated: (controller){
          googleMapController= controller;
        },
        onCameraMove: onCameraMove,
        markers: myMarker,
        onTap: (LatLng current){
          setState(() {
            myMarker.add(Marker(markerId: MarkerId("l2"),
                position: LatLng(current.latitude,
                    current.longitude)
            ));
          });

        },
      )
    );
  }
}
