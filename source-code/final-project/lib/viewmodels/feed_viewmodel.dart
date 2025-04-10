import 'package:flutter_riverpod/flutter_riverpod.dart';

final feedViewmodel = NotifierProvider<FeedViewmodel, String>(
  FeedViewmodel.new,
);

class FeedViewmodel extends Notifier<String> {
  @override
  String build() {
    return "";
  }

  void search(String query) {
    state = query;
  }
}
