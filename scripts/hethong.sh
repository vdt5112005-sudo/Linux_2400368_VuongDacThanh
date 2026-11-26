#!/usr/bin/env bash
root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
mkdir -p "$root/logs"
{
  echo "Nguoi dung: $(whoami)"
  echo "Ten may: $(hostname)"
  echo "Ngay gio: $(date '+%Y-%m-%d %H:%M:%S')"
  echo "Linux Kernel: $(uname -r)"
  echo "Dung luong RAM:"
  free -h
  echo "Dung luong o dia:"
  df -h
  if ping -c 1 -W 3 google.com.vn >/dev/null 2>&1; then
    echo "Co ket noi mang"
  else
    echo "Khong xac nhan duoc ket noi mang"
  fi
} | tee "$root/logs/hethong.log"
