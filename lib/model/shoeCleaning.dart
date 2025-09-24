import 'package:aplikasites1/model/shoeService.dart';

class shoeCleaning extends shoeService {
  final List<String> _jenisKain;
  String _warnaKain;

  List<String> get jenisKain => _jenisKain;

  shoeCleaning({
    required super.id,
    required super.type,
    required super.deskripsi,
    required super.harga,
    required List<String> jenisKain,
    required String warnaKain,
  })  : _jenisKain = jenisKain,
        _warnaKain = warnaKain;



  String get warnaKain => _warnaKain;
  set warnaKain(String value) {
    _warnaKain = value;
  }

  void bersihkan() {
    print("Layanan pembersihan untuk kain $_jenisKain dengan warna $_warnaKain");
  }

 @override
  void displayInfo() {
    super.displayInfo();
    print("Jenis Kain: ${jenisKain.join(', ')}");
    print("Warna: $warnaKain");
}
}