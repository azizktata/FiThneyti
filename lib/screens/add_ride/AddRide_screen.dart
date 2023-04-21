import 'package:flutter/material.dart';

import 'package:shop_app/screens/add_ride/Components/RowPicker.dart';
import 'package:shop_app/screens/add_ride/Components/search_position.dart';

import '../../components/default_button.dart';
import '../../constants.dart';
import '../../size_config.dart';
import '../details/components/top_rounded_container.dart';

class AddRideScreen extends StatefulWidget {
  static String routeName = "/add";
  const AddRideScreen({Key? key}) : super(key: key);

  @override
  State<AddRideScreen> createState() => _AddRideScreenState();
}

class _AddRideScreenState extends State<AddRideScreen> {
  
 String pickupLocation = "Enter your pickup location";
 String dropLocation = "Enter your drop location";
String stepLocation = "Enter your next step";

  int carSeatCount = 0;
  // define variables for date and time
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedStartTime = TimeOfDay.now();
  TimeOfDay selectedEndTime = TimeOfDay.now();

  void _onChangeValue(int c){
    setState(() {
      carSeatCount = c;
    });
  }


  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Offer Ride"),
      ),
      
      body: SingleChildScrollView(
      
      child : Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // section 1: pickup and drop location
            Container(
              
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
      
                  Text(
                    'Offer Ride',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                  Text(
                    'Hi there, where would you like to go?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16,),
                  locationField("Départ"),
                  Container(
                  height: 50.0,
                  width: 1.0,
                  color: Colors.grey,
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                  locationField("etape"),
                  Container(
                  height: 50.0,
                  width: 1.0,
                  color: Colors.grey,
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                  
                  locationField("Destination")
                  
                ],
              ),
            ),
            SizedBox(height: 16,),
            Divider(),
            // section 2: car seat count
            SizedBox(height: 16,),
      
            Container(
              padding: EdgeInsets.all(16),
              child: RowPicker(title: "Available Seats", onChangeValue: _onChangeValue)
            ),
            Divider(),

            SizedBox(height: 16,),
            Container(
           
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Schedule date & time',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
      
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () async {
                            final newDate = await showDatePicker(
                              context: context,
                              initialDate: selectedDate,
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(Duration(days: 30)),
                            );
                            if (newDate != null) {
                              setState(() {
                                selectedDate = newDate;
                              });
                            }
                          },
                        /*  style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0)),
                          ),*/
                          style: TextButton.styleFrom(
                                foregroundColor: kPrimaryColor,
                                padding: EdgeInsets.all(20),
                                shape:
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                backgroundColor: Color(0xFFF5F6F9),
                              ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                selectedDate.toString().substring(0, 10),
                                style: TextStyle(
                                  color: Colors.black54
                                ),
                              ),
                              Icon(Icons.date_range, color: Colors.orangeAccent, ),

                            ],
                          ),
                                 
                        ),
                      ),
                      
                    ],
                ),
            ],
          ),
        ),

            Divider(),
            // section 3: date and time selection
            SizedBox(height: 16,),
            Container(
           
              padding: EdgeInsets.all(12),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: hourPick("Start Time")
                    
                    ),
                    SizedBox(width: 12,),
                    Expanded(
                    child: hourPick("End Time")
                    
                    ),

                  
                  
                ],
              ),
              
              
        ),
        
          ],
        ),
      ),
      ),

      bottomNavigationBar:TopRoundedContainer(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.15,
                right: SizeConfig.screenWidth * 0.15,
                bottom: getProportionateScreenWidth(20),
               
              ),
              child: DefaultButton(
                text: "Add Ride",
                
                press: () {},
              ),
            ),
          )
);
  }


  OutlinedButton locationField(String type){
    return OutlinedButton(
                  onPressed: ()  async{
                    if(type == "Départ"){
                      final departInput = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchPosition()));
                      setState(() {
                        if(departInput!="")
                        pickupLocation = departInput;
                      });
                      }
                    else if(type == "Destination") {
                      final destInput = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchPosition()));
                     setState(() {
                      if(destInput!="")
                        dropLocation = destInput;
                      });
                    }
                    else {
                      final step = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchPosition()));
                     setState(() {
                      if(step!=null)
                        stepLocation = step;
                      });
                    }
                  

                    
                 }
                    
                  ,
                 /* style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    fixedSize: MaterialStateProperty.all<Size>(Size( type == "etape" ? 400 : double.infinity, 60.0)),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0)),
                  ),*/
                  style: TextButton.styleFrom(
          foregroundColor: kPrimaryColor,
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Color(0xFFF5F6F9),
        ),
                  child: Row(
                    children: [
                      Icon(Icons.location_on_outlined, color:type == "Départ" ? Colors.green : type == "etape" ? Colors.pink : Colors.red),
                      SizedBox(width: 16.0),
                      Text(
                        type == "Départ" ? pickupLocation : type == "etape" ? "Enter your next step" : this.dropLocation,
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                    ],
                  ),
                );


                
  }

  Container hourPick (String type){
    var mediaQuery = MediaQuery.of(context);
    return 
       Container(
         child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          type,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
             
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            
                            SizedBox(height: 16),
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () async {
                                  final newTime = await showTimePicker( context: context,
                                initialTime: selectedStartTime,
                              );
                              if (newTime != null) {
                                setState(() {
                                  type=="Start Time" ? selectedStartTime = newTime : selectedEndTime = newTime;
                                });
                              }
                                                },
                                 /* style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                
                                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0)),
                                ),*/
                                style: TextButton.styleFrom(
                                foregroundColor: kPrimaryColor,
                                padding: EdgeInsets.all(20),
                                shape:
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                backgroundColor: Color(0xFFF5F6F9),
                              ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    
                                    Text(
                                       type=="Start Time" ? selectedStartTime.format(context) : selectedEndTime.format(context),
                                      style: TextStyle(
                                        color: Colors.black54
                                      ),
                                      
                                    ),
                                     
                                    Icon(Icons.access_time,color: Colors.orangeAccent, ),
                                   
                                  ],
                                ),                 
                              ),
                            ),
                          ],
                      ),
              ],
            
           
           ),
       );
  }

}