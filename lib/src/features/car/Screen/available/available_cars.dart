// import 'package:car_rental_booking/src/features/car/data/datas.dart';
// import 'package:flutter/material.dart';
// import '../../../../constraints/colors.dart' show kPrimaryColor;
// import '../../widget/car_widget.dart' show buildCar;
// import '../book/car_details.dart' show BookCar;
//
// class AvailableCars extends StatefulWidget {
//   const AvailableCars({super.key});
//
//   @override
//   State<AvailableCars> createState() => _AvailableCarsState();
// }
//
// class _AvailableCarsState extends State<AvailableCars> {
//   List<Filter> filters = getFilterList();
//   late Filter selectedFilter;
//
//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       selectedFilter = filters[0];
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.grey[100],
//         body: SafeArea(
//           child: Container(
//             width: double.infinity,
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Container(
//                     height: 45,
//                     width: 45,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(16),
//                       border: Border.all(color: Colors.grey[300]!, width: 1),
//                     ),
//                     child: const Icon(
//                       Icons.keyboard_arrow_left,
//                       color: Colors.black,
//                       size: 28,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 16,
//                 ),
//                 Text(
//                   'Available Cars (${getCarList().length})',
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 16,
//                 ),
//                 Expanded(
//                   child: GridView.count(
//                       physics: const BouncingScrollPhysics(),
//                       childAspectRatio: 1 / 1.55,
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 8,
//                       mainAxisSpacing: 16,
//                       children: getCarList().map((item) {
//                         return GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => BookCar(
//                                   car: item,
//                                 ),
//                               ),
//                             );
//                           },
//                           child: buildCar(item, null),
//                         );
//                       }).toList()),
//                 )
//               ],
//             ),
//           ),
//         ),
//         bottomNavigationBar: Container(
//           height: 90,
//           decoration: const BoxDecoration(
//             color: Colors.white,
//           ),
//           child: Row(
//             children: [
//               buildFilterIcon(),
//               Expanded(
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: buildFilters(),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildFilterIcon() {
//     return Container(
//       width: 50,
//       height: 50,
//       margin: const EdgeInsets.symmetric(horizontal: 16),
//       decoration: BoxDecoration(
//         color: kPrimaryColor,
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: const Center(
//         child: Icon(
//           Icons.filter_list,
//           color: Colors.white,
//           size: 24,
//         ),
//       ),
//     );
//   }
//
//   List<Widget> buildFilters() {
//     List<Widget> list = [];
//     for (var i = 0; i < filters.length; i++) {
//       list.add(buildFilter(filters[i]));
//     }
//     return list;
//   }
//
//   Widget buildFilter(Filter filter) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedFilter = filter;
//         });
//       },
//       child: Padding(
//         padding: const EdgeInsets.only(right: 16),
//         child: Text(
//           filter.name,
//           style: TextStyle(
//             color: selectedFilter == filter ? kPrimaryColor : Colors.grey[300],
//             fontSize: 16,
//             fontWeight:
//             selectedFilter == filter ? FontWeight.bold : FontWeight.normal,
//           ),
//         ),
//       ),
//     );
//   }
// }

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
  List<Filter> filters = getFilterList();
  late Filter selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    final cars = getCarList();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 🔙 BACK + TITLE
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
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
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

      /// 🔻 FILTER BAR
      bottomNavigationBar: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            buildFilterIcon(),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: buildFilters()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔧 FILTER ICON
  Widget buildFilterIcon() {
    return Container(
      width: 48,
      height: 48,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Icon(
        Icons.filter_list,
        color: Colors.white,
      ),
    );
  }

  /// 🔧 FILTER TEXTS
  List<Widget> buildFilters() {
    return filters.map((filter) => buildFilter(filter)).toList();
  }

  Widget buildFilter(Filter filter) {
    final isSelected = selectedFilter == filter;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = filter;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Text(
          filter.name,
          style: TextStyle(
            color: isSelected ? kPrimaryColor : Colors.grey,
            fontSize: 16,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
