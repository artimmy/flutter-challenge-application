// ignore_for_file: depend_on_referenced_packages, implementation_imports

import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_interfaces/src/di/injector.dart';

abstract class GlobalModule extends Module {
  @override
  List<GlobalBind<Object>> get binds => [];

  @override
  List<GlobalModule> get imports => [];
}

typedef InjectFn<T extends Object> = T Function(Injector i);

class GlobalBind<T> extends Bind {
  @protected
  GlobalBind(
    InjectFn inject, {
    bool isLazy = true,
    bool isSingleton = true,
  }) : super(inject, export: true, isLazy: isLazy, isSingleton: isSingleton);

  static GlobalBind<T> singleton<T extends Object>(InjectFn<T> inject) {
    return GlobalBind<T>(inject, isLazy: false);
  }

  static GlobalBind<T> lazySingleton<T extends Object>(InjectFn<T> inject) {
    return GlobalBind<T>(inject);
  }

  static GlobalBind<T> factory<T extends Object>(InjectFn<T> inject) {
    return GlobalBind<T>(inject, isSingleton: false);
  }
}
