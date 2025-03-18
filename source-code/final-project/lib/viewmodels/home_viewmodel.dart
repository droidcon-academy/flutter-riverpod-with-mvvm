import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewmodel = NotifierProvider<HomeViewmodel, int>(HomeViewmodel.new);

class HomeViewmodel extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void changeIndex(int index) {
    state = index;
  }
}
