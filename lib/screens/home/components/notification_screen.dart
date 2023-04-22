import 'package:flutter/material.dart';

import '../../../models/NotificationItem.dart';
import 'notification_body.dart';

class NotificationScreen extends StatelessWidget {
  
   static String routeName = "/notifications";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: NotificationBody(notifications: notifications),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          
          Text(
            "Your Notifications",
            style: TextStyle(color: Colors.black),
          ),
          
        ],
      ),
    );
  }

  final List<NotificationItem> notifications = [
  NotificationItem(
    title: 'New Message',
    subtitle: 'You have a new message from John',
    time: DateTime.now(),
  ),
  NotificationItem(
    title: 'New Friend Request',
    subtitle: 'You have a new friend request from Sarah',
    time: DateTime.now(),
  ),
  NotificationItem(
    title: 'New Event Invitation',
    subtitle: 'You have been invited to a party on Saturday',
    time: DateTime.now(),
  ),
];
}