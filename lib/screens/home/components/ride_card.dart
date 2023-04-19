import 'package:flutter/material.dart';
import 'package:shop_app/models/RideDetails.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class RideCard extends StatelessWidget {
  final String title;
  final List<RideDetails> rides;

  const RideCard({
    Key? key,
    required this.title,
    required this.rides
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: title,
            press: () {},
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                rides.length,
                (index){
                  return 
                  SpecialRideCard(
                    departurePoint: rides[index].departurePoint,
                    destinationPoint: rides[index].destinationPoint,
                    dayTime: rides[index].dayTime,
                    startTime: rides[index].startTime,
                    press: () {},
                  );
                }),
                
              
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialRideCard extends StatelessWidget {
  const SpecialRideCard({
    Key? key,
    required this.departurePoint,
    required this.destinationPoint,
    required this.startTime,
    required this.dayTime,
    required this.press,
  }) : super(key: key);

  final String departurePoint;
  final String destinationPoint;
  final String startTime;
  final DateTime dayTime;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 231, 157, 38).withOpacity(0.4),
                        Color.fromARGB(255, 81, 62, 34).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "${dayTime.toString().substring(0,10)}, ${startTime}\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(10),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                       
                        TextSpan(text: "$departurePoint \n"),
                        TextSpan(text :"| \n"),
                        TextSpan(text: "$destinationPoint")
                      ],
                    ),
                  ),
                ),
                Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: getProportionateScreenWidth(20),
                  ),
                ),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
