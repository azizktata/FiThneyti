import 'package:flutter/material.dart';

import '../../../models/NotificationItem.dart';

class NotificationBody extends StatelessWidget {
  final List<NotificationItem> notifications ;
  const NotificationBody({required this.notifications,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: Icon(Icons.notifications, color: Colors.orangeAccent,),
                title: Text(notifications[index].title),
                subtitle: 
                Text(notifications[index].subtitle +"\n"+
                notifications[index].time.toString().substring(0,10)),
                
                trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                 IconButton(
                 onPressed: () {
                      // TODO: Handle accept button press
                  },
                 icon: Icon(Icons.check_circle_outline),
                 color: Colors.green,
                 ),
                SizedBox(width: 8),
                IconButton(
                 onPressed: () {
                  // TODO: Handle deny button press
                 },
                 icon: Icon(Icons.cancel_outlined),
                 color: Colors.red,
                ),
              ],
                      ),
                    ),
            );
       },
      ),
     ),
    );
  }
}