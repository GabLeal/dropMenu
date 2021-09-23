class DropController<T> {
  final List<T> items;
  String _itemTextSelected = '';

  get itemTextSelected => _itemTextSelected;
  DropController({required this.items});

  void itemSelected(String value) {
    _itemTextSelected = value;
  }
}
