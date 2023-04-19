import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../models/RideDetails.dart';


class RideDetailsPage extends StatelessWidget {
  final RideDetails rideDetails;
  const RideDetailsPage({Key? key, required this.rideDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
     return Scaffold(
      appBar: AppBar(backgroundColor:Color.fromARGB(255, 82, 183, 238) ,),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Container(
              height: mediaQuery.size.height / 3,
              width: mediaQuery.size.width,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 82, 183, 238),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)
                ),
              
              ),
              child: Stack(children: [
                Center(
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
                                  color: Color.fromARGB(255, 249, 248, 238)
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
                              color: Color.fromARGB(255, 249, 248, 238)
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
                                  color: Color.fromARGB(255, 249, 248, 238)
                                   ),
                                ),
                               ],
                              ),
                            Row(
                              children: [
                                SizedBox(width: 12),
                                Transform.scale(
                                  scale: 0.8,
                                  child: Icon(Icons.share_arrival_time),
                                ),
                                SizedBox(width: 7,),
                                Text(
                              rideDetails.endTime,
                              style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 249, 248, 238)
                                ),
                              ),
                              ],
                            ),
                              
                           ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      rideDetails.dayTime.toString().substring(0,10),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70
                      ),
                    ),
                    Text(
                      "Average duration : 2h 46min",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70
                      ),
                    ),
                  ],
                ),
              ),
                    ],
                  ),

                )
              ]),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                Divider(),
              Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                Text(
                  'Price: ${rideDetails.price}\$',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${rideDetails.places} seats available',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
             ),
             ),
             Divider(),
          Container(
            margin: EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  child: Text("JD")
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Driver Name',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          Text(
                            '4.5',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '(50 reviews)',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Contact Driver',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

                ],
              ),
              )
          ],
        )
        ),

      bottomNavigationBar: Container(
        height: 70,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: InkWell(
          onTap: (){},
          child: Container(
            height: 60,
            width: mediaQuery.size.width / 1.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 99, 152, 242)
            ),
            child: Center(
              child: Text(
                "Reserve",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
                )
            ),
          ),
        ),
      ),
     );
}
}




