/// Kumpulan fungsi validasi untuk formulir.
///
/// Setiap fungsi mengembalikan pesan error (String) jika isian tidak valid,
/// atau null jika isian valid. Pola ini sama dengan yang diminta oleh
/// parameter validator pada TextFormField.
library;

/// Memeriksa isian teks wajib.
///
/// Ditolak jika kosong, hanya berisi spasi, atau lebih panjang dari
/// [maxLength] karakter. [fieldName] dipakai untuk menyusun pesan error.
String? validateRequiredText(
  String? value, {
  required String fieldName,
  int maxLength = 100,
}) {
  if (value == null || value.trim().isEmpty) {
    return "$fieldName tidak boleh kosong!";
  }
  if (value.trim().length > maxLength) {
    return "$fieldName maksimal $maxLength karakter!";
  }
  return null;
}