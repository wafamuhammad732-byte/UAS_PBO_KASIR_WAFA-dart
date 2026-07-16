import 'produk.dart';

class Minuman extends Produk {
  String ukuran;

  Minuman(String nama, double harga, this.ukuran) : super(nama, harga);

  @override
  void tampilkanInfo() {
    print('🍹 Minuman : $nama\n   Harga   : Rp$harga\n   Ukuran  : $ukuran');
  }
}
