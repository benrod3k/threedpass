import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/list_tile_button.dart';
import 'package:threedpass/features/accounts/bloc/import_account_cubit/import_account_cubit.dart';
import 'package:threedpass/features/accounts/bloc/import_account_cubit/import_account_state.dart';
import 'package:threedpass/features/accounts/presentation/pages/account_page_template.dart';
import 'package:threedpass/router/router.gr.dart';

class ImportAccountImportType extends StatelessWidget {
  const ImportAccountImportType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AccountPageTemplate.import(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            _Item(ImportType.mnemonic, true),
            _Item(ImportType.rawSeed, false),
            _Item(ImportType.keystore, false),
          ],
        ),
      ],
      disableBottomButton: true,
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(
    this.importType,
    this.enabled, {
    Key? key,
  }) : super(key: key);

  final ImportType importType;
  final bool enabled;

  void onTap(BuildContext context) {
    // log('onTap intem $importType');
    BlocProvider.of<ImportAccountCubit>(context).changeImportType(importType);
    switch (importType) {
      case ImportType.mnemonic:
        context.router.push(ImportMnemonicFormRoute());
        break;
      case ImportType.rawSeed:
        // return 'import_type_raw_seed'.tr();
        break;
      case ImportType.keystore:
        // return 'import_type_keystore'.tr();
        break;
    }
  }

  String titleText(BuildContext context) {
    switch (importType) {
      case ImportType.mnemonic:
        return 'import_type_mnemonic'.tr();
      case ImportType.rawSeed:
        return 'import_type_raw_seed'.tr();
      case ImportType.keystore:
        return 'import_type_keystore'.tr();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTileButton.usual(
      text: titleText(context),
      onPressed: enabled ? () => onTap(context) : null,
    );
  }
}
