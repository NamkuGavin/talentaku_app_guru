class DetailLaporanEvent {
  final String title;
  final String semester;
  final String date;
  final List<LaporanSection> sections;

  DetailLaporanEvent({
    required this.title,
    required this.semester,
    required this.date,
    required this.sections,
  });
}

class LaporanSection {
  final String title;
  final String content;
  final bool isExpanded;
  final String status;

  const LaporanSection({
    required this.title,
    required this.content,
    this.isExpanded = false,
    this.status = 'Muncul',  // Set default value
  });

  // Add copyWith method for easier state updates
  LaporanSection copyWith({
    String? title,
    String? content,
    bool? isExpanded,
    String? status,
  }) {
    return LaporanSection(
      title: title ?? this.title,
      content: content ?? this.content,
      isExpanded: isExpanded ?? this.isExpanded,
      status: status ?? this.status,
    );
  }
}