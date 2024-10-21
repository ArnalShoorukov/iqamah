import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/prayertimes_bloc/prayertimes_bloc.dart';
import '../../bloc/prayertimes_bloc/prayertimes_event.dart';
import '../../bloc/prayertimes_bloc/prayertimes_states.dart';

class PrayerTimesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrayerTimesBloc(repository)..add(FetchPrayerTimes()),
      child: BlocBuilder<PrayerTimesBloc, PrayerTimesState>(
        builder: (context, state) {
          if (state is PrayerTimesLoading) {
            return CircularProgressIndicator();
          } else if (state is PrayerTimesLoaded) {
            return PrayerTimesList(prayerTimes: state.prayerTimes);
          } else if (state is PrayerTimesError) {
            return Text(state.message);
          }
          return Container();
        },
      ),
    );
  }
}