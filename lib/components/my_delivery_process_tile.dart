import 'package:flutter/material.dart';

class MyDeliveryProcessTile extends StatelessWidget {
  final String foodName;
  final String orderPrice;
  final String orderDate;
  final VoidCallback onTap; 

  const MyDeliveryProcessTile({
    super.key,
    required this.foodName,
    required this.orderPrice,
    required this.orderDate,
    required this.onTap, 
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, 
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(foodName),
                          Text(
                            'Data: $orderDate',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Preço: $orderPrice',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 25),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Theme.of(context).colorScheme.tertiary,
                endIndent: 25,
                indent: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
