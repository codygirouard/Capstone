class Medicine {
  final String scheduleID;
  final String medicineID;
  final String name;
  final String dosage;
  final DateTime time;
  final int repeat;
  final bool completed;

  Medicine({this.scheduleID, this.medicineID, this.name, this.dosage, this.time, this.repeat, this.completed});

  factory Medicine.fromJson(Map<String, dynamic> json){
    return Medicine(
      scheduleID: json['scheduleID'],
      medicineID: json['medicineID'],
      name: json['name'],
      dosage: json['dosage'],
      time: json['time'],
      repeat: json['repeat'],
      completed: json['completed'],
    );
  }
}