# Lab 3: Linux Permissions

## Tujuan

Memahami permission read, write, dan execute pada file maupun direktori, kemudian mengatur permission file latihan dengan `chmod`.

## Alat

- Debian GNU/Linux 13 dengan terminal Bash
- Akun `labuser1`, `labuser2`, dan group `labgroup` dari lab sebelumnya
- Akses `sudo`, `install`, `touch`, `chmod`, `chgrp`, dan `ls`

## Konsep Permission

| Permission | Simbol | Nilai | Pada file | Pada direktori |
| --- | --- | ---: | --- | --- |
| Read | `r` | 4 | Membaca isi file | Melihat daftar nama entri; perlu `x` juga untuk mengakses entri di dalamnya |
| Write | `w` | 2 | Mengubah isi file | Membuat, menghapus, atau mengganti nama entri; umumnya perlu `x` juga |
| Execute | `x` | 1 | Menjalankan file jika format dan interpreter mendukung | Menelusuri direktori dan mengakses entri yang diketahui namanya |

Permission diperiksa pada tiga kelas: **user/owner** (pemilik file), **group** (anggota group pemilik), dan **others** (user lain yang bukan pemilik maupun anggota group tersebut). Untuk setiap kelas, `r`, `w`, dan `x` memiliki arti seperti tabel di atas. Pada notasi simbolik, `u` berarti user/owner, `g` berarti group, dan `o` berarti others.

Nilai numerik dijumlahkan untuk tiap kelas: `r=4`, `w=2`, dan `x=1`. Contoh aman untuk file latihan `640`: owner `rw-` (6), group `r--` (4), others `---` (0). Artinya hanya owner yang bisa mengubah isi, anggota group hanya dapat membaca, dan others tidak mendapat izin. Contoh `2770` pada direktori berarti setgid aktif, owner dan group mendapat `rwx`, sedangkan others tidak mendapat izin.

## Perintah dan Langkah Praktik

1. Siapkan direktori khusus latihan di `/tmp`. Perintah ini mengatur hanya direktori tersebut, bukan direktori home atau akun sistem:

   ```bash
   sudo install -d -o "$(id -un)" -g labgroup -m 2770 /tmp/linux-access-lab
   ```

   `install -d` membuat direktori, `-o` menetapkan owner ke akun aktif (nama didapat dari `id -un`), `-g` menetapkan group, dan `-m` menetapkan mode. Bit `2` di `2770` adalah setgid pada direktori sehingga file baru di dalamnya mewarisi group direktori.

2. `touch` membuat file kosong. Atur group file latihan dengan `chgrp`, permission dengan `chmod`, lalu lihat hasil konfigurasi menggunakan `ls -l`:

   ```bash
   touch /tmp/linux-access-lab/dokumen.txt
   sudo chgrp labgroup /tmp/linux-access-lab/dokumen.txt
   chmod 640 /tmp/linux-access-lab/dokumen.txt
   ls -l /tmp/linux-access-lab/dokumen.txt
   ```

3. Atur permission yang sama menggunakan format simbolik. `u=rw` memberi owner read/write, `g=r` memberi group read, dan `o=` mencabut permission dari others:

   ```bash
   chmod u=rw,g=r,o= /tmp/linux-access-lab/dokumen.txt
   ls -l /tmp/linux-access-lab/dokumen.txt
   ```

## Penjelasan Perintah

| Perintah | Fungsi |
| --- | --- |
| `id -un` | Menampilkan nama user yang sedang aktif; dipakai untuk menetapkan owner direktori latihan. |
| `install -d -o owner -g group -m mode path` | Membuat direktori dengan owner, group, dan mode yang disebut, contoh `sudo install -d -o "$(id -un)" -g labgroup -m 2770 /tmp/linux-access-lab`. |
| `touch file` | Membuat file kosong jika belum ada, contoh `touch /tmp/linux-access-lab/dokumen.txt`. |
| `sudo perintah` | Menjalankan perintah dengan hak administratif, contoh `sudo install -d ...`; pastikan path hanya menunjuk direktori latihan. |
| `chgrp group file` | Mengatur group pemilik file, contoh `sudo chgrp labgroup /tmp/linux-access-lab/dokumen.txt`. |
| `chmod 640 file` | Mengatur owner `rw`, group `r`, others tanpa izin, contoh `chmod 640 /tmp/linux-access-lab/dokumen.txt`. |
| `chmod u=rw,g=r,o= file` | Mengatur mode yang sama menggunakan simbol, contoh `chmod u=rw,g=r,o= /tmp/linux-access-lab/dokumen.txt`. |
| `ls -l file` | Menampilkan permission, owner, group, ukuran, dan nama file; contoh `ls -l /tmp/linux-access-lab/dokumen.txt`. |
| `ls -ld direktori` | Menampilkan permission direktori itu sendiri, bukan isi di dalamnya. |

## Hasil yang Diharapkan

**Target yang diharapkan (bukan hasil praktik nyata):** permission file setara dengan `640` setelah kedua cara diterapkan. Direktori `2770` memberi owner dan anggota `labgroup` akses telusur, tanpa akses untuk others. Periksa hasil yang benar-benar muncul dan catat di template bukti.

## Kesimpulan

Jelaskan arti setiap kelompok permission dan perbedaan cara numerik dengan cara simbolik. Cocokkan kesimpulan dengan hasil pemeriksaan Anda sendiri.

## Bukti Praktik

Isi [template catatan praktik](evidence/catatan-praktik.md) dengan perintah yang dijalankan, output terminal asli, dan penjelasan hasil. Jangan mengisi output sebelum menjalankan praktik.
