class shoeService {
  int _id;
  String _type;
  String _deskripsi;
  int _harga;

  shoeService({
    required int id,
    required String type,
    required String deskripsi,
    required int harga,
  })  : _id = id,
        _type = type,
        _deskripsi = deskripsi,
        _harga = harga;

  // Getter
  int get id => _id;
  String get type => _type;
  String get deskripsi => _deskripsi;
  int get harga => _harga;

  // Setter (bisa tambahkan validasi)
  set id(int value) {
    if (value > 0) {
      _id = value;
    }
  }

  set nama(String value) {
    if (value.isNotEmpty) {
      _type = value;
    }
  }

  set deskripsi(String value) {
    if (value.isNotEmpty) {
      _deskripsi = value;
    }
  }

  set harga(int value) {
    if (value > 0) {
      _harga = value;
    }
  }

  // method yang bisa dioverride
  void displayInfo() {
    print("ID: $_id, Nama: $_type, Deskripsi: $_deskripsi, Harga: $_harga");
  }
}
