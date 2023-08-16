class ChartData {
  final String mounthNum;
  final num value;
  final int group;

  const ChartData(this.mounthNum, this.value, this.group);

  Map<String, dynamic> get data => {'month': mounthNum, 'value': value, 'group': group};
}
