import 'package:flutter/material.dart';

import '../widgets/location_widgets.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: LocationWidget()),
    );
  }
}