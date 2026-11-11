# Lab 4: Ownership Management

## Tujuan

Mengubah pemilik file dengan `chown` dan group pemilik dengan `chgrp` pada file di direktori khusus latihan.

## Prasyarat dan Alat

- Debian GNU/Linux 13 dengan terminal Bash
- Akun `labuser1` dan group `labgroup`
- Direktori `/tmp/linux-access-lab` dari Lab 3
- Akses `sudo`, serta perintah `touch`, `chown`, `chgrp`, dan `stat`

## Contoh Konfigurasi Aman

Perintah hanya menyentuh dua file khusus di `/tmp/linux-access-lab`. Jangan menambahkan opsi rekursif `-R` dan jangan mengganti path dengan direktori sistem.

| File | Owner yang ditargetkan | Group yang ditargetkan |
| --- | --- | --- |
| `kepemilikan.txt` | `labuser1` | `labgroup` |
| `berkas-group.txt` | akun yang membuat file | `labgroup` |

## Perintah dan Langkah Praktik

1. Pastikan akun, group, dan direktori latihan tersedia. `getent` mencari identitas pada basis data sistem, sementara `ls -ld` menampilkan metadata direktori:

   ```bash
   getent passwd labuser1
   getent group labgroup
   ls -ld /tmp/linux-access-lab
   ```

2. `touch` membuat file uji. `chown user:group` mengubah owner dan group sekaligus. `stat` memeriksa metadata setelah perubahan:

   ```bash
   touch /tmp/linux-access-lab/kepemilikan.txt
   sudo chown labuser1:labgroup /tmp/linux-access-lab/kepemilikan.txt
   stat -c '%A %U %G %n' /tmp/linux-access-lab/kepemilikan.txt
   ```

3. Buat file uji kedua untuk melihat bahwa `chgrp` hanya mengubah group pemilik, bukan owner:

   ```bash
   touch /tmp/linux-access-lab/berkas-group.txt
   sudo chgrp labgroup /tmp/linux-access-lab/berkas-group.txt
   stat -c '%A %U %G %n' /tmp/linux-access-lab/berkas-group.txt
   ```

## Penjelasan Perintah

| Perintah | Fungsi |
| --- | --- |
| `getent passwd nama` / `getent group nama` | Memeriksa bahwa akun atau group target ada, contoh `getent passwd labuser1`. |
| `ls -ld path` | Menampilkan metadata direktori itu sendiri, contoh `ls -ld /tmp/linux-access-lab`. |
| `touch file` | Membuat file kosong untuk latihan, contoh `touch /tmp/linux-access-lab/kepemilikan.txt`. |
| `sudo chown user:group file` | Mengubah owner dan group file, contoh `sudo chown labuser1:labgroup /tmp/linux-access-lab/kepemilikan.txt`. |
| `sudo chgrp group file` | Mengubah group pemilik tanpa mengubah owner, contoh `sudo chgrp labgroup /tmp/linux-access-lab/berkas-group.txt`. |
| `stat -c format file` | Memilih metadata yang ditampilkan; `%A` permission, `%U` owner, `%G` group, `%n` nama path. Contoh tersedia pada langkah praktik. |
| `sudo` | Meminta hak administratif untuk perubahan ownership; batasi pada file latihan yang disebut. |

## Hasil yang Diharapkan

**Target yang diharapkan (bukan hasil praktik nyata):** `kepemilikan.txt` dimiliki `labuser1:labgroup`. Group `berkas-group.txt` berubah menjadi `labgroup`, sedangkan owner tetap akun pembuatnya. Pastikan metadata aktual dengan `stat` dan catat apa yang benar-benar terjadi.

## Kesimpulan

Jelaskan perbedaan pemilik file dan group pemilik, serta kapan `chown` atau `chgrp` digunakan.

## Bukti Praktik

Isi [template catatan praktik](evidence/catatan-praktik.md) dengan perintah yang dijalankan, output terminal asli, dan penjelasan hasil. Jangan mengisi output sebelum menjalankan praktik.
