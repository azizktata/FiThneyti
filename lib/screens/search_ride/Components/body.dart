import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shop_app/screens/search_ride/Components/SearchCard.dart';
import 'package:shop_app/screens/search_ride/Components/SearchCardV2.dart';

class body extends StatelessWidget {
  const body({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height; 
    return Scaffold(
    
      
        body: SearchCardV2(),
      
    
    );
  }
}