import 'package:flutter/material.dart';
import 'package:shop_app/screens/search_ride/Components/filterInput.dart';
import 'package:shop_app/screens/search_ride/RideDetailsPage.dart';
import 'package:shop_app/screens/search_ride/RideDetailsPageV2.dart';


import '../../constants.dart';
import '../../models/RideDetails.dart';
import '../../size_config.dart';

class RidesScreen extends StatefulWidget {
  final Map<String, dynamic> data;
  
  const RidesScreen({Key? key,required this.data}) : super(key: key);

  @override
  State<RidesScreen> createState() => _RidesScreenState();
}

class _RidesScreenState extends State<RidesScreen> {
  List<RideDetails> _filteredData = [];

  List<RideDetails> filteredList1 = [];

  List<RideDetails> rideDetailsList = [
  RideDetails(
    user: "John Doe",
    rating: 4.5,
    departurePoint: "New York City",
    destinationPoint: "Los Angeles",
    startTime: '10:00 AM',
    endTime: "3:00 PM",
    dayTime: DateTime.now(),
    price: 50.0,
    places:2
  ),
  RideDetails(
    user: "Jane Smith",
    rating: 4.8,
    departurePoint: "San Francisco",
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
  void initState() {
    super.initState();
    _filteredData.addAll(rideDetailsList);
    
    List<RideDetails> filteredList = [];
    filteredList.addAll(rideDetailsList);
    if (widget.data['departInput']!='') {
      
      filteredList.retainWhere((item) => 
      item.dayTime.day == widget.data['DayN'] && monthName[item.dayTime.month] == widget.data['Month']
      &&
      item.departurePoint == widget.data['departInput']
           ||
      item.destinationPoint.toLowerCase() == widget.data['destInput'].toLowerCase()
      
      
      
      );

    }
    /*if(filterData['startTime']!=""){
      filteredList.retainWhere((item) => 
      item.startTime == filterData['startTime'] 
      );
    }*/
    setState(() {
      _filteredData.clear();
      _filteredData.addAll(filteredList);
      filteredList1.addAll(filteredList);
    });
  }

  void applyFilters(Map<String, dynamic> filterData) {
    // filter the list of rides based on the selected options
     List<RideDetails> filteredList2 = [];
     filteredList2.addAll(_filteredData);
     if(filterData['startTime'] == ''){
      setState(() {
        _filteredData.clear();
        _filteredData.addAll(filteredList1);
      });
     }
     else{
      filteredList2.retainWhere((item) => 
      item.startTime == filterData['startTime'] 
      );
    setState(() {
       _filteredData.clear();
      _filteredData.addAll(filteredList2);
    });
     }
     
     
  }

  void _openFilterPage(Map<String, dynamic> filterData) async {
    // navigate to Page 2 to select filter options
    final selectedOptions = await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(builder: (context) => filterInput( filterData:filterData)),
    );

    if (selectedOptions != null) {
      // apply the selected filters to the list of rides
     
      applyFilters(selectedOptions);
      
    }
    
  }

  Map<String, dynamic> filterData = {
    'option':'',
    'startTime':''
  };

    Map<int, String> weekdayName = {1: "Monday", 2: "Tuesday", 3: "Wednesday", 4: "Thursday", 5: "Friday", 6: "Saturday", 7: "Sunday"};

  Map<int, String> monthName = {1: "jan", 2: "fev", 3: "mars", 4: "avr", 5: "may", 6: "juin", 7: "juillet", 8:"aout", 9:"sept", 10:"oct", 11:"nov", 12:"dec"};

  @override
  Widget build(BuildContext context) {

    String departInput = widget.data['departInput'];
    String destInput = widget.data['destInput'];
    String day = widget.data['Day'];
    int dayN = widget.data['DayN'];
    String month = widget.data['Month'];
    return Scaffold(
      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
           width: double.infinity,
           margin: EdgeInsets.all(getProportionateScreenWidth(20)),
           padding: EdgeInsets.symmetric(
           horizontal: getProportionateScreenWidth(20),
           vertical: getProportionateScreenWidth(15),
        ),
            decoration: BoxDecoration(
            color: Color(0xFF4A3298),
            borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
         IconButton(
          icon: Icon(Icons.arrow_back_ios),
         color: Colors.white,
         onPressed: () {
           Navigator.pop(context);
         }),
         Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
            'Departure: $departInput',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            'Destination: $destInput',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(day+" " +dayN.toString()+ " "+ month),
          Text(filterData['startTime']!= null ? filterData['startTime']: "")
          
        ],
      ),
      IconButton(
          icon: Icon(Icons.filter_alt_outlined),
         color: Colors.white,
         onPressed: () async=>_openFilterPage(filterData)
         /* final Map<String, dynamic> filterData = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => filterInput())
            );
            setState(() {
              if(filterData != null)
              this.filterData = filterData;
            });*/
         ),
    ],
  ),
),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredData.length,
              itemBuilder: (BuildContext context, int index) {
                return cardv1(index, _filteredData,context);
              },
            ),
          ),
        ],
      ),
    );
   
  }
}



Widget cardv1 (int index, List<RideDetails> rideDetailsList, BuildContext context ){
  Map<int, String> monthName = {1: "jan", 2: "fev", 3: "mars", 4: "avr", 5: "may", 6: "juin", 7: "juillet", 8:"aout", 9:"sept", 10:"oct", 11:"nov", 12:"dec"};
 RideDetails ride = RideDetails(
  user: rideDetailsList[index].user,
  rating: rideDetailsList[index].rating,
  departurePoint: rideDetailsList[index].departurePoint,
  destinationPoint: rideDetailsList[index].destinationPoint,
  startTime: rideDetailsList[index].startTime,
  endTime: rideDetailsList[index].endTime,
  dayTime: rideDetailsList[index].dayTime,
  price: rideDetailsList[index].price,
  places: rideDetailsList[index].places
  );
  return GestureDetector(
    onTap: () {
      Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RideDetailsPageV2(rideDetails: ride),
      ),
    );
    },
  child : Container(
     decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
    
   margin: EdgeInsets.symmetric(horizontal: 35, vertical: 5),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            child: Text("JD"),
          ),
          title: Text(
            ride.user.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.amber,
                size: 16,
              ),
              SizedBox(width: 5),
              Text(
                ride.rating.toString(),
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          trailing: Text(
            ride.price.toString(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ride.departurePoint.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    ride.startTime.toString()
                    +" "
                    +ride.dayTime.day.toString()
                    + " " 
                    +monthName[ride.dayTime.month].toString(),
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Transform.scale(
              scale: 1.2,
              child: Icon(Icons.arrow_forward, color: Colors.grey),
            ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    ride.destinationPoint.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    ride.endTime.toString(),
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: 1,
          width: double.infinity,
          color: Colors.grey[300],
        ),
      ],
      ),
    ),
),
);
}
  
