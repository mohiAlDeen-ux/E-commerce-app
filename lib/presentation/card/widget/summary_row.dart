
import 'package:flutter/material.dart';

class SummaryRow extends StatelessWidget {
  final String label;
  final double amount;
  final bool isTotal;

  const SummaryRow(this.label, this.amount, {super.key, this.isTotal = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(label,
              style: TextStyle(
                  color: isTotal ? Colors.black : Colors.grey.shade700,
                  fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
                  fontSize: 14)),
          const Spacer(),
          Text('\$${amount.toStringAsFixed(2)}',
              style: TextStyle(
                  color:
                      isTotal ? Theme.of(context).primaryColor : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: isTotal ? 18 : 16)),
        ],
      ),
    );
  }
}