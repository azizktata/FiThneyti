


import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/search_ride/Components/InputSearch.dart';
import 'package:shop_app/screens/search_ride/rides_screen.dart';




class InfoCard extends StatefulWidget {
  final String title;
  final String body;
  
  
  final String subInfoTitle;
  final String subInfoText;
  

  const InfoCard(
      {required this.title,
      
      this.body =
          """Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudi conseqr!""",
      
      
      this.subInfoText = "545 miles",
      this.subInfoTitle = "Directions",
      Key? key})
      : super(key: key);

    

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
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
      'TimeOfDay':selectedTime
    };

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RidesScreen(data: data)),
    );
  }
  @override
  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height; 
    return Container(
          height: (50*h/100),
        
          margin: const EdgeInsets.symmetric(horizontal: 20.0,),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 239, 242, 244),
            borderRadius: BorderRadius.circular(10.0),
            ),
          child : Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
              Row(
                children: [
                  Align(
              alignment: Alignment.centerLeft,
              child: InputField("Départ"),
              ),
                ],
              ),
             
             Row(
                children: [
                  Align(
              alignment: Alignment.centerLeft,
              child: InputField("Dest"),
              ),
                ],
              ),
         
            
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
                          fixedSize: MaterialStateProperty.all<Size>(Size(w/3.5, 60.0)),
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
               
              Row(
                children: [
                  Expanded(
                child: TextButton(onPressed: (){
                  _goToNextPage(context);
                 /* Navigator.push(context,
                  MaterialPageRoute(
                  builder: (context) {
                    return RideSearch(depart: depart, destination: destination, dateTime: _dateTime);
                  },
                ),
              );*/
                },
               child: const Text('Rechercher'),
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                    backgroundColor: Colors.blueAccent,
                    
                  ),
               ),
                 )
                ],
              )  
          ],
          )
          


      
          /*child: Column(
            children: [
          TextFormField(
            controller: inputController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            onSaved: (email) {},
            decoration: InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(2),
                child: Icon(Icons.circle),
                
              ),
            ),
          ),
          ],
      ),*/
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


