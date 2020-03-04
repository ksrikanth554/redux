import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:reduxapp/redux/actions.dart';
import './model/cartitem.dart';

class ShoppingItem extends StatefulWidget {
  final CartItem item;
  
  ShoppingItem({Key key,this.item}):super(key:key);
  @override
  _ShoppingItemState createState() => _ShoppingItemState();
}

class _ShoppingItemState extends State<ShoppingItem> {
  bool checkValue=false;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.item.name),
      child: StoreConnector<List<CartItem>,OnToggleStateAction>(
        converter:(store)=>(item)=>store.dispatch(ToggleStateAction(item)) ,
              builder:(context,callbak) =>ListTile(
          title: Text(widget.item.name),
          leading: Checkbox(value: widget.item.checked,
           onChanged: (val){
             checkValue=val;
             setState(() {
               
               callbak(CartItem(name: widget.item.name,checked: checkValue));
             });

          }
          ),
          trailing: StoreConnector<List<CartItem>,OnItemDeleteAction>(
            
            converter: (store)=>(itemName)=>store.dispatch(DeleteItemAction(widget.item)),
            builder:(context,callback) =>IconButton(icon: Icon(Icons.delete),
             onPressed: (){
               setState(() {
                 callback(widget.item.name);
               });
             })
             ),
        ),
      ),
      
    );
  }
}
typedef OnToggleStateAction=Function(CartItem item);
typedef OnItemDeleteAction=Function(String itemName);