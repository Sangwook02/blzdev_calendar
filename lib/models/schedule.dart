class Schedule {
  String name;
  double date;
  String time;
  int workspaces;
  List<int> members; // list of member primary keys
  Schedule({required this.name, required this.date, required this.time, required this.workspaces, required this.members});
}
