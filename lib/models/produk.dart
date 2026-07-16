import '../exceptions/input_tidak_valid_exception.dart';

abstract class Produk {
  String _nama = '';
  double _harga = 0.0;

  // Constructor memanggil setter agar validasi otomatis berjalan
  Produk(String nama, double harga) {
    this.nama = nama;
    this.harga = harga;
  }

  // Getter
  String get nama => _nama;
  double get harga => _harga;

  // Setter dengan validasi
  set nama(String value) {
    if (value.trim().isEmpty) {
      throw InputTidakValidException('Nama produk tidak boleh kosong!');
    }
    _nama = value;
  }

  set harga(double value) {
    if (value < 0) {
      throw InputTidakValidException(
        'Harga produk tidak boleh kurang dari nol!',
      );
    }
    _harga = value;
  }

  // Method untuk di-override (Polymorphism)
  void tampilkanInfo();
}
