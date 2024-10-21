import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/location_bloc/location_bloc.dart';
import '../../bloc/location_bloc/location_states.dart';



class LocationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
         print('State is now $state');
        if (state is LocationLoading) {
          return CircularProgressIndicator();
        } else if (state is LocationLoaded) {
          return Text('Latitude: ${state.position.latitude}, Longitude: ${state.position.longitude}');
        } else if (state is LocationError) {
          return Text('Error: ${state.message}');
        }
        return Container();
      },
    );
  }
}