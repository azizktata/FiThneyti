import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shop_app/screens/search_ride/Components/SearchCard.dart';
import 'package:shop_app/screens/search_ride/Components/body.dart';

import '../../components/coustom_bottom_nav_bar.dart';
import '../../enums.dart';

class SearchScreen extends StatelessWidget {
  static String routeName = "/search";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
         body(),
       
      
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.search),
    );
  }
}