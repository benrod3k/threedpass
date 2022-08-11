import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/setup.dart';

class SectionsTextField extends StatelessWidget {
  const SectionsTextField({Key? key}) : super(key: key);

  Future<void> _onFieldChanged(
    BuildContext context,
    ScanSettings settings,
    String? newValue,
  ) async {
    if (newValue != null && int.tryParse(newValue) != null) {
      final state = getIt<SettingsConfigCubit>().state;
      final config = state.settings.copyWith(nSections: int.parse(newValue));
      getIt<SettingsConfigCubit>().updateSettings(config);
    }
  }

  static String? onlyNumValidator(String? value) {
    if (value != null && int.tryParse(value) != null) {
      return null;
    } else {
      return 'Only Numbers are allowed';
    }
  }

  @override
  Widget build(BuildContext context) {
    final settings = getIt<SettingsConfigCubit>().state.settings;

    return TextFormField(
      controller: TextEditingController(
        text: settings.nSections.toString(),
      ),
      onChanged: (String? newValue) =>
          _onFieldChanged(context, settings, newValue),
      keyboardType: TextInputType.number,
      validator: onlyNumValidator,
      decoration: InputDecoration(
        label: Text('n_sections_label'.tr()),
      ),
    );
  }
}
