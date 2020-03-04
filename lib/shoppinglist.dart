import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:reduxapp/model/cartitem.dart';
import './shoppingitem.dart';

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<CartItem>,List<CartItem>>(
      converter: (store)=>store.state,
          builder:(context,list)=> ListView.builder(
        itemCount: list.length,
        itemBuilder: (ctx,index){
          return ShoppingItem(item:list[index]);
        },
        
      ),
    );
  }
}