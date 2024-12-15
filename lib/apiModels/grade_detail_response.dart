class GradeDetailResponse {
  final GradeDetail data;

  GradeDetailResponse({required this.data});

  factory GradeDetailResponse.fromJson(Map<String, dynamic> json) {
    return GradeDetailResponse(
      data: GradeDetail.fromJson(json['data']),
    );
  }
}

class GradeDetail {
  final int id;
  final String name;
  final String desc;
  final String isActive;
  final String teacher;
  final Level level;
  final List<Member> members;

  GradeDetail({
    required this.id,
    required this.name,
    required this.desc,
    required this.isActive,
    required this.teacher,
    required this.level,
    required this.members,
  });

  factory GradeDetail.fromJson(Map<String, dynamic> json) {
    return GradeDetail(
      id: json['id'],
      name: json['name'],
      desc: json['desc'],
      isActive: json['is_active'],
      teacher: json['teacher'],
      level: Level.fromJson(json['level']),
      members: (json['members'] as List)
          .map((member) => Member.fromJson(member))
          .toList(),
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

class Member {
  final int id;
  final String status;
  final String username;
  final String fullname;
  final String nomorInduk;
  final String address;
  final String? photo;
  final String birthInformation;
  final List<String> roles;
  final List<String> grades;

  Member({
    required this.id,
    required this.status,
    required this.username,
    required this.fullname,
    required this.nomorInduk,
    required this.address,
    this.photo,
    required this.birthInformation,
    required this.roles,
    required this.grades,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['id'],
      status: json['status'],
      username: json['username'],
      fullname: json['fullname'],
      nomorInduk: json['nomor_induk'],
      address: json['address'],
      photo: json['photo'],
      birthInformation: json['birth_information'],
      roles: List<String>.from(json['roles']),
      grades: List<String>.from(json['grades']),
    );
  }
}
