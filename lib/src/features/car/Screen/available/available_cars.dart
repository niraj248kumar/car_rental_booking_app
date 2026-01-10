import 'package:car_rental_booking/src/constraints/colors.dart';
import 'package:car_rental_booking/src/features/car/Screen/book/car_details.dart';
import 'package:car_rental_booking/src/features/car/data/datas.dart';
import 'package:car_rental_booking/src/features/car/widget/car_widget.dart';
import 'package:flutter/material.dart';

class AvailableCars extends StatefulWidget {
  const AvailableCars({super.key});

  @override
  State<AvailableCars> createState() => _AvailableCarsState();
}

class _AvailableCarsState extends State<AvailableCars> {
  @override
  Widget build(BuildContext context) {
    final cars = getCarList();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "Popular Cars",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            /// 🚘 LIST
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: cars.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BookCar(car: cars[index]),
                        ),
                      );
                    },
                    child: buildCar(cars[index], index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
