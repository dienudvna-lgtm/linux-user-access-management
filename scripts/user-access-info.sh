#!/usr/bin/env bash
set -euo pipefail

usage() {
    printf 'Penggunaan: %s [username] [file]\n' "${0##*/}"
    printf 'Tanpa argumen, skrip memeriksa akun aktif dan direktori saat ini.\n'
    printf 'Skrip menampilkan metadata akun/group dan permission, bukan password atau isi file.\n'
}

if (( $# == 1 )) && [[ $1 == -h || $1 == --help ]]; then
    usage >&1
    exit 0
fi

if (( $# > 2 )); then
    usage >&2
    exit 2
fi

username=${1:-$(id -un)}
target=${2:-.}

if ! getent passwd "$username" >/dev/null; then
    printf 'Akun tidak ditemukan: %s\n' "$username" >&2
    exit 1
fi

if [[ ! -e $target ]]; then
    printf 'Path tidak ditemukan: %s\n' "$target" >&2
    exit 1
fi

printf '== Informasi akun ==\n'
id -- "$username"
printf 'Group akun: '
groups -- "$username"

printf '\n== Entri akun (tanpa data autentikasi) ==\n'
getent passwd "$username" | awk -F: '{printf "nama=%s uid=%s gid=%s home=%s shell=%s\n", $1, $3, $4, $6, $7}'

printf '\n== Entri group ==\n'
read -r -a group_names <<< "$(id -Gn -- "$username")"
for group_name in "${group_names[@]}"; do
    if group_entry=$(getent group "$group_name"); then
        printf '%s\n' "$group_entry" | awk -F: '{printf "nama=%s gid=%s anggota=%s\n", $1, $3, $4}'
    fi
done

printf '\n== Metadata file/direktori ==\n'
stat -c '%A (%a) pemilik=%U group=%G path=%n' -- "$target"
