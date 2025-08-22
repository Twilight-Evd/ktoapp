import 'package:flutter_bloc/flutter_bloc.dart';

class MenuCubit extends Cubit<int> {
  MenuCubit(super.index);
  void setIndex(int index) {
    if (index != state) emit(index);
  }
}
