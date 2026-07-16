import 'dart:io';
import '../lib/models/makanan.dart';
import '../lib/models/minuman.dart';
import '../lib/controllers/kasir_manager.dart';
import '../lib/exceptions/input_tidak_valid_exception.dart';

void main() async {
  final kasir = KasirManager();
  bool isRunning = true;

  while (isRunning) {
    print('\n===== SISTEM KASIR CAFE =====');
    print('1. Tambah Pesanan');
    print('2. Lihat Pesanan & Total Bayar');
    print('3. Cari Pesanan');
    print('4. Simpan Transaksi');
    print('5. Keluar');
    stdout.write('Pilih menu (1-5): ');

    var pilihan = stdin.readLineSync();

    try {
      switch (pilihan) {
        case '1':
          print('\n--- DAFTAR MENU CAFE ---');
          print('1. Nasi Goreng    (Makanan) : Rp 20000');
          print('2. Mie Tek-Tek    (Makanan) : Rp 15000');
          print('3. Kentang Goreng (Makanan) : Rp 12000');
          print('4. Kopi Susu      (Minuman) : Rp 18000');
          print('5. Es Teh         (Minuman) : Rp 5000');
          print('6. Matcha Latte   (Minuman) : Rp 22000');
          print('------------------------');

          stdout.write('Pilih nomor menu (1-6): ');
          var nomorMenu = stdin.readLineSync();

          String nama = '';
          double harga = 0.0;
          bool isMakanan = true;

          // Menentukan nama, harga, dan jenis secara otomatis berdasarkan nomor
          switch (nomorMenu) {
            case '1':
              nama = 'Nasi Goreng';
              harga = 20000;
              isMakanan = true;
              break;
            case '2':
              nama = 'Mie Tek-Tek';
              harga = 15000;
              isMakanan = true;
              break;
            case '3':
              nama = 'Kentang Goreng';
              harga = 12000;
              isMakanan = true;
              break;
            case '4':
              nama = 'Kopi Susu';
              harga = 18000;
              isMakanan = false;
              break;
            case '5':
              nama = 'Es Teh';
              harga = 5000;
              isMakanan = false;
              break;
            case '6':
              nama = 'Matcha Latte';
              harga = 22000;
              isMakanan = false;
              break;
            default:
              print('\n❌ Nomor menu tidak valid! Batal menambahkan pesanan.');
              continue; // Langsung kembali ke perulangan menu utama awal
          }

          // Meminta detail tambahan (Level Pedas atau Ukuran)
          if (isMakanan) {
            stdout.write('Level pedas (Tidak Pedas/Sedang/Pedas): ');
            var pedas = stdin.readLineSync() ?? '-';
            kasir.tambahPesanan(Makanan(nama, harga, pedas));
          } else {
            stdout.write('Ukuran (Small/Medium/Large): ');
            var ukuran = stdin.readLineSync() ?? '-';
            kasir.tambahPesanan(Minuman(nama, harga, ukuran));
          }
          break;

        case '2':
          kasir.tampilkanPesananDanTotal();
          break;

        case '3':
          stdout.write('Masukkan nama pesanan yang dicari: ');
          var keyword = stdin.readLineSync() ?? '';
          kasir.cariPesanan(keyword);
          break;

        case '4':
          await kasir.simpanTransaksi();
          break;

        case '5':
          print('\nTerima kasih telah menggunakan sistem ini. Sampai jumpa!');
          isRunning = false;
          break;

        default:
          print('\n❌ Menu tidak tersedia. Silakan pilih 1-5.');
      }
    } on InputTidakValidException catch (e) {
      print('\n$e');
    } catch (e) {
      print('\n⚠️ Terjadi kesalahan pada sistem: $e');
    }
  }
}
