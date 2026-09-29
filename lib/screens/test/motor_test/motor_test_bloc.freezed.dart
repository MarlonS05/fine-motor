// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'motor_test_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MotorTestEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MotorTestEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MotorTestEvent()';
}


}

/// @nodoc
class $MotorTestEventCopyWith<$Res>  {
$MotorTestEventCopyWith(MotorTestEvent _, $Res Function(MotorTestEvent) __);
}


/// Adds pattern-matching-related methods to [MotorTestEvent].
extension MotorTestEventPatterns on MotorTestEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _SaveTapped value)?  saveTapped,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SaveTapped() when saveTapped != null:
return saveTapped(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _SaveTapped value)  saveTapped,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _SaveTapped():
return saveTapped(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _SaveTapped value)?  saveTapped,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SaveTapped() when saveTapped != null:
return saveTapped(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  saveTapped,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SaveTapped() when saveTapped != null:
return saveTapped();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  saveTapped,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _SaveTapped():
return saveTapped();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  saveTapped,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SaveTapped() when saveTapped != null:
return saveTapped();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements MotorTestEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MotorTestEvent.started()';
}


}




/// @nodoc


class _SaveTapped implements MotorTestEvent {
  const _SaveTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MotorTestEvent.saveTapped()';
}


}




/// @nodoc
mixin _$MotorTestState {

 bool get loading; MotorTest? get motorTest;
/// Create a copy of MotorTestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MotorTestStateCopyWith<MotorTestState> get copyWith => _$MotorTestStateCopyWithImpl<MotorTestState>(this as MotorTestState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MotorTestState&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.motorTest, motorTest) || other.motorTest == motorTest));
}


@override
int get hashCode => Object.hash(runtimeType,loading,motorTest);

@override
String toString() {
  return 'MotorTestState(loading: $loading, motorTest: $motorTest)';
}


}

/// @nodoc
abstract mixin class $MotorTestStateCopyWith<$Res>  {
  factory $MotorTestStateCopyWith(MotorTestState value, $Res Function(MotorTestState) _then) = _$MotorTestStateCopyWithImpl;
@useResult
$Res call({
 bool loading, MotorTest? motorTest
});




}
/// @nodoc
class _$MotorTestStateCopyWithImpl<$Res>
    implements $MotorTestStateCopyWith<$Res> {
  _$MotorTestStateCopyWithImpl(this._self, this._then);

  final MotorTestState _self;
  final $Res Function(MotorTestState) _then;

/// Create a copy of MotorTestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loading = null,Object? motorTest = freezed,}) {
  return _then(_self.copyWith(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,motorTest: freezed == motorTest ? _self.motorTest : motorTest // ignore: cast_nullable_to_non_nullable
as MotorTest?,
  ));
}

}


/// Adds pattern-matching-related methods to [MotorTestState].
extension MotorTestStatePatterns on MotorTestState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MotorTestState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MotorTestState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MotorTestState value)  $default,){
final _that = this;
switch (_that) {
case _MotorTestState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MotorTestState value)?  $default,){
final _that = this;
switch (_that) {
case _MotorTestState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool loading,  MotorTest? motorTest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MotorTestState() when $default != null:
return $default(_that.loading,_that.motorTest);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool loading,  MotorTest? motorTest)  $default,) {final _that = this;
switch (_that) {
case _MotorTestState():
return $default(_that.loading,_that.motorTest);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool loading,  MotorTest? motorTest)?  $default,) {final _that = this;
switch (_that) {
case _MotorTestState() when $default != null:
return $default(_that.loading,_that.motorTest);case _:
  return null;

}
}

}

/// @nodoc


class _MotorTestState implements MotorTestState {
  const _MotorTestState({this.loading = true, this.motorTest});
  

@override@JsonKey() final  bool loading;
@override final  MotorTest? motorTest;

/// Create a copy of MotorTestState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MotorTestStateCopyWith<_MotorTestState> get copyWith => __$MotorTestStateCopyWithImpl<_MotorTestState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MotorTestState&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.motorTest, motorTest) || other.motorTest == motorTest));
}


@override
int get hashCode => Object.hash(runtimeType,loading,motorTest);

@override
String toString() {
  return 'MotorTestState(loading: $loading, motorTest: $motorTest)';
}


}

/// @nodoc
abstract mixin class _$MotorTestStateCopyWith<$Res> implements $MotorTestStateCopyWith<$Res> {
  factory _$MotorTestStateCopyWith(_MotorTestState value, $Res Function(_MotorTestState) _then) = __$MotorTestStateCopyWithImpl;
@override @useResult
$Res call({
 bool loading, MotorTest? motorTest
});




}
/// @nodoc
class __$MotorTestStateCopyWithImpl<$Res>
    implements _$MotorTestStateCopyWith<$Res> {
  __$MotorTestStateCopyWithImpl(this._self, this._then);

  final _MotorTestState _self;
  final $Res Function(_MotorTestState) _then;

/// Create a copy of MotorTestState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loading = null,Object? motorTest = freezed,}) {
  return _then(_MotorTestState(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,motorTest: freezed == motorTest ? _self.motorTest : motorTest // ignore: cast_nullable_to_non_nullable
as MotorTest?,
  ));
}


}

// dart format on
