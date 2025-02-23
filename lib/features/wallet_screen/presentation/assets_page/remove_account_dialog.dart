import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/core/widgets/buttons/text_button.dart';

class RemoveAccountDialog extends StatelessWidget {
  const RemoveAccountDialog({Key? key}) : super(key: key);

  Future<void> deleteAccount(
    AppServiceLoaderCubit appServiceLoaderCubit,
    BuildContext context,
  ) async {
    final appService = appServiceLoaderCubit.state;

    // remove current account
    await appService.plugin.sdk.api.keyring.deleteAccount(
      appService.keyring,
      appService.keyring.current,
    );

    if (appService.keyring.allAccounts.isNotEmpty) {
      appServiceLoaderCubit.changeAccount(appService.keyring.current);
    } else {
      appServiceLoaderCubit.justEmit();
    }

    // change account and notify the UI

    // // subscribe to balance
    // AppServiceLoaderCubit.subscribeToBalance(appService);

    // Maybe we should load some cache? Idk. This is copied from the original code.
    // And it may be helpful in the future in case of bugs.
    // appService.store.assets.loadCache(
    //     widget.service.keyring.current,
    //     widget.service.plugin.basic.name);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final appServiceLoaderCubit =
        BlocProvider.of<AppServiceLoaderCubit>(context);
    final appService = appServiceLoaderCubit.state;

    return AlertDialog(
      title: Text(
        'remove_accout_dialog_title'.tr(
          args: [
            Fmt.shorterAddress(appService.keyring.current.address),
          ],
        ),
      ),
      content: Text('remove_accout_dialog_text'.tr()),
      actions: [
        SizedBox(
          // height: 35,
          child: Row(
            children: [
              Spacer(),
              Flexible(
                child: D3pTextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  text: 'Cancel'.tr(),
                ),
              ),
              Flexible(
                child: D3pTextButton(
                  onPressed: () =>
                      deleteAccount(appServiceLoaderCubit, context),
                  text: 'Delete'.tr(),
                  textColor: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
