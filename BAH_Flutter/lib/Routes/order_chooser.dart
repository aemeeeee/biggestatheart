import 'package:ichthyolog/Models/species.dart';
import 'package:selectable_list/selectable_list.dart';
import 'package:flutter/material.dart';

class OrderPicker extends StatefulWidget {
  final Function orderCallback;
  final String class_;
  const OrderPicker(
      {Key? key, required this.orderCallback, required this.class_})
      : super(key: key);

  @override
  OrderPickerState createState() => OrderPickerState();
}

class OrderPickerState extends State<OrderPicker> {
  String? selectedOrder;

  @override
  Widget build(BuildContext context) {
    return SelectableList<SpeciesClassification, String?>(
      items: mux(),
      itemBuilder: (context, order, selected, onTap) => ListTile(
          title: Text(order.classification),
          subtitle: Text(order.description),
          selected: selected,
          onTap: onTap),
      valueSelector: (order) => order.classification,
      selectedValue: selectedOrder,
      onItemSelected: (order) {
        setState(() {
          selectedOrder = order.classification;
        });
        widget.orderCallback(selectedOrder);
      },
      onItemDeselected: (order) {
        setState(() {
          selectedOrder = '';
        });
        widget.orderCallback(selectedOrder);
      },
    );
  }

  List<SpeciesClassification> mux() {
    switch (widget.class_) {
      case 'Chondrichthyes':
        return ordersChondrichthyes;
      case 'Actinopterygii':
        return ordersActinopterygii;
      default:
        return ordersActinopterygii + ordersChondrichthyes;
    }
  }
}
