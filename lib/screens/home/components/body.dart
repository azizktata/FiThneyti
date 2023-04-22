import 'package:flutter/material.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/models/Reservation.dart';
import 'package:shop_app/models/RideDetails.dart';

import '../../../size_config.dart';

import 'ride_card.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  List<Reservation> myReservations = [
    Reservation(
    departurePoint: "New York City",
    destinationPoint: "Los Angeles",
    startTime: '10:00 AM',
    endTime: "3:00 PM",
    dayTime: DateTime.now(),
    status : ReservationState.Accepted,
  ),
  Reservation(
    departurePoint: "Ezzahra",
    destinationPoint: "Sesame",
    startTime: '10:00 AM',
    endTime: "3:00 PM",
    dayTime: DateTime.now(),
    status : ReservationState.Completed,
  ),
  ];
  List<RideDetails> myRides = [
    RideDetails(
    user: "John snow",
    rating: 4.8,
    departurePoint: "San Diego",
    destinationPoint: "Seattle",
    startTime: '9:00 AM',
    endTime: "2:00 PM",
    dayTime:DateTime.now(),
    price: 60.0,
    places:1

  ),
  RideDetails(
    user: "Bob Johnson",
    rating: 4.2,
    departurePoint: "Boston",
    destinationPoint: "Washington D.C.",
    startTime: '8:00 AM',
    endTime: "1:00 PM",
    dayTime: DateTime.now(),
    price: 45.0,
    places:1

  ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            //HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            Image.asset(
              "assets/images/splash_1.png",
              height: getProportionateScreenHeight(265),
              width: getProportionateScreenWidth(235),
            ),
            SizedBox(height: getProportionateScreenWidth(10)),
            
           
           Row(
            mainAxisAlignment: MainAxisAlignment.start,
            
             children: [
              Padding(
                padding:EdgeInsets.symmetric(vertical: 10,horizontal: getProportionateScreenWidth(20)),

               child:Text(
                  "Home",
                  style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  color: Colors.black,
               ),
              ),
              ),
             ],
           ),
            //DiscountBanner(),
            //Categories(),
            RideCard(title :"My Reservations", reservations: myReservations, isRide: false),
            SizedBox(height: getProportionateScreenWidth(30)),
            //PopularProducts(),
            RideCard(title :"My Rides",rides: myRides,),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
