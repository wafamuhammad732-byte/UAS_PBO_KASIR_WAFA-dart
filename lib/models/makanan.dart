import 'produk.dart';

class Makanan extends Produk {
  String tingkatPedas;

  Makanan(String nama, double harga, this.tingkatPedas) : super(nama, harga);

  @override
  void tampilkanInfo() {
    print(
      '🍲 Makanan : $nama\n   Harga   : Rp$harga\n   Level   : $tingkatPedas',
    );
  }
}
