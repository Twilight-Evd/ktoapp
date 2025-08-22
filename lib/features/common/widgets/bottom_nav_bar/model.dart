import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data_provider.dart';

class BottomItem {
  final String name;
  final String path;
  final String icon;
  final String? label;

  final Widget Function(BuildContext context)? viewBuilder;
  final String? redirectPath;
  final Page Function(Widget child, GoRouterState state)? pageBuilder;

  const BottomItem({
    required this.name,
    required this.path,
    required this.icon,
    this.label,
    this.viewBuilder,
    this.redirectPath,
    this.pageBuilder,
  }) : assert(
         (viewBuilder != null) ^ (redirectPath != null),
         'Either viewBuilder or redirectPath must be provided, but not both',
       );

  const BottomItem.withView({
    required this.name,
    required this.path,
    required this.icon,
    required Widget Function(BuildContext context) this.viewBuilder,
    this.label,
    this.pageBuilder,
  }) : redirectPath = null;

  const BottomItem.redirect({
    required this.name,
    required this.path,
    required this.icon,
    required String this.redirectPath,
    this.label,
  }) : viewBuilder = null,
       pageBuilder = null;

  GoRoute toGoRoute(int index) {
    return GoRoute(
      path: path,
      name: name,
      pageBuilder: viewBuilder != null
          ? (context, state) {
              final widget = MyDataProvider(
                data: index,
                child: Builder(builder: (ctx) => viewBuilder!(ctx)),
              );

              if (pageBuilder != null) {
                return pageBuilder!(widget, state);
              }
              return MaterialPage(child: widget);
            }
          : null,
      redirect: redirectPath != null ? (context, state) => redirectPath : null,
    );
  }
}
