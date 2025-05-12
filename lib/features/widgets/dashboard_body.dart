import 'package:flower_up_product/features/add_product/add_product_view.dart';
import 'package:flutter/cupertino.dart';
import '../../core/widgets/custom_button.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Custombutton(
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(
                  builder: (context) => const AddProductView( )),);
            },
            text: 'Add Product',
          )
        ],
      ),
    );
  }
}
