import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:reduxapp/model/cartitem.dart';
import 'package:reduxapp/redux/actions.dart';

class AddItemDialog extends StatefulWidget {
  @override
  _AddItemDialogState createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  String itemVal;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<CartItem>,OnItemAddedCallback>(
      converter: (store)=>(itemName)=>store.dispatch(AddItemAction(CartItem(name: itemName,checked: false))),
          builder:(context,callback)=> AlertDialog(
        title: Text('Add Item'),
        contentPadding: const EdgeInsets.all(16.0),
        content: Row(
          children: <Widget>[
            Expanded(
              child:TextField(
                autocorrect: true,
                decoration: InputDecoration(
                  labelText: 'Item Name',
                  hintText: 'Eg. Iphone',
                ),
                onChanged: (val){
                  setState(() {
                    itemVal=val;
                  });
                },
              ) ,
              )
          ],
        ),
        actions: <Widget>[
          FlatButton(onPressed:()=>Navigator.pop(context), child: Text('Cancel')),
          FlatButton(onPressed:(){
              callback(itemVal);
              Navigator.pop(context);
          }, child: Text('Ok'))
        ],
      ),
    );
  }
}

typedef OnItemAddedCallback=Function(String itemName);