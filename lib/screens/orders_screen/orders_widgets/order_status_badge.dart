// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import '../../../helpers/constants/custom_colors.dart';

enum OrderStatus {
  NEW,
  SENT,
  FINISHED,
  REJECTED;


String getText() {
  switch (this) {
    case OrderStatus.NEW:
    return "NOVA";
    case OrderStatus.SENT:
    return "POSLANA";
    case OrderStatus.FINISHED:
    return "DOSTAVLJENA";
    case OrderStatus.REJECTED:
    return "ODBIJENA";
    
  }
 
}

   
}



class OrderStatusBadge extends StatelessWidget {
  final OrderStatus orderStatus;
  const OrderStatusBadge({super.key, required this.orderStatus});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: 180,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        border: Border.all(
          color: CustomColors.gray[950]!.withOpacity(0.08),
        ),
        color: _getColor(orderStatus),
        boxShadow: [
          BoxShadow(
            color: CustomColors.gray.withOpacity(0.06),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
          BoxShadow(
            color: CustomColors.gray.withOpacity(0.1),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Text(
        textAlign: TextAlign.center,
        orderStatus.getText(),
        style: textTheme.labelLarge!.copyWith(color: Colors.white),
      ),
    );
  }

  Color _getColor(OrderStatus orderStatus) {
    Color? color;
    switch (orderStatus) {
      case OrderStatus.NEW:
        color = CustomColors.jadeGreen[500];
        break;
      case OrderStatus.SENT:
        color = Colors.yellow[800];
        break;
      case OrderStatus.REJECTED:
        color = Colors.red[400];
        break;
      case OrderStatus.FINISHED:
        color = Colors.blue[500];
        break;

      default:
    }

    return color!;
  }
}
