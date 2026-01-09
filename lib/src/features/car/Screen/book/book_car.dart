import 'package:car_rental_booking/src/features/car/Screen/book/user_info.dart';
import 'package:car_rental_booking/src/features/car/data/datas.dart';
import 'package:flutter/material.dart';

class BookCarScreen extends StatefulWidget {
  final Car car;
  const BookCarScreen({super.key, required this.car});

  @override
  State<BookCarScreen> createState() => _BookCarScreenState();
}

class _BookCarScreenState extends State<BookCarScreen> {
  bool isSelfDriver = true;
  DateTime? pickupDate;
  DateTime? returnDate;
  TimeOfDay? pickupTime;
  TimeOfDay? returnTime;

  @override
  Widget build(BuildContext context) {
    final car = widget.car;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Book Car"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// image
            Hero(
              tag: car.model,
              child: Image.asset(
                car.images.first,
                height: 160,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 16),
            Text(car.model,
                style:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("Rs.${car.price}/hr",
                style: const TextStyle(color: Colors.blue)),

            const SizedBox(height: 20),
            _rentType(),
            const SizedBox(height: 20),
            _dateSection(),
            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserInfoScreen(),));
                },
                child: const Text("Continue",style: TextStyle(color: Colors.white),),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _rentType() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Rent Type",
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _rentButton("Self Driver", isSelfDriver, () {
                setState(() => isSelfDriver = true);
              }),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _rentButton("With Driver", !isSelfDriver, () {
                setState(() => isSelfDriver = false);
              }),
            ),
          ],
        ),
        if (!isSelfDriver)
          const Padding(
            padding: EdgeInsets.only(top: 6),
            child: Text(
              "Additional Rs.1500 driver charge",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          )
      ],
    );
  }

  Widget _rentButton(String title, bool selected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: selected ? Colors.blue : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(30),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
              color: selected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _dateSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Pickup Date & Time",
            style: TextStyle(fontWeight: FontWeight.bold)),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: _pickPickupDate,
                child: Text(pickupDate == null
                    ? "Date"
                    : pickupDate!.toLocal().toString().split(" ")[0]),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: OutlinedButton(
                onPressed: _pickPickupTime,
                child: Text(
                    pickupTime == null ? "Time" : pickupTime!.format(context)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Text("Return Date & Time",
            style: TextStyle(fontWeight: FontWeight.bold)),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: _pickReturnDate,
                child: Text(returnDate == null
                    ? "Date"
                    : returnDate!.toLocal().toString().split(" ")[0]),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: OutlinedButton(
                onPressed: _pickReturnTime,
                child: Text(
                    returnTime == null ? "Time" : returnTime!.format(context)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _pickPickupDate() async {
    pickupDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
    );
    setState(() {});
  }

  Future<void> _pickPickupTime() async {
    pickupTime =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
    setState(() {});
  }

  Future<void> _pickReturnDate() async {
    returnDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
    );
    setState(() {});
  }

  Future<void> _pickReturnTime() async {
    returnTime =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
    setState(() {});
  }
}
