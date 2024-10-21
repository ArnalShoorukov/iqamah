abstract class PrayerTimesState {}
class PrayerTimesInitial extends PrayerTimesState {}
class PrayerTimesLoading extends PrayerTimesState {}
class PrayerTimesLoaded extends PrayerTimesState {
  final List<PrayerTime> prayerTimes;
  PrayerTimesLoaded(this.prayerTimes);
}
class PrayerTimesError extends PrayerTimesState {
  final String message;
  PrayerTimesError(this.message);
}