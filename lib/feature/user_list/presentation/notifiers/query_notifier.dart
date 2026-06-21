import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'query_notifier.g.dart';

/// query for filtering users
@riverpod
class QueryNotifier extends _$QueryNotifier {
  @override
  String build() => '';

  /// set query
  void setQuery(String query) => state = query;
}
