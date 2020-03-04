import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:reduxapp/reducers..dart';
import './model/cartitem.dart';
import './shoppingcart.dart';


void main(){

  final Store<List<CartItem>> store=Store<List<CartItem>>(cartItemsReducer,initialState: List());

  runApp(ShoppingApp(store:store));
  }
  
  class ShoppingApp extends StatelessWidget {
  final Store<List<CartItem>> store;
  ShoppingApp({Key key,this.store}):super(key:key);


    @override
    Widget build(BuildContext context){
      return StoreProvider(
        store:store,
          child: MaterialApp(
          theme: ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          home: ShoppingCart(store:store),

        ),
      );
    }
}