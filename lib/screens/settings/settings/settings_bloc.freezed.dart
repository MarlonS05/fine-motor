// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsEvent()';
}


}

/// @nodoc
class $SettingsEventCopyWith<$Res>  {
$SettingsEventCopyWith(SettingsEvent _, $Res Function(SettingsEvent) __);
}


/// Adds pattern-matching-related methods to [SettingsEvent].
extension SettingsEventPatterns on SettingsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _LocaleSelected value)?  localeSelected,TResult Function( _SyncTapped value)?  syncTapped,TResult Function( _SnackConsumed value)?  snackConsumed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _LocaleSelected() when localeSelected != null:
return localeSelected(_that);case _SyncTapped() when syncTapped != null:
return syncTapped(_that);case _SnackConsumed() when snackConsumed != null:
return snackConsumed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _LocaleSelected value)  localeSelected,required TResult Function( _SyncTapped value)  syncTapped,required TResult Function( _SnackConsumed value)  snackConsumed,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _LocaleSelected():
return localeSelected(_that);case _SyncTapped():
return syncTapped(_that);case _SnackConsumed():
return snackConsumed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _LocaleSelected value)?  localeSelected,TResult? Function( _SyncTapped value)?  syncTapped,TResult? Function( _SnackConsumed value)?  snackConsumed,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _LocaleSelected() when localeSelected != null:
return localeSelected(_that);case _SyncTapped() when syncTapped != null:
return syncTapped(_that);case _SnackConsumed() when snackConsumed != null:
return snackConsumed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( AppLocale locale)?  localeSelected,TResult Function()?  syncTapped,TResult Function()?  snackConsumed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _LocaleSelected() when localeSelected != null:
return localeSelected(_that.locale);case _SyncTapped() when syncTapped != null:
return syncTapped();case _SnackConsumed() when snackConsumed != null:
return snackConsumed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( AppLocale locale)  localeSelected,required TResult Function()  syncTapped,required TResult Function()  snackConsumed,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _LocaleSelected():
return localeSelected(_that.locale);case _SyncTapped():
return syncTapped();case _SnackConsumed():
return snackConsumed();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( AppLocale locale)?  localeSelected,TResult? Function()?  syncTapped,TResult? Function()?  snackConsumed,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _LocaleSelected() when localeSelected != null:
return localeSelected(_that.locale);case _SyncTapped() when syncTapped != null:
return syncTapped();case _SnackConsumed() when snackConsumed != null:
return snackConsumed();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements SettingsEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsEvent.started()';
}


}




/// @nodoc


class _LocaleSelected implements SettingsEvent {
  const _LocaleSelected(this.locale);
  

 final  AppLocale locale;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocaleSelectedCopyWith<_LocaleSelected> get copyWith => __$LocaleSelectedCopyWithImpl<_LocaleSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocaleSelected&&(identical(other.locale, locale) || other.locale == locale));
}


@override
int get hashCode => Object.hash(runtimeType,locale);

@override
String toString() {
  return 'SettingsEvent.localeSelected(locale: $locale)';
}


}

/// @nodoc
abstract mixin class _$LocaleSelectedCopyWith<$Res> implements $SettingsEventCopyWith<$Res> {
  factory _$LocaleSelectedCopyWith(_LocaleSelected value, $Res Function(_LocaleSelected) _then) = __$LocaleSelectedCopyWithImpl;
@useResult
$Res call({
 AppLocale locale
});




}
/// @nodoc
class __$LocaleSelectedCopyWithImpl<$Res>
    implements _$LocaleSelectedCopyWith<$Res> {
  __$LocaleSelectedCopyWithImpl(this._self, this._then);

  final _LocaleSelected _self;
  final $Res Function(_LocaleSelected) _then;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? locale = null,}) {
  return _then(_LocaleSelected(
null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as AppLocale,
  ));
}


}

/// @nodoc


