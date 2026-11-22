/// Kumpulan fungsi validasi untuk formulir.
///
/// Setiap fungsi mengembalikan pesan error (String) jika isian tidak valid,
/// atau `null` jika isian valid. Pola ini sama dengan yang diminta oleh
/// parameter `validator` pada `TextFormField`.
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

/// Memeriksa bahwa sebuah tanggal sudah dipilih.
String? validateRequiredDate(DateTime? date, {required String fieldName}) {
  if (date == null) {
    return "$fieldName harus dipilih!";
  }
  return null;
}

/// Memeriksa tanggal selesai.
///
/// Tanggal selesai wajib dipilih dan tidak boleh lebih awal dari
/// tanggal mulai ([start]).
String? validateEndDate({required DateTime? start, required DateTime? end}) {
  if (end == null) {
    return "Tanggal selesai harus dipilih!";
  }
  if (start != null && end.isBefore(start)) {
    return "Tanggal selesai tidak boleh sebelum tanggal mulai!";
  }
  return null;
}