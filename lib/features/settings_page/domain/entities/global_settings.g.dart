// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_settings.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GlobalSettingsCWProxy {
  GlobalSettings previewSettings(PreviewSettings previewSettings);

  GlobalSettings scanSettings(ScanSettings scanSettings);

  GlobalSettings walletSettings(WalletSettings walletSettings);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GlobalSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GlobalSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  GlobalSettings call({
    PreviewSettings? previewSettings,
    ScanSettings? scanSettings,
    WalletSettings? walletSettings,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGlobalSettings.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGlobalSettings.copyWith.fieldName(...)`
class _$GlobalSettingsCWProxyImpl implements _$GlobalSettingsCWProxy {
  final GlobalSettings _value;

  const _$GlobalSettingsCWProxyImpl(this._value);

  @override
  GlobalSettings previewSettings(PreviewSettings previewSettings) =>
      this(previewSettings: previewSettings);

  @override
  GlobalSettings scanSettings(ScanSettings scanSettings) =>
      this(scanSettings: scanSettings);

  @override
  GlobalSettings walletSettings(WalletSettings walletSettings) =>
      this(walletSettings: walletSettings);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GlobalSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GlobalSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  GlobalSettings call({
    Object? previewSettings = const $CopyWithPlaceholder(),
    Object? scanSettings = const $CopyWithPlaceholder(),
    Object? walletSettings = const $CopyWithPlaceholder(),
  }) {
    return GlobalSettings(
      previewSettings: previewSettings == const $CopyWithPlaceholder() ||
              previewSettings == null
          ? _value.previewSettings
          // ignore: cast_nullable_to_non_nullable
          : previewSettings as PreviewSettings,
      scanSettings:
          scanSettings == const $CopyWithPlaceholder() || scanSettings == null
              ? _value.scanSettings
              // ignore: cast_nullable_to_non_nullable
              : scanSettings as ScanSettings,
      walletSettings: walletSettings == const $CopyWithPlaceholder() ||
              walletSettings == null
          ? _value.walletSettings
          // ignore: cast_nullable_to_non_nullable
          : walletSettings as WalletSettings,
    );
  }
}

extension $GlobalSettingsCopyWith on GlobalSettings {
  /// Returns a callable class that can be used as follows: `instanceOfGlobalSettings.copyWith(...)` or like so:`instanceOfGlobalSettings.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GlobalSettingsCWProxy get copyWith => _$GlobalSettingsCWProxyImpl(this);
}

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GlobalSettingsAdapter extends TypeAdapter<GlobalSettings> {
  @override
  final int typeId = 4;

  @override
  GlobalSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GlobalSettings(
      scanSettings: fields[0] as ScanSettings,
      walletSettings: fields[1] as WalletSettings,
      previewSettings: fields[2] as PreviewSettings,
    );
  }

  @override
  void write(BinaryWriter writer, GlobalSettings obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.scanSettings)
      ..writeByte(1)
      ..write(obj.walletSettings)
      ..writeByte(2)
      ..write(obj.previewSettings);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GlobalSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
