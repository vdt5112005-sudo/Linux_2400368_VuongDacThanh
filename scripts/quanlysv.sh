#!/usr/bin/env bash
root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
data="$root/data/sinhvien.txt"
if [[ ! -f "$data" ]]; then
  echo "Khong tim thay file du lieu: $data" >&2
  exit 1
fi
while true; do
  cat <<'MENU'
===== CHUONG TRINH QUAN LY SINH VIEN =====
1. Hien thi danh sach sinh vien
2. Tim kiem sinh vien theo ma
3. Thong ke sinh vien dat va khong dat
4. Tinh diem trung binh
5. Hien thi sinh vien co diem cao nhat
6. Sap xep sinh vien theo diem giam dan
0. Thoat chuong trinh
MENU
  read -r -p 'Nhap lua chon: ' choice || break
  case "$choice" in
    1) cat "$data" ;;
    2)
      read -r -p 'Nhap ma sinh vien: ' code || break
      awk -F, -v code="$code" '$1 == code {print; found=1} END {if (!found) print "Khong tim thay sinh vien"}' "$data"
      ;;
    3) awk -F, '$3 >= 5 {pass++; next} {fail++} END {printf "Dat: %d\nKhong dat: %d\n", pass, fail}' "$data" ;;
    4) awk -F, '{sum += $3} END {if (NR) printf "Diem trung binh: %.2f\n", sum/NR; else print "Khong co du lieu"}' "$data" ;;
    5) awk -F, 'NR == 1 || $3 > max {max=$3; lines=$0; next} $3 == max {lines=lines "\n" $0} END {if (NR) print lines; else print "Khong co du lieu"}' "$data" ;;
    6) sort -t, -k3,3nr "$data" ;;
    0) echo 'Thoat chuong trinh'; break ;;
    *) echo 'Lua chon khong hop le' ;;
  esac
done
