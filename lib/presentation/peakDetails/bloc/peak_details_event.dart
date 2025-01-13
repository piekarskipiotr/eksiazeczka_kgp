part of 'peak_details_bloc.dart';

abstract class PeakDetailsEvent extends Equatable {
  const PeakDetailsEvent();
}

final class ValidateUserLocation extends PeakDetailsEvent {
  const ValidateUserLocation();

  @override
  List<Object?> get props => [];
}

final class TakePhoto extends PeakDetailsEvent {
  const TakePhoto();

  @override
  List<Object?> get props => [];
}

final class AddFromGallery extends PeakDetailsEvent {
  const AddFromGallery();

  @override
  List<Object?> get props => [];
}

final class MarkPeakAsConquered extends PeakDetailsEvent {
  const MarkPeakAsConquered();

  @override
  List<Object?> get props => [];
}
