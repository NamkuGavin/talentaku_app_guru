class GradeResponse {
  final List<Grade> data;

  GradeResponse({required this.data});

  factory GradeResponse.fromJson(Map<String, dynamic> json) {
    return GradeResponse(
      data: (json['data'] as List).map((e) => Grade.fromJson(e)).toList(),
    );
  }
}

class Grade {
  final int id;
  final String name;
  final String desc;
  final bool isActive;
  final Teacher teacher;
  final Level level;
  final String members;

  Grade({
    required this.id,
    required this.name,
    required this.desc,
    required this.isActive,
    required this.teacher,
    required this.level,
    required this.members,
  });

  factory Grade.fromJson(Map<String, dynamic> json) {
    return Grade(
      id: json['id'],
      name: json['name'],
      desc: json['desc'],
      isActive: json['is_active'],
      teacher: Teacher.fromJson(json['teacher']),
      level: Level.fromJson(json['level']),
      members: json['members'],
    );
  }
}

class Teacher {
  final int id;
  final String fullname;

  Teacher({
    required this.id,
    required this.fullname,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['id'],
      fullname: json['fullname'],
    );
  }
}

class Level {
  final int id;
  final String name;

  Level({
    required this.id,
    required this.name,
  });

  factory Level.fromJson(Map<String, dynamic> json) {
    return Level(
      id: json['id'],
      name: json['name'],
    );
  }
}
