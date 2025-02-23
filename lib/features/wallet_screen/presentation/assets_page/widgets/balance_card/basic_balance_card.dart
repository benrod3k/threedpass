import 'package:flutter/material.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';

class BasicBalanceCard extends StatelessWidget {
  final String tokenSymbol;
  final String balance;
  final int tokenDecimals;
  final IconData iconData;
  final String title;

  const BasicBalanceCard({
    Key? key,
    required this.balance,
    required this.tokenDecimals,
    required this.tokenSymbol,
    required this.iconData,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconData,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(title),
              ],
            ),
            const SizedBox(height: 4),
            Text.rich(
              TextSpan(
                text: BalanceUtils.balance(
                  balance,
                  tokenDecimals,
                ),
                children: [
                  TextSpan(
                    text: ' ' + tokenSymbol,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}
