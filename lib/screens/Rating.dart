import 'package:flutter/material.dart';
import 'package:shopsmart/screens/Order.dart';

class RatingWithButton extends StatefulWidget {
  final int maxStars;
  final double size;
  static String id = "/RatingWithButton";
  const RatingWithButton({
    super.key,
    this.maxStars = 5,
    this.size = 32,
  });

  @override
  State<RatingWithButton> createState() => _RatingWithButtonState();
}

class _RatingWithButtonState extends State<RatingWithButton> {
  int selectedStars = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ⭐⭐⭐⭐⭐
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.maxStars, (index) {
              final starNumber = index + 1;
              return IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Icon(
                  Icons.star,
                  size: widget.size,
                  color: starNumber <= selectedStars ? Colors.orange : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    selectedStars = starNumber;
                  });
                },
              );
            }),
          ),

          const SizedBox(height: 16),

          // زر إرسال التقييم
          ElevatedButton(
            onPressed: selectedStars == 0
                ? null
                : () {
              Navigator.pushNamed(context, ThankYouScreen.id);
            },
            child: const Text("Submit Rating"),
          )
        ],
      ),
    );
  }
}
