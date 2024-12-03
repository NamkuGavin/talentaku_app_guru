class LaporanFormModel {
  String kegiatan;
  String hasil;
  String catatan;
  List<String> photos;

  LaporanFormModel({
    this.kegiatan = '',
    this.hasil = 'Aktif',
    this.catatan = '',
    this.photos = const [],
  });
}

class LaporanSection {
  final String title;
  final List<LaporanFormModel> forms;

  LaporanSection({
    required this.title,
    required this.forms,
  });

  static List<String> hasilOptions = ['Aktif', 'Kurang', 'Belum Aktif'];
} 