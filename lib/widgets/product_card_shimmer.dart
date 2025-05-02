import 'package:flutter/material.dart';
import 'shimmer_effect.dart';

class ProductCardShimmer extends StatelessWidget {
  const ProductCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ShimmerEffect.rectangular(
            height: 120,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ShimmerEffect.rectangular(
                  height: 16,
                  width: 150,
                ),
                const SizedBox(height: 4),
                const ShimmerEffect.rectangular(
                  height: 14,
                  width: 80,
                ),
                const SizedBox(height: 8),
                const ShimmerEffect.rectangular(
                  height: 14,
                  width: 100,
                ),
                const SizedBox(height: 8),
                ShimmerEffect.rectangular(
                  height: 36,
                  width: double.infinity,
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}