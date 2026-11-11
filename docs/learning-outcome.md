# Capaian Pembelajaran

Dokumen ini merangkum kompetensi yang dilatih dalam [project](../README.md). Kerjakan panduan lab secara berurutan dan isi bukti hanya dengan hasil praktik yang benar-benar diperoleh.

Setelah menyelesaikan seluruh praktik, siswa diharapkan mampu:

| No. | Capaian | Indikator praktik |
| --- | --- | --- |
| 1 | Mengelola akun user Linux secara aman | Membuat akun latihan dengan `adduser` atau `useradd`, mengatur password dengan `passwd`, memperbarui informasi akun, dan menghapus hanya akun uji yang dibuat sendiri. |
| 2 | Mengelola group Linux | Membuat `labgroup` dengan `groupadd`, menambahkan user dengan `usermod -aG`, serta memeriksa informasi dengan `id`, `groups`, dan `getent`. |
| 3 | Memahami permission file dan direktori | Menjelaskan read, write, dan execute serta menerapkan permission dengan `chmod` dalam bentuk simbolik atau numerik. |
| 4 | Mengelola ownership | Mengubah pemilik dengan `chown` dan group pemilik dengan `chgrp` pada file latihan. |
| 5 | Menguji hak akses | Memeriksa apakah akun yang berbeda dapat membaca atau menulis file, lalu menghubungkan hasilnya dengan permission dan group. |
| 6 | Membuat bukti praktik yang dapat diperiksa | Mencatat perintah yang benar-benar dijalankan, output terminal asli, serta penjelasan tanpa menyimpan password. |

## Peta Materi

| Capaian | Lab terkait |
| --- | --- |
| User | [Lab 1: User Management](../labs/01-user-management/README.md) |
| Group | [Lab 2: Group Management](../labs/02-group-management/README.md) |
| Permission | [Lab 3: Linux Permissions](../labs/03-linux-permissions/README.md) |
| Ownership | [Lab 4: Ownership Management](../labs/04-ownership-management/README.md) |
| Uji akses | [Lab 5: Access Testing](../labs/05-access-testing/README.md) |

## Ketentuan Keselamatan

- Gunakan Debian GNU/Linux 13 dan Bash, sebaiknya pada mesin virtual khusus latihan.
- Gunakan hanya nama akun latihan yang ditentukan. Jangan mengubah akun sistem atau akun utama Debian.
- Hapus hanya akun `labuji` jika akun tersebut memang dibuat sendiri pada Lab 1. Jangan gunakan perintah penghapusan massal.
- Jangan mencatat password, hash password, atau data autentikasi ke file bukti.
- Folder dan file pengujian berada di `/tmp/linux-access-lab`; pastikan path perintah sesuai sebelum menggunakan `sudo`.
