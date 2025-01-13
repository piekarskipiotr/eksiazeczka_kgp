import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/bloc/peak_details_bloc.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/constants/peak_details_state_status.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/widgets/widgets.dart';
import 'package:eksiazeczka_kgp/resources/resources.dart';
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

  void _onBackPressed(BuildContext context) {
    context.pop();
  }

  void _handleStateStatus(BuildContext context, PeakDetailsState state) {
    final peak = state.peak;
    switch (state.status) {
      case PeakDetailsStateStatus.validatingLocationPermissionsPermanentlyDenied:
        GeolocationPermissionRationaleDialog.show(context);
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
        SuccessConquerDialog.show(
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
      case _:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
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
                  Stack(
                    children: [
                      PeakCard(peak: peak, height: 420),
                      SafeArea(
                        child: Container(
                          alignment: Alignment.topRight,
                          padding: const EdgeInsets.all(12),
                          child: AppCircleIconBlurButton(
                            iconPath: IconImages.close,
                            onPressed: () {
                              _onBackPressed(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(top: 16, bottom: 156),
                      child: Column(
                        spacing: 16,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PeakDetailsBaseInformation(
                            location: peak.location,
                            difficultyLevel: peak.difficultyLevel,
                            averageAscentTime: peak.averageAscentTime,
                            popularity: peak.popularity,
                          ),
                          PeakDetailsDescription(
                            description: peak.descriptions.first.text,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              if (!peak.isConquered)
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: AppButton(
                      label: l10n.markConquerPeak,
                      isLoading: status == PeakDetailsStateStatus.validatingLocation,
                      onPressed: () {
                        _onMarkConquerPeakPressed(context);
                      },
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
