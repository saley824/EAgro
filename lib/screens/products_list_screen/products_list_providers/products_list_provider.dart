import 'package:flutter/material.dart';

import '../../../widgets/radio_button_group/radio_button_model.dart';
import '../products_list_models/sort_model.dart';

class ProductsListProvider extends ChangeNotifier {
  List<RadioButtonModel> sorts = [
    RadioButtonModel(
      id: "priceAsc",
      value: SortModel(
        sortBy: "price",
        orderBy: "asc",
      ),
      text: "Price ascending",
      icon: Icons.arrow_upward,
    ),
    RadioButtonModel(
      id: "priceDesc",
      value: SortModel(
        sortBy: "price",
        orderBy: "desc",
      ),
      text: "Price descending",
      icon: Icons.arrow_downward,
    ),
    RadioButtonModel(
      id: "createdAsc",
      value: SortModel(sortBy: "createdAt", orderBy: "asc"),
      text: "Date ascending",
      icon: Icons.arrow_upward,
    ),
    RadioButtonModel(
        id: "createdDesc",
        value: SortModel(sortBy: "createdAt", orderBy: "desc"),
        text: "Date descending",
        icon: Icons.arrow_downward),
    RadioButtonModel(
        id: "discountAsc",
        value: SortModel(sortBy: "discount", orderBy: "asc"),
        text: "Discount ascending",
        icon: Icons.arrow_upward),
    RadioButtonModel(
        id: "discountDesc",
        value: SortModel(sortBy: "discount", orderBy: "desc"),
        text: "Discount descending",
        icon: Icons.arrow_downward),
  ];
}
