import 'package:car_rental_booking/src/features/car/Screen/available/available_cars.dart';
import 'package:car_rental_booking/src/features/car/Screen/book/car_details.dart';
import 'package:car_rental_booking/src/features/car/data/datas.dart';
import 'package:car_rental_booking/src/features/car/widget/car_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../core/CRB_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Car> cars = getCarList();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor:CRBService.kcGrey,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔵 TOP HEADER
            Container(
              height: h * 0.22,
              padding: EdgeInsets.symmetric(horizontal: w * 0.05),
              decoration: BoxDecoration(
                color:  CRBService.kcBlue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),

                  /// LOCATION + NOTIFICATION
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text(
                            "Location",
                            style: TextStyle(
                              color:  CRBService.kcWhite,
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.location_on,
                                  color: CRBService.kcWhite, size: 18),
                              SizedBox(width: 4),
                              Text(
                                "Patna, Bihar, India",
                                style: TextStyle(
                                  color: CRBService.kcWhite,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:  Icon(Icons.notifications,
                            color: CRBService.kcWhite),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// 🔍 SEARCH BAR
                  Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: CRBService.kcWhite,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children:  [
                        Icon(Icons.search, color:CRBService.kcGrey),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Enter your location",
                            style: TextStyle(color: CRBService.kcGrey),
                          ),
                        ),
                        Icon(Icons.filter_alt_outlined,
                            color: CRBService.kcBlue),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 5),
            sectionTitle("Brands"),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  brandItem("assets/logo/Honda_Logo.png", "Honda"),
                  brandItem("assets/logo/nissan-logo.png", "Nissan"),
                  brandItem("assets/logo/audi-logo.png", "Audi"),
                  brandItem("assets/logo/mercedes-logo.png", "Mercedes"),
                ],
              ),
            ),


            /// 🚙 POPULAR CAR
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular car',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: CRBService.kcGrey,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AvailableCars(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          'See All',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: CRBService.kcBlue,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: CRBService.kcBlue,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: ListView.builder(
                  itemCount: cars.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
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
            ),

          ],
        ),
      ),

      /// 🔻 BOTTOM NAV
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (i) => setState(() => selectedIndex = i),
        selectedItemColor: CRBService.kcBlue,
        unselectedItemColor: CRBService.kcBlack,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Booking"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  /// 🔧 SECTION TITLE
  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold),
          ),
           Text("See all",
              style: TextStyle(color: CRBService.kcBlue)),
        ],
      ),
    );
  }

  /// 🔧 BRAND ITEM
  Widget brandItem(String image, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 70,
          width: 70,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: CRBService.kcWhite,
            border: Border.all(color: CRBService.kcGrey),
          ),
          child: Image.asset(image),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.w600, fontSize: 14),
        ),
      ],
    );
  }
}
