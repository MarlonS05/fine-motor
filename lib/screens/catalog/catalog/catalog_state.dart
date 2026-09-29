part of 'catalog_bloc.dart';

@freezed
abstract class CatalogState with _$CatalogState {
  const factory CatalogState.loading() = _Loading;
  const factory CatalogState.error() = _Error;
  const factory CatalogState.ready({
    required List<MotorTest> tests,
    CatalogSnack? snack,
  }) = _Ready;
}
