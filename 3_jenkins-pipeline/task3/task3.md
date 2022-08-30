# Task #3  

Trong task này, bạn được yêu cầu tiếp tục cập nhật Job Build **ReactJS Pipeline** từ `task 2`. Bạn sẽ đưa repo của mình về private, và cập nhật Job Build và Jenkinsfile để kết nối được tới private repo này. Thêm nữa, bạn sẽ sử dụng docker `docker` và `docker pipeline` để thực hiện build docker image từ ứng dụng.

Trong task này bạn sẽ nắm vững:
- Cấu hình Jenkins Pipeline và Jenkinsfile sử dụng Private Repository
- Tạo Personal Access Token trên Github
- Cài đặt và sử dụng Docker trong stage của Jenkins Pipeline
- Cách truyền dữ liệu giữa các stage trong Jenkins Pipeline
      
## 1. Thiết lập Repository và Github

### 1.0 Clone repository [react-for-demo](https://github.com/HoangPhu98/react-for-demo)

> https://github.com/quanhieu/TIL_Jenkins_React

### 1.1. Chuyển mode của repository

- Mở Github truy cập vào repo của bạn -> Click **settings** -> đưa màn hình xuống phần **Danger Zone** -> Click **Change visibility** -> Chọn **Make private** -> Nhập tên repo -> Click **I understand, change repository visibility**

![Change Mode Repo](../images/change_mode_repository.png)  

### 1.2. Tạo Access Token cho tài khoản GitHub

- Vào phần **Settings** của tài khoản -> Click Developer settings -> Click **Person access tokens** -> Click **Generate new token**

- Nhập tên của Person access token -> Chọn quyền của token: `repo` và `user:email`

![Create PAC](../images/create_access_token.png)  

- Token xuất hiện, lưu ý, token chỉ xuất hiện một lần và token này là bí mật, cần bảo quản cẩn thận.

## 2. Cài đặt plugin Docker và Docker Pipeline

Để sử dụng Docker trong Jenkisn Pipeline, chúng ta cần cài đặt thêm 2 plugin: `Docker` và `Docker Pipeline`.

> Lưu ý: Jenkins Slave cần cài đặt docker trước. Trong task của buổi số 2, Jenkins slave trên docker của bạn đã được cài đặt docker và sẵn sàng cho sử dụng.

- Click **Manage Jenkins** -> click **Available** -> tìm kiếm Docker -> Chọn `Docker plugin` và `Docker Pipeline` -> Click **Install without restart**

## 3. Cấu hình Job Build và Chỉnh sửa Jenkinsfile

### 3.1. Tạo Github credential

Trong bước này, bạn sẽ tạo github credential để Job Build có thể truy cập vào private repository.

- Click **Manage Jenkins** -> Click **Manage Credentials** -> Click **global** -> Click **Add Credential*
- Chọn **Username with password**
- Trong phần form, nhập email của tài khoản github vào `username`
- Nhập token vừa tạo được ở phần `#1` vào `password` 
- Nhập ID **jenkins_github_pac** và Description cho credential

![Create Github Credential](../images/pipeline_jenkins_github_cred.png)

Credential của bạn đã sẵn sàng kết nối tới Github repository của bạn.

### 3.2. Cấu hình Job Build

Trong bước này, bạn sẽ cập nhật cấu hình của Job Build trên UI: thêm credential cho repository chưa jenkinsfile.

Sửa cấu hình Pipeline:

- Chọn Job Build **ReactJS Pipeline** -> click **Configure** -> Add credential `jenkins_github_pac` trong Git.

![Add credential in Git](../images/pipeline_jenkinsfile_2.png)

- Kiểm tra **script path** dẫn tới Jenkinsfile

![Add credential in Git](../images/pipeline_script_path_33.png)

### 3.3. Cập nhật Jenkinsfile

- Cập nhật nội dung Jenkinsfile để pipeline có thể truy cập tới private repo và thêm stage build docker image.

- Thêm stage thực hiện build docker image từ source code của bạn.

Tham khảo Jenkinsfile trong **task 3** này.

### 3.3.  Run pipeline  
- Click **Build Now**  

![Build Now](../images/pipeline_result_33.png)

- Check trong Log của Job build và kiểm tra xem Jenkinsfile có được thực thi đúng hay không

![Log Result](../images/pipeline_output_33.png)

### Task #3 Completed

## 4. Yêu cầu kết quả

Chụp lại màn hình kết quả chạy Job Build và console output.


# Trouble Shooting

```diff
- Got permission denied while trying to connect to the Docker daemon socket

# Cấp quyền thực thi cho Docker daemon socket -> jenkins-slave
sudo chmod 666 /var/run/docker.sock
