import 'package:flutter/material.dart';

class NavigationItem {
  IconData iconData;

  NavigationItem(this.iconData);
}

List<NavigationItem> getNavigationItemList() {
  return <NavigationItem>[
    NavigationItem(Icons.home),
    NavigationItem(Icons.calendar_today),
    NavigationItem(Icons.notifications),
    NavigationItem(Icons.person),
  ];
}

// class Car {
//   String brand;
//   String model;
//   double price;
//   String condition;
//   List<String> images;
//
//   Car(this.brand, this.model, this.price, this.condition, this.images);
//
// }
// class Car {
//   String brand;
//   String model;
//   double price;
//   String condition;
//   List<String> images;
//
//   String fuelType;        // Petrol / Diesel / EV
//   String transmission;    // Automatic / Manual
//   int seats;
//   double rating;
//   bool isAvailable;
//   String location;
//   String description;
//
//   Car({
//     required this.brand,
//     required this.model,
//     required this.price,
//     required this.condition,
//     required this.images,
//     required this.fuelType,
//     required this.transmission,
//     required this.seats,
//     required this.rating,
//     required this.isAvailable,
//     required this.location,
//     required this.description,
//   });
// }
class Car {
  String brand;
  String model;
  double price; // base price
  String pricingType; // Daily / Weekly / Monthly
  List<String> images;

  // Specs
  String fuelType;
  String transmission;
  int seats;

  // Detail info
  bool isAvailable;
  String description;

  Car({
    required this.brand,
    required this.model,
    required this.price,
    required this.pricingType,
    required this.images,
    required this.fuelType,
    required this.transmission,
    required this.seats,
    required this.isAvailable,
    required this.description,
  });
}

List<Car> getCarList() {
  return <Car>[
    Car(
      brand: "Land Rover",
      model: "Discovery",
      price: 2580,
      pricingType: "Weekly",
      images: [
        "assets/images/land_rover_0.png",
        "assets/images/land_rover_1.png",
        "assets/images/land_rover_2.png",
      ],
      // Specs
      fuelType: "Diesel",
      transmission: "Automatic",
      seats: 7,
      // Detail info
      isAvailable: true,
      description:
          "Premium SUV with strong performance, spacious seating and comfortable ride. Suitable for family and long-distance travel.",
    ),

    Car(
      brand: "Alfa Romeo",
      model: "C4",
      price: 3080,
      pricingType: "Monthly",
      images: ["assets/images/alfa_romeo_c4_0.png"],
      fuelType: "Petrol",
      transmission: "Automatic",
      seats: 3,
      // Detail info
      isAvailable: true,
      description:
          "Premium SUV with strong performance, spacious seating and comfortable ride. Suitable for family and long-distance travel.",
    ),
    Car(
      brand: "Nissan",
      model: "GTR",
      price: 8080,
      pricingType: "Daily",
      images: [
        "assets/images/nissan_gtr_0.png",
        "assets/images/nissan_gtr_1.png",
        "assets/images/nissan_gtr_2.png",
        "assets/images/nissan_gtr_3.png",
      ],
      fuelType: "Petrol",
      transmission: "Automatic",
      seats: 3,
      // Detail info
      isAvailable: true,
      description:
          "Premium SUV with strong performance, spacious seating and comfortable ride. Suitable for family and long-distance travel.",
    ),

    Car(
      brand: "Acura",
      model: "MDX 2020",
      price: 2200,
      pricingType: "Monthly",
      images: [
        "assets/images/acura_0.png",
        "assets/images/acura_1.png",
        "assets/images/acura_2.png",
      ],
      fuelType: "Petrol",
      transmission: "Automatic",
      seats: 3,
      // Detail info
      isAvailable: true,
      description:
          "Premium SUV with strong performance, spacious seating and comfortable ride. Suitable for family and long-distance travel.",
    ),
    Car(
      brand: "Chevrolet",
      model: "Camaro",
      price: 3400,
      pricingType: "Weekly",
      images: [
        "assets/images/camaro_0.png",
        "assets/images/camaro_1.png",
        "assets/images/camaro_2.png",
      ],
      fuelType: "Petrol",
      transmission: "Automatic",
      seats: 3,
      // Detail info
      isAvailable: true,
      description:
          "Premium SUV with strong performance, spacious seating and comfortable ride. Suitable for family and long-distance travel.",
    ),
    Car(
      brand: "Ferrari",
      model: "Spider 488",
      price: 4200,
      pricingType: "Weekly",
      images: [
        "assets/images/ferrari_spider_488_0.png",
        "assets/images/ferrari_spider_488_1.png",
        "assets/images/ferrari_spider_488_2.png",
        "assets/images/ferrari_spider_488_3.png",
        "assets/images/ferrari_spider_488_4.png",
      ],
      fuelType: "Petrol",
      transmission: "Automatic",
      seats: 3,
      // Detail info
      isAvailable: true,
      description:
          "Premium SUV with strong performance, spacious seating and comfortable ride. Suitable for family and long-distance travel.",
    ),
    Car(
      brand: "Ford",
      model: "Focus",
      price: 2300,
      pricingType: "Weekly",
      images: ["assets/images/ford_0.png", "assets/images/ford_1.png"],
      fuelType: "Petrol",
      transmission: "Automatic",
      seats: 3,
      // Detail info
      isAvailable: true,
      description:
          "Premium SUV with strong performance, spacious seating and comfortable ride. Suitable for family and long-distance travel.",
    ),
    Car(
      brand: "Fiat",
      model: "500x",
      price: 1450,
      pricingType: "Weekly",
      images: ["assets/images/fiat_0.png", "assets/images/fiat_1.png"],
      fuelType: "Petrol",
      transmission: "Automatic",
      seats: 3,
      // Detail info
      isAvailable: true,
      description:
          "Premium SUV with strong performance, spacious seating and comfortable ride. Suitable for family and long-distance travel.",
    ),
    Car(
      brand: "Honda",
      model: "Civic",
      price: 900,
      pricingType: "Daily",
      images: ["assets/images/honda_0.png"],
      fuelType: "Petrol",
      transmission: "Automatic",
      seats: 3,
      // Detail info
      isAvailable: true,
      description:
          "Premium SUV with strong performance, spacious seating and comfortable ride. Suitable for family and long-distance travel.",
    ),
    Car(
      brand: "Citroen",
      model: "Picasso",
      price: 1200,
      pricingType: "Monthly",
      images: [
        "assets/images/citroen_0.png",
        "assets/images/citroen_1.png",
        "assets/images/citroen_2.png",
      ],
      fuelType: "Petrol",
      transmission: "Automatic",
      seats: 3,
      // Detail info
      isAvailable: true,
      description:
          "Premium SUV with strong performance, spacious seating and comfortable ride. Suitable for family and long-distance travel.",
    ),
  ];
}

class Dealer {
  String name;
  int offers;
  String image;

  Dealer(this.name, this.offers, this.image);
}

List<Dealer> getDealerList() {
  return <Dealer>[
    Dealer("Hertz", 174, "assets/images/hertz.png"),
    Dealer("Avis", 126, "assets/images/avis.png"),
    Dealer("Tesla", 89, "assets/images/tesla.jpg"),
  ];
}

class Filter {
  String name;

  Filter(this.name);
}

List<Filter> getFilterList() {
  return <Filter>[
    Filter("Best Match"),
    Filter("Highest Price"),
    Filter("Lowest Price"),
  ];
}
