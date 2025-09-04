Buat aplikasi iOS sederhana menggunakan **Swift** dan **SwiftUI** (boleh UIKit jika lebih nyaman) dengan ketentuan:

1. **Mengambil data dari API publik**:  
    Endpoint:  
   `https://jsonplaceholder.typicode.com/posts`  
2. **Tugas**:  
   * Ambil daftar posts dari API.

   Mapping ke model:

     `struct Post: Identifiable, Decodable {`

       `let id: Int`

       `let title: String`

       `let body: String`

   `}`

   * Tampilkan list judul posts di halaman utama.

   * Ketika user memilih salah satu post, tampilkan detail (title & body) di halaman terpisah.

   * Pastikan loading state & error state ditangani dengan baik.

3. **Kriteria Penilaian**:

   1. **Clean Architecture** (contoh: MVVM atau pendekatan modular yang jelas)

   2. Penggunaan **async/await** atau **Combine**

   3. Penanganan error yang proper

   4. UI rapi dan responsif (mengikuti prinsip SwiftUI best practice)

   5. Kode yang mudah dibaca dan terstruktur

   6. Bonus: Unit test minimal 1 fungsi

4. **Waktu pengerjaan**: Maksimal 1 jam.

