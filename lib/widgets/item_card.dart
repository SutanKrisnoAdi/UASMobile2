import 'package:flutter/material.dart';
import 'package:inventory/models/item.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  final Function() onEdit;
  final Function() onDelete;

  ItemCard({required this.item, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(item.nama),
        subtitle: Text('Kode: ${item.kode} - Qty: ${item.qty}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: onEdit,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
