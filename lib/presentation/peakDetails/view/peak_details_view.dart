import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/bloc/peak_details_bloc.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/constants/peak_details_state_status.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PeakDetailsView extends StatelessWidget {
  const PeakDetailsView({super.key});

  void _onMarkConquerPeakPressed(BuildContext context) {
    context.read<PeakDetailsBloc>().add(const ValidateUserLocation());
  }

  void _onTakePhotoPressed(BuildContext context) {
    context.read<PeakDetailsBloc>().add(const TakePhoto());
  }

  void _onAddFromGalleryPressed(BuildContext context) {
    context.read<PeakDetailsBloc>().add(const AddFromGallery());
  }

  void _onBuyConquerPressed(BuildContext context) {
    context.read<PeakDetailsBloc>().add(const AddFromGallery());
  }

  void _handleStateStatus(BuildContext context, PeakDetailsState state) {
    final peak = state.peak;
    switch (state.status) {
      case PeakDetailsStateStatus.validatingLocationPermissionsPermanentlyDenied:
        PermissionRationaleDialog.show(context, rationale: Rationale.location);
      case PeakDetailsStateStatus.validatingLocationFailed:
        FailedConquerDialog.show(
          context,
          onTryAgainPressed: () {
            context.pop();
            _onMarkConquerPeakPressed(context);
          },
          onBuyConquerPressed: () {
            _onBuyConquerPressed(context);
          },
        );
      case PeakDetailsStateStatus.validatingLocationSucceeded:
        SucceededConquerDialog.show(
          context,
          peak: peak,
          onTakePhotoPressed: () {
            _onTakePhotoPressed(context);
          },
          onAddFromGalleryPressed: () {
            _onAddFromGalleryPressed(context);
          },
        );
      case PeakDetailsStateStatus.takingPhotoSucceeded:
      case PeakDetailsStateStatus.addingGalleryPhotoSucceeded:
        context.read<PeakDetailsBloc>().add(const MarkPeakAsConquered());
      case PeakDetailsStateStatus.insertingMetadataSucceeded:
        context.pop();
      case _:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PeakDetailsBloc, PeakDetailsState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: _handleStateStatus,
      builder: (context, state) {
        final peak = state.peak;
        final status = state.status;
        return Scaffold(
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  PeakDetailsHeader(peak: peak),
                  PeakDetailsInformation(peak: peak),
                ],
              ),
              if (!peak.isConquered)
                PeakDetailsActionButtons(
                  status: status,
                  onMarkConquerPeakPressed: () {
                    SucceededConquerDialog.show(
                      context,
                      peak: peak,
                      onTakePhotoPressed: () {
                        _onTakePhotoPressed(context);
                      },
                      onAddFromGalleryPressed: () {
                        _onAddFromGalleryPressed(context);
                      },
                    );
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
