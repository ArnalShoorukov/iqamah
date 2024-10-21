import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqamah_app/bloc/prayertimes_bloc/prayertimes_event.dart';
import 'package:iqamah_app/bloc/prayertimes_bloc/prayertimes_states.dart';

class PrayerTimesBloc extends Bloc<PrayerTimesEvent, PrayerTimesState> {
  final PrayerTimesRepository repository;

  PrayerTimesBloc(this.repository) : super(PrayerTimesInitial()) {
    on<FetchPrayerTimes>((event, emit) async {
      emit(PrayerTimesLoading());
      try {
        final prayerTimes = await repository.fetchPrayerTimes();
        emit(PrayerTimesLoaded(prayerTimes));
      } catch (e) {
        emit(PrayerTimesError('Failed to fetch prayer times'));
      }
    });
  }
}