# Linux User and Access Management

Dokumentasi praktik kompetensi **Mengelola User dan Hak Akses Linux** untuk siswa SMK. Seluruh latihan dirancang untuk Debian GNU/Linux 13 dengan terminal Bash.

## Tujuan

Project ini mendokumentasikan praktik kompetensi **Mengelola User dan Hak Akses Linux** pada Debian GNU/Linux 13. Praktik yang dilaporkan mencakup pembuatan akun dan group, pengaturan ownership dan permission, serta pengujian akses file oleh dua akun. Hasil pengujian dicatat apa adanya, termasuk ketika akses ditolak.

> Jalankan praktik di mesin Debian 13 khusus latihan, sebaiknya mesin virtual. Jangan mengubah akun sistem atau akun utama Debian. Jangan menghapus akun selain `labuji` yang Anda buat sendiri untuk latihan ini. Jangan mencatat password atau hash password di dokumentasi.

## Lingkungan Praktik

| Komponen | Keterangan |
| --- | --- |
| Sistem operasi | Debian GNU/Linux 13 |
| Shell | Bash |
| Hak akses | Akun praktikan yang dapat menggunakan `sudo` |
| Akun latihan | `labuser1`, `labuser2`, dan akun uji sementara `labuji` |
| Group latihan | `labgroup` |
| Direktori file uji yang tampak pada screenshot | `/home/labuser1/praktik` |
| File uji | `data.txt` |
| Container | Tidak digunakan |

Pastikan mesin benar-benar Debian 13 sebelum mulai. `cat /etc/os-release` menampilkan identitas sistem operasi, sedangkan `bash --version` menampilkan versi Bash. Kedua perintah ini hanya memeriksa informasi dan tidak mengubah sistem.

```bash
cat /etc/os-release
bash --version
```

## Daftar Materi

| Urutan | Materi | Panduan dan bukti |
| --- | --- | --- |
| 1 | Membuat akun `labuser1` dan `labuser2` dengan `adduser` | [Panduan Lab 1](labs/01-user-management/README.md) · [Bukti Lab 1](labs/01-user-management/evidence/catatan-praktik.md) |
| 2 | Membuat `labgroup` dan menambahkan akun dengan `usermod -aG` | [Panduan Lab 2](labs/02-group-management/README.md) · [Bukti Lab 2](labs/02-group-management/evidence/catatan-praktik.md) |
| 3 | Membuat file `data.txt` dan mengatur permission `640` | [Panduan Lab 3](labs/03-linux-permissions/README.md) · [Bukti Lab 3](labs/03-linux-permissions/evidence/catatan-praktik.md) |
| 4 | Mengatur ownership file dengan `chown` | [Panduan Lab 4](labs/04-ownership-management/README.md) · [Bukti Lab 4](labs/04-ownership-management/evidence/catatan-praktik.md) |
| 5 | Menguji baca file; `labuser2` mendapat `Permission denied` | [Panduan Lab 5](labs/05-access-testing/README.md) · [Bukti Lab 5](labs/05-access-testing/evidence/catatan-praktik.md) · [Screenshot](labs/05-access-testing/evidence/04-access-testing-permission-denied.png) |
| Referensi | Capaian pembelajaran | [Learning Outcome](docs/learning-outcome.md) |
| Alat bantu | Informasi akun, group, dan permission path | [Skrip user-access-info.sh](scripts/user-access-info.sh) |

## Struktur Project

```text
Linux-User-Access-Management/
├── README.md
├── docs/
│   └── learning-outcome.md
├── labs/
│   ├── 01-user-management/
│   │   ├── README.md
│   │   └── evidence/
│   │       ├── .gitkeep
│   │       └── catatan-praktik.md
│   ├── 02-group-management/
│   │   ├── README.md
│   │   └── evidence/
│   │       ├── .gitkeep
│   │       └── catatan-praktik.md
│   ├── 03-linux-permissions/
│   │   ├── README.md
│   │   └── evidence/
│   │       ├── .gitkeep
│   │       └── catatan-praktik.md
│   ├── 04-ownership-management/
│   │   ├── README.md
│   │   └── evidence/
│   │       ├── .gitkeep
│   │       └── catatan-praktik.md
│   └── 05-access-testing/
│       ├── README.md
│       └── evidence/
│           ├── .gitkeep
│           ├── 04-access-testing-permission-denied.png
│           └── catatan-praktik.md
└── scripts/
   └── user-access-info.sh
```

## Cara Menjalankan Praktik

1. Buka terminal Bash pada Debian GNU/Linux 13 dan pastikan akun praktikan boleh menggunakan `sudo`.
2. Ikuti Lab 1 sampai Lab 5 secara berurutan. Setiap lab menjelaskan prasyarat, langkah, fungsi perintah, dan target hasil.
3. Baca peringatan sebelum menjalankan perintah administratif. Periksa kembali nama akun dan path yang dituju.
4. Isi `evidence/catatan-praktik.md` di tiap lab setelah mencoba perintah. Salin output yang benar-benar muncul; bagian **Hasil yang Diharapkan** pada panduan adalah target pembelajaran, bukan bukti bahwa praktik telah dilakukan.
5. Untuk menjalankan skrip bantu dari root project setelah akun latihan tersedia:

   ```bash
   chmod +x scripts/user-access-info.sh
   ./scripts/user-access-info.sh labuser1 /tmp/linux-access-lab/dokumen.txt
   ```

   `chmod +x` memberi izin eksekusi pada skrip. Argumen pertama adalah nama akun dan argumen kedua adalah file atau direktori yang diperiksa; keduanya opsional. Tanpa argumen, skrip memakai akun aktif dan direktori kerja saat ini. Skrip tidak menampilkan password atau isi file.

## Bukti Praktik

Bukti project berupa file Markdown, teks, dan screenshot yang tersedia. Screenshot Lab 05 menunjukkan percobaan membaca `/home/labuser1/praktik/data.txt` sebagai `labuser2` berakhir dengan `Permission denied`. Hasil ini tidak dinyatakan berhasil dan penyebab pastinya belum dipastikan dari screenshot saja. Template catatan praktik tetap kosong sampai output terminal asli dicatat; jangan mengarang output atau memasukkan password, token, hash, atau informasi pribadi.

## Mengunggah ke GitHub

Buat repository kosong di GitHub, lalu dari terminal pada folder project jalankan perintah Git sesuai URL repository milik Anda. Perintah Git berikut hanya mengelola file project, bukan akun Linux:

```bash
git init
git add .
git commit -m "Tambah dokumentasi praktik user dan hak akses Linux"
git branch -M main
git remote add origin <URL-repository-GitHub>
git push -u origin main
```

Ganti `<URL-repository-GitHub>` dengan URL repository Anda. Tinjau isi bukti sebelum mengunggah dan pastikan tidak ada password atau data pribadi.
