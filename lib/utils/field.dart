import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class FieldDataStream<T> {
  late final TextEditingController controller;
  final T? _defaultValue;
  final StreamTransformer<T, T>? _validate;

  T? get defaultValue => _defaultValue;

  final BehaviorSubject<T> _field = BehaviorSubject<T>();
  Stream<T> get stream => _validate != null ? _field.stream.cast<T>().transform(_validate!) : _field.stream.cast<T>();
  bool get hasError => _field.hasError;

  void Function(String value) get addError => _field.sink.addError;
  void Function(T value) get change => _field.sink.add;
  T? get value => _field.hasValue ? _field.value : _defaultValue;

  FieldDataStream({T? defaultValue, StreamTransformer<T, T>? validateField})
      : _defaultValue = defaultValue,
        _validate = validateField {
    controller = TextEditingController(text: defaultValue?.toString());
  }
}
