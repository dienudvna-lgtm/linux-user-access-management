# Lab 1: User Management

## Tujuan

Membuat akun latihan, mengatur password secara interaktif, mengubah informasi akun, memeriksa data akun, dan menghapus akun uji yang dibuat khusus untuk latihan.

## Prasyarat dan Alat

- Debian GNU/Linux 13 dengan terminal Bash
- Akun yang memiliki akses `sudo`
- Perintah Debian: `adduser`, `useradd`, `passwd`, `usermod`, `getent`, `id`, dan `deluser`

## Contoh Akun Latihan

| Nama | Kegunaan |
| --- | --- |
| `labuser1` | Akun praktik pertama; dipakai kembali di lab berikutnya. |
| `labuser2` | Akun praktik kedua untuk pengujian group dan akses. |
| `labuji` | Akun sementara yang dibuat dan dihapus pada lab ini saja. |

## Peringatan

Buat akun hanya jika nama tersebut belum digunakan. Jika `getent passwd` menemukan `labuser1`, `labuser2`, atau `labuji` sebelum Anda membuatnya, berhenti dan minta arahan pengelola mesin. Jangan memakai atau menghapus akun yang sudah ada. Hanya `labuji` yang boleh dihapus, dan itu pun hanya jika Anda sendiri membuatnya pada praktik ini.

## Perintah dan Langkah Praktik

1. Pastikan nama-nama akun belum ada:

   ```bash
   getent passwd labuser1
   getent passwd labuser2
   getent passwd labuji
   ```

   Jika salah satu perintah menampilkan entri, jangan lanjut membuat atau menghapus akun dengan nama itu.

2. Buat akun latihan satu per satu. Pilih salah satu metode berikut, jangan jalankan keduanya untuk nama akun yang sama. `adduser` lebih mudah untuk pemula karena memandu pembuatan akun. Isi prompt secara langsung di terminal:

   ```bash
   sudo adduser labuser1
   sudo adduser labuser2
   ```

   Alternatif dengan `useradd` (opsi `-m` membuat home dan `-s` menentukan shell):

   ```bash
   sudo useradd -m -s /bin/bash labuser1
   sudo useradd -m -s /bin/bash labuser2
   ```

   Jika memakai `useradd`, lanjutkan dengan `passwd` pada langkah berikutnya. Jangan menjalankan contoh alternatif jika akun sudah dibuat dengan `adduser`.

3. Ubah password akun latihan dengan prompt interaktif:

   ```bash
   sudo passwd labuser1
   sudo passwd labuser2
   ```

4. Ubah keterangan akun dan periksa informasi user:

   ```bash
   sudo usermod -c "Akun praktik siswa" labuser1
   getent passwd labuser1
   id labuser1
   ```

5. Buat akun uji khusus untuk latihan penghapusan, atur password melalui prompt, dan verifikasi bahwa akun tersebut ada:

   ```bash
   sudo adduser labuji
   sudo passwd labuji
   getent passwd labuji
   ```

6. Hapus hanya akun uji yang baru saja Anda buat. Sebelum menjalankan perintah penghapusan, pastikan nama dan kepemilikannya benar:

   ```bash
   sudo deluser --remove-home labuji
   getent passwd labuji
   ```

   Perintah terakhir dipakai untuk memeriksa bahwa akun uji sudah tidak terdaftar. Jangan mengganti `labuji` dengan akun lain.

## Penjelasan Perintah

| Perintah | Fungsi |
| --- | --- |
| `getent passwd nama` | Memeriksa apakah nama akun sudah terdaftar, contoh `getent passwd labuser1`. Tidak mencetak password asli. |
| `adduser nama` | Membuat akun secara interaktif dan menyiapkan home, contoh `sudo adduser labuser1`. |
| `useradd -m -s /bin/bash nama` | Alternatif untuk membuat akun dan home dengan perintah; perlu mengatur password terpisah, contoh `sudo useradd -m -s /bin/bash labuser1`. |
| `passwd nama` | Mengatur password melalui prompt, contoh `sudo passwd labuser1`. Karakter password tidak ditampilkan; jangan mencatatnya. |
| `sudo perintah` | Menjalankan perintah administratif setelah autentikasi, contoh `sudo adduser labuser1`. Gunakan hanya untuk akun latihan yang disebut. |
| `usermod -c keterangan nama` | Mengubah komentar/keterangan akun, contoh `sudo usermod -c "Akun praktik siswa" labuser1`. |
| `id nama` | Menampilkan UID, GID, dan group akun, contoh `id labuser1`. |
| `deluser --remove-home nama` | Menghapus akun dan home yang disebut, contoh `sudo deluser --remove-home labuji`. Di project ini hanya untuk `labuji` yang dibuat sendiri. |

## Hasil yang Diharapkan

**Target yang diharapkan (bukan hasil praktik nyata):** `labuser1` dan `labuser2` terdaftar untuk lab berikutnya, keterangan `labuser1` berubah, dan `labuji` tidak lagi terdaftar setelah dihapus. Hasil praktik nyata hanya dicatat pada template bukti setelah perintah dijalankan. Password tidak boleh dicatat.

## Kesimpulan

Tuliskan kesimpulan berdasarkan hasil praktik yang benar-benar Anda peroleh, terutama perbedaan membuat akun, mengubah atribut akun, mengatur password, dan menghapus akun uji.

## Bukti Praktik

Isi [template catatan praktik](evidence/catatan-praktik.md) dengan perintah yang dijalankan, output terminal asli, dan penjelasan hasil. Jangan mengisi output sebelum menjalankan praktik.
