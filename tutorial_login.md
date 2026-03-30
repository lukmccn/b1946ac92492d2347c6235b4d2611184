# Panduan Belajar Pseudocode dan Flowchart: Sistem Login Sederhana

Selamat datang di panduan belajar algoritma! Di sini kita akan mempelajari dua cara utama untuk merancang logika program sebelum menulis kode sungguhan: **Pseudocode** dan **Flowchart**.

## 1. Teori Dasar

### A. Apa itu Pseudocode?
Pseudocode adalah cara penulisan logika pemrograman yang menggunakan bahasa manusia (biasanya bahasa Inggris terstruktur) agar mudah dibaca, tetapi dengan struktur yang mirip kode pemrograman. Programmer senior menyukai pseudocode karena ini membantu memfokuskan pikiran pada *alur logika* tanpa harus pusing memikirkan aturan tanda baca (sintaks) bahasa pemrograman tertentu.

**Notasi Umum Pseudocode:**
*   `DECLARE` atau `SET`: Untuk membuat atau mengatur nilai awal suatu variabel.
*   `INPUT` atau `READ`: Untuk menerima data dari pengguna.
*   `PRINT` atau `OUTPUT`: Untuk menampilkan teks atau hasil ke layar.
*   `IF ... THEN ... ELSE`: Untuk percabangan atau pengambilan keputusan.
*   `WHILE ... DO` atau `FOR`: Untuk perulangan (melakukan sesuatu berkali-kali).

### B. Apa itu Flowchart?
Flowchart adalah diagram alir yang memvisualisasikan langkah-langkah logika program menggunakan simbol-simbol standar.

**Simbol-simbol Dasar Flowchart (dalam Mermaid.js):**
*   **Terminal (Oval):** Menandakan awal (`Start`) dan akhir (`End`) program.
*   **Input/Output (Jajargenjang):** Menandakan proses menerima data (`Input`) atau menampilkan hasil (`Output`).
*   **Proses (Persegi Panjang):** Menandakan perhitungan, pengolahan data, atau pengaturan nilai variabel.
*   **Keputusan/Decision (Belah Ketupat):** Menandakan pengecekan kondisi (`Ya/Tidak` atau `Benar/Salah`). Alirannya akan bercabang.

---

## 2. Studi Kasus: Sistem Login dengan Batas Percobaan

Kita akan merancang logika untuk sebuah sistem login.
**Aturannya:**
1. Sistem memiliki data *username* ("admin") dan *password* ("rahasia123") yang tersimpan.
2. Pengguna diminta memasukkan *username* dan *password*.
3. Jika benar, tampilkan "Login Berhasil" dan program selesai.
4. Jika salah, pengguna boleh mencoba lagi.
5. Pengguna hanya diberi kesempatan maksimal 3 kali percobaan. Jika gagal 3 kali, tampilkan "Akun Terkunci".

### A. Pseudocode

Berikut adalah pseudocode menggunakan gaya penulisan terstruktur yang bersih:

```text
START
    // Atur data login yang valid dan batas percobaan
    SET valid_username TO "admin"
    SET valid_password TO "rahasia123"
    SET max_attempts TO 3
    SET attempts TO 0
    SET login_success TO FALSE

    // Ulangi selama percobaan belum habis dan belum berhasil login
    WHILE (attempts < max_attempts) AND (login_success == FALSE) DO
        PRINT "Masukkan Username:"
        INPUT input_username
        PRINT "Masukkan Password:"
        INPUT input_password

        // Cek apakah username dan password cocok
        IF (input_username == valid_username) AND (input_password == valid_password) THEN
            SET login_success TO TRUE
            PRINT "Login Berhasil! Selamat datang."
        ELSE
            // Tambah jumlah percobaan yang gagal
            SET attempts TO attempts + 1
            PRINT "Username atau Password salah!"
            PRINT "Sisa percobaan: ", (max_attempts - attempts)
        END IF
    END WHILE

    // Cek mengapa perulangan berhenti: apakah karena gagal 3 kali?
    IF login_success == FALSE THEN
        PRINT "Akun Terkunci! Anda telah gagal 3 kali."
    END IF
END
```

### B. Flowchart (Mermaid)

Anda dapat menyalin kode di bawah ini ke [Mermaid Live Editor](https://mermaid.live/) untuk melihat diagramnya.

```mermaid
graph TD
    A([Start]) --> B[SET valid_username = 'admin'<br>SET valid_password = 'rahasia123'<br>SET max_attempts = 3<br>SET attempts = 0<br>SET login_success = false]
    B --> C{attempts < max_attempts <br> AND <br> login_success == false?}

    C -- Ya --> D[/INPUT input_username<br>INPUT input_password/]
    D --> E{input_username == valid_username <br> AND <br> input_password == valid_password?}

    E -- Benar --> F[SET login_success = true]
    F --> G[/PRINT 'Login Berhasil!'/]
    G --> C

    E -- Salah --> H[attempts = attempts + 1]
    H --> I[/PRINT 'Salah! Sisa percobaan: ' + (3 - attempts)/]
    I --> C

    C -- Tidak --> J{login_success == false?}
    J -- Ya --> K[/PRINT 'Akun Terkunci!'/]
    J -- Tidak --> L([End])
    K --> L
```

*Penjelasan Alur Flowchart:*
1. Program mulai `(A)`.
2. Menyiapkan variabel dan mengatur `attempts` menjadi 0 `(B)`.
3. Memeriksa kondisi perulangan: Apakah percobaan masih ada dan login belum berhasil? `(C)`.
4. Jika Ya, minta input pengguna `(D)`.
5. Cek apakah input benar `(E)`.
6. Jika benar, tandai sukses `(F)` lalu cetak pesan sukses `(G)`. Kembali ke pengecekan awal `(C)`. Karena sukses, perulangan akan berhenti.
7. Jika salah, tambah hitungan `attempts` `(H)` dan cetak peringatan `(I)`. Kembali ke pengecekan `(C)`.
8. Jika kondisi di `(C)` sudah Tidak (karena sukses ATAU kuota habis), maka cek: apakah belum sukses? `(J)`.
9. Jika belum sukses (berarti karena kuota habis), cetak Akun Terkunci `(K)`.
10. Selesai `(L)`.

---

## 3. Latihan Praktik untuk Anda

Sekarang giliran Anda mencoba! Berikut adalah masalah yang harus Anda selesaikan menggunakan Pseudocode. Jika Anda berani, buat juga versi Mermaid Flowchart-nya.

**Soal Latihan: Pengecek Bilangan Genap/Ganjil**
Buatlah logika program dengan aturan:
1. Program meminta pengguna untuk memasukkan sebuah angka bulat (contoh: 4, 7, 10).
2. Jika angka tersebut habis dibagi 2 (sisa baginya 0), maka tampilkan "Angka [X] adalah Genap".
3. Jika angka tersebut tidak habis dibagi 2, maka tampilkan "Angka [X] adalah Ganjil".

*Petunjuk Pseudocode:*
Anda bisa menggunakan operator `MOD` (Modulo) untuk mendapatkan sisa bagi. Contoh: `5 MOD 2` hasilnya adalah 1. `4 MOD 2` hasilnya adalah 0.

Silakan kerjakan latihan ini dan tunjukkan hasilnya. Kita akan bahas bersama-sama!
