# Bài thực hành Linux và lập trình mã nguồn mở

- Họ và tên: Vương Đắc Thành
- Mã sinh viên: 2400368
- Lớp: K4828-CNTT

Bài thực hành quản lý tệp, phân quyền, lập trình Bash và quản lý mã nguồn bằng Git/GitHub.

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
