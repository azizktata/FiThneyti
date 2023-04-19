import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/models/RideDetails.dart';
import 'package:shop_app/screens/details/components/top_rounded_container.dart';
import 'package:shop_app/screens/search_ride/Components/rideDescription.dart';

import '../../../components/default_button.dart';
import '../../../components/rounded_icon_btn.dart';
import '../../../size_config.dart';

class BodyRide extends StatelessWidget {
  final RideDetails rideDetails;
  const BodyRide({ required this.rideDetails,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return ListView(
      children: [
        Column(
        children: [
        SizedBox(
          width: mediaQuery.size.width/1.5,
          child: AspectRatio(
            aspectRatio: 1,
            child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 50.0),
                          child: Row(
                                              
                          children: [
                            
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.location_on),
                                  SizedBox(width: 15,),
                                  Text(
                                  rideDetails.departurePoint,
                                  style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color:Colors.black87
                                   ),
                                ),
                               ],
                              ),
                            Row(
                              children: [
                                SizedBox(width: 12),
                                Transform.scale(
                                  scale: 0.8,
                                  child: Icon(Icons.time_to_leave),
                                ),
                                SizedBox(width: 7,),
                                Text(
                              rideDetails.startTime,
                              style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color:Colors.black87
                                ),
                              ),
                              ],
                            ),
                              
                           ],
                          ),
                          
                          
                      
                        ],
                      ),
                        ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 50.0),
                      child: Row(
                        
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.location_on),
                                  SizedBox(width: 15,),
                                  Text(
                                  rideDetails.destinationPoint,
                                  style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87
                                   ),
                                ),
                               ],
                              ),
                            Row(
                              children: [
                                SizedBox(width: 12),
                                Transform.scale(
                                  scale: 0.8,
                                  child: Icon(Icons.share_arrival_time, ),
                                ),
                                SizedBox(width: 7,),
                                Text(
                              rideDetails.endTime,
                              style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: Colors.black87
                                ),
                              ),
                              ],
                            ),
                              
                           ],
                          ),
                        ],
                      ),
                    ),

                SizedBox(height: 10,),
                SizedBox(
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      children: [
                        Text(
                          "Time : ",
                           style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                          ),
                        ),

                        Text(
                          rideDetails.dayTime.toString().substring(0,10),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 239, 207, 165)
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Average duration :",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                          ),
                        ),
                        Text(
                          "2h 46min",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 239, 207, 165)
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
                    ],
                  ),

            ),
          ),
       ],
      ),
      TopRoundedContainer(
        color: Colors.white
      , child: Column(
        children: [
          RideDescription(rideDetails: rideDetails)
      ],
      )
      ),
      TopRoundedContainer(
        color: Color(0xFFF6F7F9),
       child: Column(
        children: [
          //call rider
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
            
              children: [
                CircleAvatar(
                      radius: 40,
                      child: Text("JD"),
                      backgroundColor: Colors.orangeAccent,
                      foregroundColor: Colors.white,
                    ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(rideDetails.user),
                    Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                    children: [
                      
                      Text(
                        "${rideDetails.rating}",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 5),
                      SvgPicture.asset("assets/icons/Star Icon.svg"),
                    ],
              ),
            ),
                  ],
                )
              ],
            ),
             
            RoundedIconBtn(
            icon: Icons.call,
            press: () {},
          ),
          ],
        ),
          

          //Reservation button
          TopRoundedContainer(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.15,
                right: SizeConfig.screenWidth * 0.15,
                bottom: getProportionateScreenWidth(40),
                top: getProportionateScreenWidth(15),
              ),
              child: DefaultButton(
                text: "Book Now",
                
                press: () {},
              ),
            ),
          )
          
    
        ],
       )
       )
    ],
   );
  }
}