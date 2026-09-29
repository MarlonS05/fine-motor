part of 'catalog_bloc.dart';

@freezed
abstract class CatalogEvent with _$CatalogEvent {
  const factory CatalogEvent.started() = _Started;
  const factory CatalogEvent.testSelected(LevelEnum level) = _TestSelected;
  const factory CatalogEvent.snackConsumed() = _SnackConsumed;
}
