import 'package:flutter/material.dart';
import 'package:redux/src/store.dart';
import 'package:reduxapp/additemdialog.dart';
import 'package:reduxapp/model/cartitem.dart';
import './shoppinglist.dart';

class ShoppingCart extends StatelessWidget {
  final Store<List<CartItem>> store;
  ShoppingCart({Key key,this.store}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ShoppingList(),
      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.add),
        onPressed: ()=>_openAddItemDialog(context),
              ),
        
            );
          }
        
  _openAddItemDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context)=>AddItemDialog(),
    
    );
  }
}