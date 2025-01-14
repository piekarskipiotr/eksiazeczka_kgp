part of 'private_supabase_image_cubit.dart';

class PrivateSupabaseImageState {
  const PrivateSupabaseImageState({this.url});

  final String? url;

  PrivateSupabaseImageState copyWith({String? url}) {
    return PrivateSupabaseImageState(
      url: url ?? this.url,
    );
  }
}
