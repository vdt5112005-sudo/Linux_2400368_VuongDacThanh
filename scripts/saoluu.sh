#!/usr/bin/env bash
root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
mkdir -p "$root/logs" "$root/backup" || exit 1
name="backup_$(date '+%Y%m%d_%H%M%S').tar.gz"
if [[ ! -d "$root/data" ]]; then
  status='That bai: khong tim thay thu muc data'
elif [[ -e "$root/backup/$name" ]]; then
  status='That bai: file sao luu da ton tai'
elif tar -czf "$root/backup/$name" -C "$root" data; then
  status='Thanh cong'
else
  status='That bai: khong the tao ban sao luu'
  rm -f -- "$root/backup/$name"
fi
printf '%s | %s | %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$name" "$status" | tee -a "$root/logs/backup.log"
echo 'Danh sach file sao luu:'
find "$root/backup" -maxdepth 1 -type f -name 'backup_*.tar.gz' -printf '%f\n' | sort
[[ "$status" == 'Thanh cong' ]]
