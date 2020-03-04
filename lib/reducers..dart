import './redux/actions.dart';

import './model/cartitem.dart';

List<CartItem> cartItemsReducer(List<CartItem> items,dynamic action){

  if(action is AddItemAction){
    return addItem(items, action);

  }
  else if(action is ToggleStateAction){
   return toggleState(items, action);

  }

  else if(action is DeleteItemAction){
   return deleteItem(items, action);

  }
  return items;

}


List<CartItem> addItem(List<CartItem> items,AddItemAction action){

  return List.from(items)..add(action.item);

}
List<CartItem> toggleState(List<CartItem> items,ToggleStateAction action){

  List<CartItem> lsItems=items.map((item)=>item.name==action.item.name?action.item:item).toList();
  return lsItems;

}

List<CartItem> deleteItem(List<CartItem> items,DeleteItemAction action){

  return List.from(items)..remove(action.item);
}

