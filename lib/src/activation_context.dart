import 'dart:math';

import 'package:activatory/src/customization/default_values_handling_strategy.dart';
import 'package:activatory/src/customization/type_customization_registry.dart';
import 'package:activatory/src/post_activation/fields_auto_filling_strategy.dart';
import 'package:activatory/src/value_generator.dart';

class ActivationContext implements ValueGenerator {
  final ValueGenerator _valueGenerator;
  final Object _key;
  final Random _random;
  final List<Type> _stackTrace = new List<Type>();
  final TypeCustomizationRegistry _customizationsRegistry;

  ActivationContext(this._valueGenerator, this._random, this._key, this._customizationsRegistry);

  Object get key => _key;

  Random get random => _random;

  int arraySize(Type type) => _customizationsRegistry.get(type, key: key).arraySize;

  DefaultValuesHandlingStrategy defaultValuesHandlingStrategy(Type type) =>
      _customizationsRegistry.get(type, key: key).defaultValuesHandlingStrategy;

  int countVisits(Type type) => _stackTrace.where((t) => t == type).length;

  @override
  Object create(Type type, ActivationContext context) => _valueGenerator.create(type, this);

  @override
  T createTyped<T>(ActivationContext context) => create(T, context);

  bool isVisitLimitReached(Type type) {
    final customization = _customizationsRegistry.get(type, key: key);
    return countVisits(type) > customization.maxRecursionLevel;
  }

  void notifyVisited(Type type) => _stackTrace.removeAt(_stackTrace.lastIndexOf(type));

  void notifyVisiting(Type type) => _stackTrace.add(type);

  FieldsAutoFillingStrategy fieldsAutoFill(Type type) =>
      _customizationsRegistry.get(type, key: key).fieldsAutoFillingStrategy;
}
