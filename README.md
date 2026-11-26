# Bài thực hành Linux và lập trình mã nguồn mở

- Họ và tên: Vương Đắc Thành
- Mã sinh viên: 2400368
- Lớp: K4828-CNTT

Bài thực hành quản lý tệp, phân quyền, lập trình Bash và quản lý mã nguồn bằng Git/GitHub.

## Đề bài

**Trường Đại học Công nghiệp Việt – Hung — Khoa Công nghệ thông tin**
**Học phần:** Linux và lập trình mã nguồn mở
**Thời gian:** 90 phút | **Thang điểm:** 10 điểm
**Môi trường:** Linux/Ubuntu hoặc WSL2; Bash Shell, Git và GitHub.

### Câu 1. Quản lý tệp, thư mục và phân quyền (1,5 điểm)

Tạo thư mục `MSSV_HoTen_Linux` trong Home, gồm các thư mục `data`, `scripts`, `logs`, `backup` và file `README.md`. Tạo `data/sinhvien.txt` với dữ liệu sau, phân quyền cho chủ sở hữu đọc và ghi, nhóm chỉ đọc, người khác không có quyền; hiển thị thông tin chi tiết các tệp và thư mục.

```text
SV001,Nguyen Van An,8.5
SV002,Tran Thi Binh,7.0
SV003,Le Van Cuong,4.5
SV004,Pham Thi Dung,9.0
SV005,Hoang Van Minh,6.5
SV006,Nguyen Van Nam,3.5
SV007,Tran Van Hung,8.0
SV008,Le Thi Hoa,5.5
SV009,Do Van Long,4.0
SV010,Vu Thi Mai,9.5
```

### Câu 2. Script kiểm tra hệ thống (1,5 điểm)

Tạo `scripts/hethong.sh` để hiển thị tên người dùng, tên máy, ngày giờ, phiên bản kernel, dung lượng RAM và ổ đĩa. Kiểm tra kết nối bằng `ping` tới `google.com.vn`, thông báo `Co ket noi mang` khi thành công hoặc `Khong xac nhan duoc ket noi mang` khi không thành công. Ghi toàn bộ kết quả vào `logs/hethong.log`, cấp quyền thực thi và chạy script.

### Câu 3. Script quản lý sinh viên (2,5 điểm)

Tạo `scripts/quanlysv.sh` đọc `data/sinhvien.txt` và lặp menu đến khi chọn `0`:

```text
===== CHUONG TRINH QUAN LY SINH VIEN =====
1. Hien thi danh sach sinh vien
2. Tim kiem sinh vien theo ma
3. Thong ke sinh vien dat va khong dat
4. Tinh diem trung binh
5. Hien thi sinh vien co diem cao nhat
6. Sap xep sinh vien theo diem giam dan
0. Thoat chuong trinh
Nhap lua chon:
```

Tìm sinh viên theo mã nhập từ bàn phím; thống kê số đạt (điểm từ 5 trở lên) và không đạt; tính điểm trung bình, tìm điểm cao nhất và sắp xếp giảm dần. Kiểm tra file dữ liệu tồn tại và thông báo lựa chọn không hợp lệ. Sử dụng `case`, `while` hoặc `if`; có thể dùng `awk`, `grep`, `sort`, `cut`.

### Câu 4. Script sao lưu dữ liệu (1,5 điểm)

Tạo `scripts/saoluu.sh`: kiểm tra thư mục `data`, nén toàn bộ thư mục bằng `tar` vào `backup/backup_YYYYMMDD_HHMMSS.tar.gz`, thông báo thành công hoặc thất bại. Ghi thời gian, tên file và trạng thái vào `logs/backup.log`; hiển thị danh sách các bản sao lưu.

### Câu 5. Git và GitHub (3 điểm)

- Khởi tạo Git repository, cấu hình `user.name` và `user.email`, đưa file vào staging, tạo ít nhất ba commit theo các giai đoạn và hiển thị lịch sử.
- Tạo nhánh `feature-backup`, bổ sung hoặc sửa chức năng sao lưu và commit; trở về `main` và hợp nhất nhánh.
- Tạo repository GitHub `Linux_MSSV_HoTen`, kết nối và đẩy mã nguồn bằng Git; kiểm tra file, lịch sử commit và quyền truy cập cho giảng viên.
- Hoàn thiện README với thông tin sinh viên, giới thiệu bài, chức năng, cách cấp quyền, chạy chương trình và kết quả.

### Yêu cầu nộp bài

Nộp liên kết GitHub `https://github.com/Username/Linux_MSSV_HoTen`. Các script phải chạy được trên Linux và có quyền thực thi; đưa mã nguồn lên GitHub bằng lệnh Git, không dùng Upload files. Không đưa mật khẩu, token hoặc thông tin xác thực vào mã nguồn.

```text
MSSV_HoTen_Linux/
  data/sinhvien.txt
  scripts/hethong.sh
  scripts/quanlysv.sh
  scripts/saoluu.sh
  logs/hethong.log
  logs/backup.log
  backup/backup_YYYYMMDD_HHMMSS.tar.gz
  README.md
```

## Chức năng

- `scripts/hethong.sh`: hiển thị người dùng, tên máy, thời gian, kernel, RAM, ổ đĩa và kiểm tra mạng; ghi kết quả vào `logs/hethong.log`.
- `scripts/quanlysv.sh`: hiển thị, tìm theo mã, thống kê đạt/không đạt, tính điểm trung bình, tìm điểm cao nhất và sắp xếp sinh viên giảm dần theo điểm.
- `scripts/saoluu.sh`: nén thư mục `data` vào `backup`, ghi kết quả vào `logs/backup.log` và liệt kê các bản sao lưu.

## Cách chạy

Trong thư mục gốc của bài làm:

```bash
chmod 640 data/sinhvien.txt
chmod +x scripts/*.sh
./scripts/hethong.sh
./scripts/quanlysv.sh
./scripts/saoluu.sh
```

Chọn các mục trong menu quản lý sinh viên và nhập `0` để thoát. Khi sao lưu, tên tệp có dạng `backup_YYYYMMDD_HHMMSS.tar.gz`; nếu tệp cùng tên đã tồn tại, chương trình báo lỗi để tránh ghi đè.

## Kết quả với dữ liệu đề bài

Có 10 sinh viên: 7 đạt, 3 không đạt; điểm trung bình là 6,60. Sinh viên có điểm cao nhất là SV010, Vu Thi Mai, với 9,5 điểm. Các tệp log và bản sao lưu mẫu được tạo khi chạy các chương trình.

Git lưu quyền thực thi của script nhưng không lưu đầy đủ quyền `640` của tệp dữ liệu; hãy chạy lại lệnh `chmod 640` sau khi clone.
