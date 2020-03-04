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
             setState(() {
               callbak(CartItem(name: widget.item.name,checked: val));
             });

          }
          ),
          trailing: IconButton(icon: Icon(Icons.delete), onPressed: null),
        ),
      ),
      
    );
  }
}
typedef OnToggleStateAction=Function(CartItem item);