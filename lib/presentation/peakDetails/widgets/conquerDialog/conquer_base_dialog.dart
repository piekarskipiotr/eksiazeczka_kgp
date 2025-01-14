import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/bloc/peak_details_bloc.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/constants/peak_details_state_status.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/widgets/permissionRationaleDialog/permission_rationale_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConquerBaseDialog extends StatelessWidget {
  const ConquerBaseDialog({required this.child, super.key});

  final Widget child;

  void _handleStateStatus(BuildContext context, PeakDetailsState state) {
    switch (state.status) {
      case PeakDetailsStateStatus.takingPhotoPermissionsPermanentlyDenied:
        PermissionRationaleDialog.show(context, rationale: Rationale.camera);
      case PeakDetailsStateStatus.addingGalleryPhotoPermissionsPermanentlyDenied:
        PermissionRationaleDialog.show(context, rationale: Rationale.photos);
      case _:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PeakDetailsBloc, PeakDetailsState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: _handleStateStatus,
      child: Theme(
        data: AppThemes.dark,
        child: Scaffold(
          body: child,
          backgroundColor: AppColors.transparent,
        ),
      ),
    );
  }
}
