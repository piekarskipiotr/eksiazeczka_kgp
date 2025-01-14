part of 'private_supabase_image_cubit.dart';

class PrivateSupabaseImageState {
  const PrivateSupabaseImageState({this.url, this.headers});

  final String? url;
  final Map<String, String>? headers;

  PrivateSupabaseImageState copyWith({String? url, Map<String, String>? headers}) {
    return PrivateSupabaseImageState(
      url: url ?? this.url,
      headers: headers ?? this.headers,
    );
  }
}
