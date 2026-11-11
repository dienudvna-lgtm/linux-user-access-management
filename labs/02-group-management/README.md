# Lab 2: Group Management

## Tujuan

Membuat group latihan, menambahkan akun latihan sebagai anggota, dan memeriksa user serta group dengan beberapa perintah Linux.

## Prasyarat dan Alat

- Debian GNU/Linux 13 dengan terminal Bash
- Akun `labuser1` dan `labuser2` dari Lab 1
- Akses `sudo`, serta perintah `groupadd`, `usermod`, `id`, `groups`, dan `getent`

## Contoh Konfigurasi

| Akun | Group tambahan |
| --- | --- |
| `labuser1` | `labgroup` |
| `labuser2` | `labgroup` |

## Perintah dan Langkah Praktik

1. Pastikan kedua akun latihan tersedia dan periksa apakah group sudah ada:

   ```bash
   getent passwd labuser1
   getent passwd labuser2
   getent group labgroup
   ```

   `getent passwd` memeriksa akun dan `getent group` memeriksa group. Jika akun tidak ditemukan, selesaikan Lab 1 terlebih dahulu. Jika `labgroup` sudah ditemukan dan Anda tidak membuatnya untuk project ini, berhenti dan konfirmasi dengan pengelola mesin. Jika belum ada, buat group:

   ```bash
   sudo groupadd labgroup
   ```

2. Tambahkan kedua akun ke group. `usermod` mengubah akun; opsi `-a` menambahkan tanpa mengganti group tambahan lain, sedangkan `-G` menyebut daftar group tambahan. Jangan hilangkan `-a`:

   ```bash
   sudo usermod -aG labgroup labuser1
   sudo usermod -aG labgroup labuser2
   ```

3. Periksa identitas dan keanggotaan group. `id` menampilkan UID/GID, `groups` menampilkan nama group, dan `getent group` memeriksa entri group:

   ```bash
   id labuser1
   groups labuser1
   id labuser2
   groups labuser2
   getent group labgroup
   ```

## Penjelasan Perintah

| Perintah | Fungsi |
| --- | --- |
| `getent passwd nama` | Mencari akun, contoh `getent passwd labuser1`. |
| `getent group nama` | Mencari group dan anggota yang terdaftar, contoh `getent group labgroup`. |
| `groupadd nama` | Membuat group, contoh `sudo groupadd labgroup`. Gunakan hanya jika nama belum ada dan Anda memang membuatnya untuk latihan. |
| `sudo perintah` | Menjalankan perintah administratif setelah autentikasi, contoh `sudo groupadd labgroup`. Gunakan hanya untuk group latihan. |
| `usermod -aG group user` | Menambahkan group tambahan tanpa menghapus group tambahan lainnya, contoh `sudo usermod -aG labgroup labuser1`. |
| `id user` | Menampilkan identitas numerik serta group user, contoh `id labuser1`. |
| `groups user` | Menampilkan nama group user, contoh `groups labuser1`. |

Perubahan group biasanya terlihat saat sesi login baru dimulai. Untuk sesi shell yang sedang berjalan, keluar lalu masuk kembali sebagai user terkait sebelum menilai akses interaktif.

## Hasil yang Diharapkan

**Target yang diharapkan (bukan hasil praktik nyata):** `labgroup` tersedia dan kedua akun tercatat sebagai anggota tambahan. Perubahan group terlihat pada data akun; sesi login interaktif yang sudah terbuka mungkin perlu dimulai ulang. Catat hasil aktual pada template bukti.

## Kesimpulan

Jelaskan perbedaan GID utama dan group tambahan, serta alasan menggunakan `usermod -aG` ketika menambahkan keanggotaan.

## Bukti Praktik

Isi [template catatan praktik](evidence/catatan-praktik.md) dengan perintah yang dijalankan, output terminal asli, dan penjelasan hasil. Jangan mengisi output sebelum menjalankan praktik.