class _SyncTapped implements SettingsEvent {
  const _SyncTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsEvent.syncTapped()';
}


}




/// @nodoc


class _SnackConsumed implements SettingsEvent {
  const _SnackConsumed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SnackConsumed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsEvent.snackConsumed()';
}


}




/// @nodoc
mixin _$SettingsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsState()';
}


}

/// @nodoc
class $SettingsStateCopyWith<$Res>  {
$SettingsStateCopyWith(SettingsState _, $Res Function(SettingsState) __);
}


/// Adds pattern-matching-related methods to [SettingsState].
extension SettingsStatePatterns on SettingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Loading value)?  loading,TResult Function( _Error value)?  error,TResult Function( _Ready value)?  ready,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
return error(_that);case _Ready() when ready != null:
return ready(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Loading value)  loading,required TResult Function( _Error value)  error,required TResult Function( _Ready value)  ready,}){
final _that = this;
switch (_that) {
case _Loading():
return loading(_that);case _Error():
return error(_that);case _Ready():
return ready(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Loading value)?  loading,TResult? Function( _Error value)?  error,TResult? Function( _Ready value)?  ready,}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
return error(_that);case _Ready() when ready != null:
return ready(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function()?  error,TResult Function( AppLocale locale,  String versionLabel,  SettingsSnack? snack)?  ready,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Error() when error != null:
return error();case _Ready() when ready != null:
return ready(_that.locale,_that.versionLabel,_that.snack);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function()  error,required TResult Function( AppLocale locale,  String versionLabel,  SettingsSnack? snack)  ready,}) {final _that = this;
switch (_that) {
case _Loading():
return loading();case _Error():
return error();case _Ready():
return ready(_that.locale,_that.versionLabel,_that.snack);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function()?  error,TResult? Function( AppLocale locale,  String versionLabel,  SettingsSnack? snack)?  ready,}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Error() when error != null:
return error();case _Ready() when ready != null:
return ready(_that.locale,_that.versionLabel,_that.snack);case _:
  return null;

}
}

}

/// @nodoc


class _Loading implements SettingsState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsState.loading()';
}


}




/// @nodoc


class _Error implements SettingsState {
  const _Error();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsState.error()';
}


}




/// @nodoc


class _Ready implements SettingsState {
  const _Ready({required this.locale, required this.versionLabel, this.snack});
  

 final  AppLocale locale;
 final  String versionLabel;
 final  SettingsSnack? snack;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadyCopyWith<_Ready> get copyWith => __$ReadyCopyWithImpl<_Ready>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ready&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.versionLabel, versionLabel) || other.versionLabel == versionLabel)&&(identical(other.snack, snack) || other.snack == snack));
}


@override
int get hashCode => Object.hash(runtimeType,locale,versionLabel,snack);

@override
String toString() {
  return 'SettingsState.ready(locale: $locale, versionLabel: $versionLabel, snack: $snack)';
}


}

/// @nodoc
abstract mixin class _$ReadyCopyWith<$Res> implements $SettingsStateCopyWith<$Res> {
  factory _$ReadyCopyWith(_Ready value, $Res Function(_Ready) _then) = __$ReadyCopyWithImpl;
@useResult
$Res call({
 AppLocale locale, String versionLabel, SettingsSnack? snack
});




}
/// @nodoc
class __$ReadyCopyWithImpl<$Res>
    implements _$ReadyCopyWith<$Res> {
  __$ReadyCopyWithImpl(this._self, this._then);

  final _Ready _self;
  final $Res Function(_Ready) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? locale = null,Object? versionLabel = null,Object? snack = freezed,}) {
  return _then(_Ready(
locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as AppLocale,versionLabel: null == versionLabel ? _self.versionLabel : versionLabel // ignore: cast_nullable_to_non_nullable
as String,snack: freezed == snack ? _self.snack : snack // ignore: cast_nullable_to_non_nullable
as SettingsSnack?,
  ));
}


}

// dart format on
