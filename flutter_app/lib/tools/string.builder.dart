String stringBuilder(List items) {
  if (items.isEmpty) {
    return "No items yet";
  }
  String itemsString = "";
  for (var i = 0; i < items.length; i++) {
    itemsString = itemsString + items[i]["name"] + ", ";
  }
  return itemsString;
}
