import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobcidade_flutter/explorar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobCidade',
      home: MainActivity(),
    );
  }
}

class MainActivity extends StatefulWidget {
  @override
  _MainActivityState createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  late GoogleMapController _mapController;

  static const LatLng fiapPaulista = LatLng(-23.5615, -46.6559);
  static const LatLng fiapAclimacao = LatLng(-23.5737, -46.6232);
  static const LatLng fiapAlphaville = LatLng(-23.4934, -46.8491);

  final List<LatLng> _locations = [fiapPaulista, fiapAclimacao, fiapAlphaville];
  int _currentLocationIndex = 0;

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _moveToNextLocation() {
    setState(() {
      _currentLocationIndex = (_currentLocationIndex + 1) % _locations.length;
      _mapController.animateCamera(
        CameraUpdate.newLatLng(_locations[_currentLocationIndex]),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: const CameraPosition(
              target: fiapPaulista, // Coordenadas iniciais da FIAP Paulista
              zoom: 17,
            ),
            markers: {
              Marker(
                markerId: const MarkerId('fiap_paulista'),
                position: fiapPaulista,
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed), // Vermelho
                infoWindow: const InfoWindow(
                  title: 'FIAP - Avenida Paulista',
                ),
              ),
              Marker(
                markerId: const MarkerId('fiap_aclimacao'),
                position: fiapAclimacao,
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue), // Azul
                infoWindow: const InfoWindow(
                  title: 'FIAP - Aclimação',
                ),
              ),
              Marker(
                markerId: const MarkerId('fiap_alphaville'),
                position: fiapAlphaville,
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow), // Amarelo
                infoWindow: const InfoWindow(
                  title: 'FIAP - Alphaville',
                ),
              ),
            },
          ),
          Positioned(
            top: 40, // Ajuste aqui para adicionar mais padding
            left: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'MobCidade',
                  style: TextStyle(
                    color: Color(0xFF5CA170),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 110, // Ajuste para colocar o botão flutuante acima do botão existente
            right: 20,
            child: FloatingActionButton(
              onPressed: _moveToNextLocation,
              backgroundColor: const Color(0xFF5CA170),
              child: const Icon(Icons.directions),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 10,
            right: 10,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Explorar()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5CA170),
                padding: const EdgeInsets.symmetric(vertical: 16),
                foregroundColor: Colors.white, // Cor da fonte do botão
              ),
              child: const Text(
                'Explore o APP',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
