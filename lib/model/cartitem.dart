import 'package:flutter/cupertino.dart';

class CartItem{

String name;
bool checked;
CartItem({@required this.name,@required this.checked});
@override
  String toString() {
    // TODO: implement toString
    return '$name:$checked';
    
  }

}