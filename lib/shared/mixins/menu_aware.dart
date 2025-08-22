import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ktoapp/core/utils/log.dart';

import '../../features/common/bloc/menu/menu_cubit.dart';
import '../../features/common/widgets/data_provider.dart';

mixin MenuAwareMixin {
  void onVisible();
  void onHidden();

  Widget buildWithVisibilityListener(
    BuildContext context, {
    required Widget child,
  }) {
    final provider = MyDataProvider.of<int>(context);
    if (provider == null) {
      return child;
    }
    final index = provider.data;
    onVisible.call();
    logger.d(">>>>>>>>>>>> ???? $index");
    return BlocListener<MenuCubit, int>(
      listenWhen: (previous, current) {
        logger.d(">>>>>>>>>>>> $previous , $current");
        return (previous != index && current == index) ||
            (previous == index && current != index);
      },
      listener: (BuildContext context, int state) {
        logger.d(">>>>>>>>>>>> $state ");

        if (state == index) {
          onVisible.call();
        } else {
          onHidden.call();
        }
      },
      child: child,
    );
  }
}
