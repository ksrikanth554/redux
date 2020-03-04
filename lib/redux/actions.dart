import '../model/cartitem.dart';

class AddItemAction{
final CartItem item;
AddItemAction(this.item);

}
class ToggleStateAction{

  final CartItem item;
  ToggleStateAction(this.item);

}

class DeleteItemAction {

  final CartItem item;

  DeleteItemAction(this.item);
  
}
