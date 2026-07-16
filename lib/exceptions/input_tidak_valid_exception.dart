class InputTidakValidException implements Exception {
  final String pesan;
  InputTidakValidException(this.pesan);

  @override
  String toString() => 'Error: $pesan';
}
