import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:msan/providers/main_provider.dart';
import 'package:provider/provider.dart';

import '../../widgets/products/product_preview/product_preview.dart';
import '/widgets/loading_indicator/agro_loading_indicator.dart';
import '../../helpers/helper_functions.dart';
import 'saved_products_provider/saved_products_provider.dart';

class SavedProductsScreen extends StatelessWidget {
  const SavedProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final savedProductsProvider = context.read<SavedProductsProvider>();
    final mainProvider = context.read<MainProvider>();
    final globalAppNavigator = Navigator.of(context);

    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: HelperFunctions.getAppBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: FutureBuilder(
            future:
                savedProductsProvider.getSavedProducts(mainProvider.user!.id),
            builder: (context, snapshot) => snapshot.connectionState ==
                    ConnectionState.waiting
                ? const AgroLoadingIndicator()
                : SingleChildScrollView(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Saved products",
                            style: textTheme.headlineSmall,
                          ),
                          const Gap(16),
                          Wrap(
                            spacing: 36,
                            runSpacing: 8,
                            children: [
                              ...savedProductsProvider.savedProducts
                                  .map((data) => ProductPreview(product: data))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
