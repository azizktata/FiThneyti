import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/models/Reservation.dart';
import 'package:shop_app/models/RideDetails.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class RideCard extends StatefulWidget {
  final String title;
  final List<RideDetails>? rides;
  final List<Reservation>? reservations;
  final bool? isRide;
  const RideCard({
    Key? key,
    required this.title,
     this.rides,
     this.reservations,
     this.isRide = true
    
  }) : super(key: key);

  @override
  State<RideCard> createState() => _RideCardState();
}

class _RideCardState extends State<RideCard> {
  double rating =0;
  


  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: widget.title,
            press: () {},
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                
               widget.isRide! ? widget.rides!.length : widget.reservations!.length,
                (index){
                  return 
                  SpecialRideCard(
                    departurePoint: widget.isRide! ? widget.rides![index].departurePoint : widget.reservations![index].departurePoint,
                    destinationPoint: widget.isRide! ? widget.rides![index].destinationPoint : widget.reservations![index].destinationPoint,
                    dayTime:widget.isRide! ? widget.rides![index].dayTime : widget.reservations![index].dayTime,
                    startTime: widget.isRide! ? widget.rides![index].startTime : widget.reservations![index].startTime,
                    status:!widget.isRide! ? widget.reservations![index].status : ReservationState.Pending,
                    press: () {
                      if(!widget.isRide!){
                        widget.reservations![index].status == ReservationState.Completed 
                        ? _showRatingDialog(context)
                        :_showBottomSheetForReservation(context);
                      } 
                      else{
                        _showBottomSheetForReservation(context);
                      }
                      
                      
                    } 

                  
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
void _showBottomSheetForReservation(BuildContext context){
    showModalBottomSheet(context: context, builder: (context){
     
      return Container(
        height: MediaQuery.of(context).size.height * 0.31,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 6,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 22,),

            

            _bottomSheetButton(
              label: "Ride completed",  
              press: (){
                _showRatingDialog(context);
              },
              context: context
                // show review 
                
            ),
              
               _bottomSheetButton(
              label: "Delete Reservation",              
              press: (){},
              context: context,
              isDelete: true
              ),
              _bottomSheetButton(
              label: "Close",
              press: (){},
              context: context,
              isClose: true

              ),
            
          ],
        ),
      );
    });
    
  }
 Container  _bottomSheetButton({
      required String label,

      required Function? press,
      required BuildContext context,
      bool isClose = false,
      bool isDelete = false
    }){
       return !isClose ? Container(
        
       width: MediaQuery.of(context).size.width/1.2,
       
        child: Expanded(
          
          child: ElevatedButton(
            onPressed:()=>press,
            style: ElevatedButton.styleFrom(
                backgroundColor:isDelete ? Colors.red : Colors.blue,
                foregroundColor:  Colors.white,
                shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(label),
            ),
            )
          ),

      ):Container(
         width: MediaQuery.of(context).size.width/1.2,
         margin: EdgeInsets.only(top: 25),
         
        child: Expanded(
          
          child: ElevatedButton(
            onPressed:(){},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white ,
                foregroundColor:  Colors.black,
                shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(15.0),
                   side: BorderSide(color: Colors.grey)
                ),
              ),
              
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(label),
            ),
            )
          ),
      );
    }

     void _showRatingDialog(BuildContext context ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        double _rating =0;
        return AlertDialog(
          title: Text('Add Rating'),
          content: RatingBar.builder(
            initialRating: _rating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              
                _rating = rating;
           
            },
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  child: Text('Submit'),
                  onPressed: () {
                    // TODO: save rating to database or perform other action
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

class SpecialRideCard extends StatelessWidget {
  const SpecialRideCard({
    Key? key,
    required this.departurePoint,
    required this.destinationPoint,
    required this.startTime,
    required this.dayTime,
    required this.press,
    this.status
  }) : super(key: key);

  final String departurePoint;
  final String destinationPoint;
  final String startTime;
  final DateTime dayTime;
  final GestureTapCallback press;
  final ReservationState? status;

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
                          text: "${dayTime.toString().substring(0,10)}, $startTime\n",
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
                    Icons.circle_rounded,
                    color: status== ReservationState.Completed 
                    ? Colors.green
                    
                    : Colors.white,
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
