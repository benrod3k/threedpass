part of '../transfer_page.dart';

class _MakeTransferButton extends StatelessWidget {
  const _MakeTransferButton({
    Key? key,
    required this.formKey,
    required this.amountController,
    required this.passwordController,
    required this.toAddressController,
    required this.appService,
  }) : super(key: key);

  final TextEditingController toAddressController;
  final TextEditingController amountController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final AppService appService;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransferInfoCubit, TransferInfo?>(
      builder: (context, state) => D3pElevatedButton(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        text: 'make_transfer_label'.tr(),
        onPressed: state != null
            ? () => Transfer(
                  amount: amountController.text,
                  appService: appService,
                  context: context,
                  toAddress: toAddressController.text,
                  password: passwordController.text,
                  formKey: formKey,
                ).sendFunds()
            : null, //sendAmount(appService, context) : null,
      ),
    );
  }
}
