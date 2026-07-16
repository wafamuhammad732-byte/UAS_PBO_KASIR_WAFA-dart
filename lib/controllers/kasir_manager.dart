import '../models/produk.dart';

class KasirManager {
  // Collection
  final List<Produk> _pesanan = [];

  void tambahPesanan(Produk produk) {
    _pesanan.add(produk);
    print('\n✅ "${produk.nama}" berhasil ditambahkan ke pesanan!');
  }

  void tampilkanPesananDanTotal() {
    if (_pesanan.isEmpty) {
      print('\n⚠️ Belum ada pesanan.');
      return;
    }

    print('\n=== DAFTAR PESANAN ===');
    for (var item in _pesanan) {
      item.tampilkanInfo();
      print('----------------------');
    }

    // Higher Order Function (.fold)
    double total = _pesanan.fold(0, (sum, item) => sum + item.harga);
    print('💰 TOTAL BAYAR: Rp$total');
    print('======================');
  }

  void cariPesanan(String keyword) {
    // Higher Order Function (.where)
    var hasil = _pesanan
        .where((p) => p.nama.toLowerCase().contains(keyword.toLowerCase()))
        .toList();

    if (hasil.isEmpty) {
      print('\n❌ Pesanan tidak ditemukan.');
    } else {
      print('\n=== HASIL PENCARIAN ===');
      for (var item in hasil) {
        item.tampilkanInfo();
      }
    }
  }

  // Async/Await
  Future<void> simpanTransaksi() async {
    print('\n⏳ Memproses dan menyimpan transaksi...');
    await Future.delayed(Duration(seconds: 2));
    print('✅ Data transaksi berhasil disimpan di sistem!');
  }
}
