List<String> getTabbarMonth() {
  List<String> months = [];
  List<int> stock = [];
  String nw = DateTime.now().toString();
  String tmp = nw.substring(0, 4) + nw.substring(5, 7);
  int postMonth = int.parse(tmp) - 1;

  for (var i = 0; i < 3; i++) {
    postMonth -= 1;
    if (postMonth % 100 == 0) {
      postMonth -= 88;
    }
    stock.add(postMonth);
  }

  for (var i = 2; i >= 0; i--) {
    String year = (stock[i] / 100).floor().toString();
    String month = (stock[i] % 100).toString();
    months.add("$year $month月");
  }

  return months;
}
