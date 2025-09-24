import 'package:aplikasites1/model/shoeService.dart';

class shoeTreatment extends shoeService {
  String _jenisPerawatan;
  String _durasi;

  shoeTreatment({
    required super.id,
    required super.type,
    required super.deskripsi,
    required super.harga,
    required String jenisPerawatan,
    required String durasi,
  })  : _jenisPerawatan = jenisPerawatan,
        _durasi = durasi;

  // Getter & Setter
  String get jenisPerawatan => _jenisPerawatan;
  set jenisPerawatan(String value) {
    if (value.isNotEmpty) {
      _jenisPerawatan = value;
    }
  }

  String get durasi => _durasi;
  set durasi(String value) {
    if (value.isNotEmpty) {
      _durasi = value;
    }
  }

  @override
  void displayInfo() {
    super.displayInfo();
    print("Jenis Perawatan: $_jenisPerawatan, Durasi: $_durasi");
  }
}