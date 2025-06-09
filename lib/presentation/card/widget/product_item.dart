import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widget/custom_modal_bottom_sheet.dart';
import 'package:flutter_application_1/domain/cart/entity/cart_item_entity.dart';

class ProductItem extends StatelessWidget {
  final CartItemEntity cartItem;
  final Function() onEdit;
  final Function() onRemove;

  const ProductItem({
    super.key,
    required this.cartItem,
    required this.onEdit,
    required this.onRemove,
  });

  void _showEditPage(BuildContext context) {
    // here i dont have productEntity i have just id and i need to pass the quantity and selected option
    customModalBottomSheet(context,
        height: MediaQuery.of(context).size.height * 0.2,
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Center(
                child:
                    CircularProgressIndicator())) //ProductBuyNowScreen(productEntity: productEntity),
        );
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Remove Item"),
        content: const Text(
            "Are you sure you want to remove this item from your cart?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              onRemove();
              Navigator.pop(context);
            },
            child: const Text("Remove", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10), // Match parent radius
                child: CachedNetworkImage(
                  imageUrl: cartItem.image,
                  placeholder: (context, url) => Container(
                    color: Colors.grey[200],
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) {
                    return const Icon(Icons.error);
                  },
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cartItem.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 14)),
                  const SizedBox(height: 6),
                  Text('\$${cartItem.price}',
                      style:
                          TextStyle(color: Colors.grey.shade700, fontSize: 14)),
                ],
              ),
            ),
            Text('Qty: ${cartItem.quantity}',
                style: const TextStyle(fontSize: 14)),
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert, size: 20),
              onSelected: (value) {
                if (value == 'edit') _showEditPage(context);
                if (value == 'delete') _showDeleteConfirmation(context);
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'edit',
                  child: ListTile(
                    leading: Icon(Icons.edit),
                    title: Text('Edit Item'),
                  ),
                ),
                const PopupMenuItem(
                  value: 'delete',
                  child: ListTile(
                    leading: Icon(Icons.delete, color: Colors.red),
                    title: Text('Remove', style: TextStyle(color: Colors.red)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
