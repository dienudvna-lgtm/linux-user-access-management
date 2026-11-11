# Lab 5: Access Testing

## Tujuan

Menguji akses baca dan tulis ke file yang sama menggunakan akun latihan berbeda, lalu mengaitkan hasilnya dengan ownership, group, dan permission.

## Prasyarat dan Alat

- Debian GNU/Linux 13 dengan terminal Bash
- Akun `labuser1`, `labuser2`, dan group `labgroup`
- File `/tmp/linux-access-lab/dokumen.txt` dari Lab 3
- Akses `sudo`, serta perintah `sudo`, `id`, `stat`, `printf`, `tee`, `test`, `cat`, dan `chmod`

## Konfigurasi Uji

| Item | Nilai awal untuk pengujian |
| --- | --- |
| File | `/tmp/linux-access-lab/dokumen.txt` |
| Owner | `labuser1` |
| Group | `labgroup` |
| Anggota group | `labuser1` dan `labuser2` |
| Permission awal | `640`: owner read/write, group read, others tanpa izin |
| Permission berikutnya | `660`: owner dan group read/write, others tanpa izin |

## Perintah dan Langkah Praktik

1. Pastikan akun sudah menjadi anggota group, lalu periksa file. `id` memeriksa keanggotaan; `stat` memeriksa owner, group, dan mode. Jika file atau akun belum ada, kembali ke lab sebelumnya:

   ```bash
   id labuser1
   id labuser2
   stat -c '%A (%a) %U:%G %n' /tmp/linux-access-lab/dokumen.txt
   ```

   Pastikan kedua user tercatat sebagai anggota `labgroup`. Jika keanggotaan baru ditambahkan, sesi login baru mungkin diperlukan untuk sesi interaktif.

2. Atur file latihan ke owner/group yang disebutkan dan masukkan teks contoh ke file sebagai `labuser1`. `chown` diarahkan hanya ke file latihan; `tee` menulis teks yang diberikan ke file:

   ```bash
   sudo chown labuser1:labgroup /tmp/linux-access-lab/dokumen.txt
   printf '%s\n' 'Isi uji akses' | sudo -u labuser1 -- tee /tmp/linux-access-lab/dokumen.txt
   sudo chmod 640 /tmp/linux-access-lab/dokumen.txt
   ```

3. Uji akses baca dan tulis `labuser2` saat permission file adalah `640`. `test -r` memeriksa baca dan `test -w` memeriksa tulis. `printf` berikutnya menampilkan status perintah tepat sebelumnya (`0` berarti tes benar; nilai bukan `0` berarti tes tidak terpenuhi):

   ```bash
   sudo -u labuser2 -- test -r /tmp/linux-access-lab/dokumen.txt
   printf 'status baca=%s\n' "$?"
   sudo -u labuser2 -- test -w /tmp/linux-access-lab/dokumen.txt
   printf 'status tulis=%s\n' "$?"
   ```

   `test` mengembalikan status `0` jika kondisi benar dan status bukan `0` jika kondisi salah. Perintah `printf` mencetak status aktual dari perintah sebelumnya.

4. Berikan permission tulis kepada owner dan group dengan `chmod 660`, ulangi tes, lalu lakukan uji tulis nyata dengan menambahkan satu baris sebagai `labuser2`:

   ```bash
   sudo chmod 660 /tmp/linux-access-lab/dokumen.txt
   sudo -u labuser2 -- test -w /tmp/linux-access-lab/dokumen.txt
   printf 'status tulis setelah chmod=%s\n' "$?"
   printf '%s\n' 'Baris tambahan oleh labuser2' | sudo -u labuser2 -- tee -a /tmp/linux-access-lab/dokumen.txt
   ```

5. Uji membaca file sebagai kedua akun. `cat` mencoba membaca isi file menggunakan identitas user yang disebut:

   ```bash
   sudo -u labuser1 -- cat /tmp/linux-access-lab/dokumen.txt
   sudo -u labuser2 -- cat /tmp/linux-access-lab/dokumen.txt
   ```

   File dibuat kosong di Lab 3, sehingga `cat` dapat tidak menampilkan isi. Hal itu tidak menggantikan pemeriksaan permission dengan `test`.

## Penjelasan Perintah

| Perintah | Fungsi |
| --- | --- |
| `id user` | Menampilkan UID, GID, dan group, contoh `id labuser2`. |
| `stat -c format file` | Memeriksa mode dan owner; format `'%A (%a) %U:%G %n'` menampilkan permission simbolik/numerik serta owner/group/path. |
| `sudo chown user:group file` | Menyiapkan owner dan group file uji, contoh `sudo chown labuser1:labgroup /tmp/linux-access-lab/dokumen.txt`. |
| `printf '%s\n' teks` | Mengirim teks dan newline ke output; dapat dipipe ke program penulis file, contoh pada langkah 2. |
| `sudo -u user -- perintah` | Menjalankan perintah sebagai user yang dipilih, contoh `sudo -u labuser2 -- test -r /tmp/linux-access-lab/dokumen.txt`. |
| `tee file` / `tee -a file` | Menulis input ke file; `-a` menambahkan di akhir, contoh dipakai untuk uji tulis sebagai user tertentu. |
| `chmod 640 file` | Owner read/write, group read, others tanpa izin. |
| `test -r file` / `test -w file` | Menguji apakah user dapat membaca/menulis file; status keluar `0` berarti izin tersedia. |
| `printf 'status=%s\n' "$?"` | Menampilkan status keluar perintah sebelumnya. Letakkan tepat sesudah perintah `test`. |
| `chmod 660 file` | Memberi owner dan group read/write serta menolak izin others. |
| `cat file` | Membaca isi file dengan hak user yang menjalankan perintah, contoh `sudo -u labuser2 -- cat /tmp/linux-access-lab/dokumen.txt`. |

## Hasil yang Diharapkan

**Target yang diharapkan (bukan hasil praktik nyata):** jika owner `labuser1`, group `labgroup`, `labuser2` anggota group, dan permission `640`, maka tes baca seharusnya terpenuhi sedangkan tes tulis seharusnya tidak terpenuhi. Setelah mode menjadi `660`, tes tulis seharusnya terpenuhi dan penambahan teks sebagai `labuser2` seharusnya berhasil. ACL, permission direktori, atau konfigurasi mesin dapat memengaruhi hasil. Catat status dan output yang benar-benar diperoleh; jangan menyalin target ini sebagai output nyata.

## Kesimpulan

Jelaskan hasil uji baca/tulis untuk masing-masing user dan bagaimana perubahan permission memengaruhi akses. Gunakan hasil terminal asli, bukan perkiraan.

## Bukti Praktik

Isi [template catatan praktik](evidence/catatan-praktik.md) dengan perintah yang dijalankan, output terminal asli, dan penjelasan hasil. Jangan mengisi output sebelum menjalankan praktik.
