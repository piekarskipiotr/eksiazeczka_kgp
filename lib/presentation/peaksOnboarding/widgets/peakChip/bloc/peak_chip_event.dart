part of 'peak_chip_bloc.dart';

abstract class PeakChipEvent extends Equatable {
  const PeakChipEvent();
}

final class ValidateMemorablePhoto extends PeakChipEvent {
  const ValidateMemorablePhoto();

  @override
  List<Object?> get props => [];
}

final class SaveMemorablePhoto extends PeakChipEvent {
  const SaveMemorablePhoto(this.image);

  final XFile image;

  @override
  List<Object?> get props => [image];
}

final class MarkPeakAsConquered extends PeakChipEvent {
  const MarkPeakAsConquered(this.imageCreatedAt);

  final DateTime? imageCreatedAt;

  @override
  List<Object?> get props => [imageCreatedAt];
}
