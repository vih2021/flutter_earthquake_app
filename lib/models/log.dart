class Log {

  String magnetude;
  String day;
  String data;

  Log({
    required this.magnetude,
    required this.day,
    required this.data,
  });

  Map<String, Object?> toMap(){
    return {
      "magnetude": magnetude,
      "day": day,
      "data": data
    };
  }

  factory Log.fromMap(Map<String, dynamic> map){
    return Log(
      magnetude: map['magnetude'],
      day: map['day'],
      data: map['data']
    );
  }

  @override
  String toString(){
    return 'Dog( magnetude: $magnetude, day: $day, data: $data )';
  }

}