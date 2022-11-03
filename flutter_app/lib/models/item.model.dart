class Item {
  final String item_name;
  final double ideal_consumption;
  final double live_consumption;
  final bool status;

  Item({
    required this.item_name,
    required this.ideal_consumption,
    required this.live_consumption,
    required this.status,
  });
}
