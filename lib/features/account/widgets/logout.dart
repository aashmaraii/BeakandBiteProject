
import 'package:beakandbite/features/account/widgets/button.dart';
import 'package:beakandbite/features/account/widgets/services/account_services.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            
            Row(
              children: [
                AccountButton(
                  text: 'Log Out',
                  onTap: () => AccountServices().logOut(context),
                ),
              
              ],
            ),
          ],
        ),
      ),
    );
  }
}
