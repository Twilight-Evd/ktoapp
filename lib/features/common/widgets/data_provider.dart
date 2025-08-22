import 'package:flutter/widgets.dart';

class MyDataProvider<T> extends InheritedWidget {
  final T data;

  const MyDataProvider({required this.data, required super.child, super.key});

  static MyDataProvider<T>? of<T>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyDataProvider<T>>();
  }

  @override
  bool updateShouldNotify(MyDataProvider<T> oldWidget) {
    return oldWidget.data != data;
  }
}
