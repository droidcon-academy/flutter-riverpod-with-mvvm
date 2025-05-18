import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final feedViewmodel = NotifierProvider<FeedViewmodel, String>(
  FeedViewmodel.new,
);

class FeedViewmodel extends Notifier<String> {

  Timer? _debounceTimer;
  
  @override
  String build() {
    return "";
  }

  void search(String query) {
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer!.cancel();
    }
    _debounceTimer = Timer(Duration(milliseconds: 300), () {
      state = query;
    });
  }
}
