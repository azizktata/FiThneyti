import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shop_app/screens/search_ride/Components/InputSearch.dart';
import 'package:shop_app/screens/search_ride/rides_screen.dart';

class SearchCardV2 extends StatefulWidget {
  const SearchCardV2({Key? key}) : super(key: key);

  @override
  State<SearchCardV2> createState() => _SearchCardV2State();
}

class _SearchCardV2State extends State<SearchCardV2> {
  List<Map<String, dynamic>> searchHistoryList = [];

   Map<int, String> weekdayName = {1: "Monday", 2: "Tuesday", 3: "Wednesday", 4: "Thursday", 5: "Friday", 6: "Saturday", 7: "Sunday"};
  Map<int, String> monthName = {1: "jan", 2: "fev", 3: "mars", 4: "avr", 5: "may", 6: "juin", 7: "juillet", 8:"aout", 9:"sept", 10:"oct", 11:"nov", 12:"dec"};

  TextEditingController depart = TextEditingController();
  TextEditingController destination = TextEditingController();

    TimeOfDay selectedTime = TimeOfDay.now();


  String departInput = 'Départ';
  String destInput = "Destination";
  DateTime _dateTime = DateTime(0);
  void _showDatePicker(){
      showDatePicker(
        context: this.context,
       initialDate: DateTime.now(),
        firstDate: DateTime(2023),
         lastDate: DateTime(2024)
         ).then((value) => 
          setState((){
            _dateTime = value!;
          })
         );
    }

    void _goToNextPage(BuildContext context) {
    Map<String, dynamic> data = {
      'departInput': departInput,
      'destInput': destInput,
      'Day':weekdayName[_dateTime.weekday],
      'DayN':_dateTime.day,
      'Month':monthName[_dateTime.month],
      'TimeOfDay':"${selectedTime.hour}"+":"+"${selectedTime.minute}"
    };

    setState(() {
      searchHistoryList.add(data);
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RidesScreen(data: data)),
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // background image
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height * 0.5,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/splash_2.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // search card
          Positioned(
            top: MediaQuery.of(context).size.height * 0.30,
            left: 48,
            right: 48,
            child: Container(
              
              height: MediaQuery.of(context).size.height * 0.37,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // first button
                 InputField("Départ"),
                  // second button
                  InputField("Destination"),
                  // third button
                  Row(
                   children: [
                    datePicker(),
                    Container(
                     decoration: BoxDecoration(
                     border: Border(
                     left: BorderSide(
                     color: Colors.grey,
                     width: 1.0,
                     ),
                    ),
                  ),
                    child: OutlinedButton(
                        onPressed: () async {
                          final newTime = await showTimePicker( context: context,
                        initialTime: selectedTime,
                      );
                      if (newTime != null) {
                        setState(() {
                          selectedTime = newTime;
                        });
                      }
                      },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0)),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.access_time, ),
                            SizedBox(width: 16.0),
                            Text(
                              selectedTime.format(context)
                            ),
                          ],
                        ),  
                      ),
                   ),
                ],
               ),
                  // search button and search history
                 
                  Expanded(
                    
                  child: ElevatedButton(
                  onPressed: () {
                    // Add the search to the history when the button is pressed
                    _goToNextPage(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    'Search',
                    style: TextStyle(fontSize: 18,),
                    
                  ),
                 
                  
                ),
              ),
                  
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.7,
            left: 20,
            right: 20,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                
              ),
              child: ListView.builder(
                itemCount: searchHistoryList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: (){
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RidesScreen(data: searchHistoryList[index])),
                    );
                    },
                    leading: Icon(Icons.access_time),
                    title: Text(searchHistoryList[index]['departInput'], style: TextStyle(fontWeight: FontWeight.normal),),
                    subtitle: Text(searchHistoryList[index]['destInput']),
                    trailing: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        searchHistoryList[index]['Day'] + ', ' 
                      + searchHistoryList[index]['DayN'].toString() + ' ' 
                      + searchHistoryList[index]['Month'] + ' at ' 
                      + searchHistoryList[index]['TimeOfDay']),
                    )
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container InputField( String type, ){
    double w = MediaQuery.of(context).size.width;
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 55.0, vertical: 15.0),
      padding:const EdgeInsets.symmetric(vertical: 15.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black87,
            width: 1.0
          ),
          
        )
      ),
      child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               SizedBox(
                width: (60*w/100),
                child : TextButton.icon(
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(type == "Départ" ? this.departInput : this.destInput),
                  ],
                ),
                 icon: Icon(Icons.circle),
                 onPressed: () async{
                    if(type == "Départ"){
                      final departInput = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InputDepart()));
                      setState(() {
                        if(departInput!=null)
                        this.departInput = departInput;
                      });
                      }
                    else {
                      final destInput = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InputDepart()));
                     setState(() {
                      if(destInput!=null)
                        this.destInput = destInput;
                      });
                    }
                    
                 },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black38
                ),
                ),
              
              ),
              
            ],
          ),
    );
    
  }
  
  Container datePicker(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            icon: Icon( // <-- Icon
             Icons.calendar_month,
             color: Colors.black38,
             size: 24.0,
            ),
            onPressed: _showDatePicker,
            
            label: _dateTime.year!=0 
            ? Text('${weekdayName[_dateTime.weekday]}.${_dateTime.day.toString()}.${monthName[_dateTime.month]}'
              ,style: TextStyle(color: Color.fromARGB(255, 97, 94, 94),fontSize: 20),)
            : Text("Choose Date",
               style: TextStyle(color: Color.fromARGB(255, 85, 84, 84),fontSize: 20),),  

            
            ),
            
          
        ],
      ),
    );
  }
}