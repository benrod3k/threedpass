import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/assets_page/widgets/accounts_drawer.dart';
import 'package:threedpass/features/wallet_screen/presentation/assets_page/widgets/asset_page_appbar.dart';
import 'package:threedpass/features/wallet_screen/presentation/assets_page/widgets/assets_count.dart';
import 'package:threedpass/features/wallet_screen/presentation/assets_page/widgets/recieve_button.dart';
import 'package:threedpass/features/wallet_screen/presentation/assets_page/widgets/transfer_button.dart';

part './widgets/buttons_panel.dart';

class AssetsPage extends StatelessWidget {
  const AssetsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppServiceLoaderCubit, AppService>(
      builder: (context, state) {
        return Scaffold(
          appBar: AssetPageAppbar(
            account: state.keyring.current,
            context: context,
          ),
          drawer: AccountsDrawer(
            appServiceCubit: BlocProvider.of<AppServiceLoaderCubit>(context),
            accounts: state.keyring.allAccounts,
            current: state.keyring.current,
            context: context,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              AssetsCount(),
              SizedBox(height: 16),
              _ButtonsPanel(),
            ],
          ),
        );
      },
    );
  }
}
