import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:eagro/widgets/buttons/agro_button.dart';
import 'package:provider/provider.dart';

import '../../../helpers/constants/custom_colors.dart';
import '../product_providers/product_provider.dart';

class RatingBottomSheet extends StatelessWidget {
  final VoidCallback? onTap;
  const RatingBottomSheet({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Column(
        children: [
          Text(
            "Ocenite proizvod na skali od 1 do 5 zvjezdica da biste nam pokazali koliko ste zadovoljni ovim proizvodom.",
            style: textTheme.bodyLarge,
          ),
          const Gap(8),
          RatingBar.builder(
            ignoreGestures: productProvider.rating != null,
            initialRating: productProvider.rating != null
                ? productProvider.rating!.toDouble()
                : 0.0,
            minRating: 1,
            direction: Axis.horizontal,
            unratedColor: Colors.amber.withAlpha(50),
            itemCount: 5,
            itemSize: 50.0,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: productProvider.rating != null
                  ? CustomColors.yellow[500]!.withOpacity(0.8)
                  : Colors.amber,
            ),
            onRatingUpdate: (rating) {
              productProvider.setCurrentRating(rating.toInt());
            },
            updateOnDrag: true,
          ),
          if (productProvider.rating != null) ...[
            const Gap(16),
            Text(
              "Već ste ostavili ocjenu.",
              style: textTheme.bodyLarge,
            )
          ],
          const Gap(24),
          const Spacer(),
          Consumer<ProductProvider>(
            builder: (_, __, ___) => AgroButton(
              disabled: !productProvider.isButtonEnabled,
              text: "Ocijeni",
              onTap: () {
                productProvider.makeReview();
                Navigator.of(context).pop();
              },
              buttonColor: ButtonColor.jadeGreen,
            ),
          )
        ],
      ),
    );
  }
}
