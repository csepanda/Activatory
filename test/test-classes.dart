import 'package:activatory/activatory.dart';

abstract class AbstractClass {
  int _intField;

  AbstractClass(this._intField);
}

class IntArrayInCtor {
  final List<int> _listField;

  IntArrayInCtor(this._listField);

  List<int> get listField => _listField;
}

class DefaultCtor {
  int intField;
}

class DefaultNamedNoNullValue {
  static const String defaultValue = "defaultValue is not generated";
  String _stringValue;
  PrimitiveComplexObject _object;

  DefaultNamedNoNullValue(this._object, {String stringValue = defaultValue}) {
    _stringValue = stringValue;
  }
  PrimitiveComplexObject get object => _object;

  String get stringValue => _stringValue;
}

class DefaultNamedNullValue {
  String _stringValue;
  PrimitiveComplexObject _notSetObject;

  PrimitiveComplexObject _nullSetObject;
  DefaultNamedNullValue(
      {PrimitiveComplexObject notSetObject, PrimitiveComplexObject nullSetObject = null, String stringValue = null}) {
    _stringValue = stringValue;
    _notSetObject = notSetObject;
    _nullSetObject = nullSetObject;
  }

  PrimitiveComplexObject get notSetObject => _notSetObject;
  PrimitiveComplexObject get nullSetObject => _nullSetObject;

  String get stringValue => _stringValue;
}

class DefaultPositionalNoNullValue {
  static const String defaultValue = "defaultValue is not generated";
  String _stringValue;
  PrimitiveComplexObject _object;

  DefaultPositionalNoNullValue(this._object, [this._stringValue = defaultValue]);
  PrimitiveComplexObject get object => _object;

  String get stringValue => _stringValue;
}

class DefaultPositionalNullValue {
  String _stringValue;
  PrimitiveComplexObject _notSetObject;

  PrimitiveComplexObject _nullSetObject;
  DefaultPositionalNullValue([this._notSetObject, this._nullSetObject = null, this._stringValue = null]);

  PrimitiveComplexObject get notSetObject => _notSetObject;
  PrimitiveComplexObject get nullSetObject => _nullSetObject;

  String get stringValue => _stringValue;
}

class FactoryCtor {
  String _stringField;
  String _nonFactoryField;

  factory FactoryCtor(String stringField) {
    return new FactoryCtor._internal(stringField, null);
  }
  FactoryCtor._internal(this._stringField, this._nonFactoryField);

  String get nonFactoryField => _nonFactoryField;

  String get stringField => _stringField;
}

class Generic<T> {
  final T _field;

  Generic(this._field);

  T get field => _field;
}

class GenericArrayInCtor<T> {
  final List<T> _listField;

  GenericArrayInCtor(this._listField);

  List<T> get listField => _listField;
}

class NamedCtor {
  String _stringField;
  NamedCtor.nonDefaultName(this._stringField);

  String get stringField => _stringField;
}

class NonPrimitiveComplexObject {
  PrimitiveComplexObject _primitiveComplexObject;
  int _intField;

  NonPrimitiveComplexObject(this._primitiveComplexObject, this._intField);
  int get intField => _intField;

  PrimitiveComplexObject get primitiveComplexObject => _primitiveComplexObject;
}

class NoPublicCtor {
  String _stringField;
  NoPublicCtor._internal(this._stringField);

  String get stringField => _stringField;
}

class PrimitiveComplexObject {
  int _intField;
  String _stringField;
  double _doubleField;
  bool _boolField;
  DateTime _dateTimeField;
  TestEnum _enumField;

  PrimitiveComplexObject(
      this._intField, this._stringField, this._doubleField, this._boolField, this._dateTimeField, this._enumField);

  bool get boolField => _boolField;
  DateTime get dateTimeField => _dateTimeField;
  double get doubleField => _doubleField;
  TestEnum get enumField => _enumField;
  int get intField => _intField;
  String get stringField => _stringField;
}

class ClosedByInheritanceGeneric extends GenericArrayInCtor<String> {
  ClosedByInheritanceGeneric(List<String> listField) : super(listField);
}

enum TestEnum { A, B, C }

class TreeNode{
  final List<TreeNode> _children;

  TreeNode(this._children);

  List<TreeNode> get children => _children;
}

class LinkedNode{
  final LinkedNode _next;

  LinkedNode(this._next);

  LinkedNode get next => _next;
}

abstract class Task{
  int get id;
  String get title;
  bool get isRecurrent;
  bool get isTemplate;
  DateTime get dueDate;
}

class GenericArrayInCtorParams<T> extends Params<GenericArrayInCtor<T>>{
  GenericArrayInCtor<T> resolve(ActivationContext ctx) {
    return new GenericArrayInCtor(ctx.createTyped<List<T>>(ctx));
  }
}

class GenericParams<T> extends Params<Generic<T>>{
  Generic<T> resolve(ActivationContext ctx) {
    return new Generic(ctx.createTyped<T>(ctx));
  }
}

class NamedCtorsAndDefaultCtor{
  final String _field;
  String get field => _field;

  NamedCtorsAndDefaultCtor.createA():this("A");

  NamedCtorsAndDefaultCtor(this._field);

  NamedCtorsAndDefaultCtor.createB():this("B");

  NamedCtorsAndDefaultCtor.createC():this("C");

  NamedCtorsAndDefaultCtor.createD():this("D");
}

class NamedCtorsAndFactory{
  String _field;
  String get field => _field;

  NamedCtorsAndFactory.createA(){
    _field = "A";
  }

  NamedCtorsAndFactory._internal(String arg){
    _field = arg;
  }

  factory NamedCtorsAndFactory(String arg){
    return NamedCtorsAndFactory._internal(arg);
  }
}

class NamedCtorsAndConstCtor{
  final String _field;
  String get field => _field;

  NamedCtorsAndConstCtor.A():this('A');

  const NamedCtorsAndConstCtor(this._field);

  NamedCtorsAndConstCtor.B():this('B');
  NamedCtorsAndConstCtor.C():this('C');
}

class FactoryWithFixedValues{
  String _field;
  String get field => _field;

  FactoryWithFixedValues._(this._field);

  static final FactoryWithFixedValues a = new FactoryWithFixedValues._("A");
  static final FactoryWithFixedValues b = new FactoryWithFixedValues._("B");
  static final FactoryWithFixedValues c = new FactoryWithFixedValues._("C");

  factory FactoryWithFixedValues(String type){
    switch(type){
      case 'A': return a;
      case 'B': return b;
      case 'C': return c;
      default: throw new ArgumentError(type);
    }
  }
}