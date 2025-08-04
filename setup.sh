#!/bin/bash

# Kiểm tra xem phiên bản Python có được truyền vào không
if [ -z "$1" ]; then
    echo "Usage: $0 <python_version>"
    exit 1
fi

version_python=$1

cd ~

# Cập nhật và nâng cấp hệ thống
sudo apt update && sudo apt upgrade -y

# Thông báo phiên bản Python sẽ cài đặt
echo "INSTALLING PYTHON ${version_python}"

# Cài đặt các gói cần thiết
sudo apt-get install -y build-essential tk-dev libncurses5-dev libncursesw5-dev libreadline6-dev \
libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev libffi-dev

# Tải và giải nén Python
wget https://www.python.org/ftp/python/${version_python}/Python-${version_python}.tgz
tar -xf Python-${version_python}.tgz
cd Python-${version_python}

# Cấu hình và biên dịch Python
./configure --enable-optimizations
make -j$(nproc)  # Tự động phát hiện số lõi CPU để biên dịch nhanh hơn

# Cài đặt Python
sudo make altinstall

# sudo apt-get install python3.8-tk

# Xác nhận quá trình cài đặt thành công
echo "INSTALLED PYTHON ${version_python}"

# Trở về thư mục gốc (home) của người dùng
cd ~

################################ END PYTHON ####################################

# Thông báo REDIS sẽ cài đặt
echo "INSTALLING REDIS"

sudo apt-get install -y redis-server
sudo systemctl start redis-server
# bật run khi mở máy
sudo systemctl enable redis-server

# Xác nhận quá trình cài đặt thành công
echo "INSTALLED REDIS"

################################# END REDIS ################################


# Thông báo GIT sẽ cài đặt
echo "INSTALLING GIT"

sudo apt install -y git-all

# Xác nhận quá trình cài đặt thành công
echo "INSTALLED GIT"
################################# END GIT ###################################


# Thông báo VSCODE sẽ cài đặt
echo "INSTALLING VSCODE"

sudo apt install -y software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install -y code

# Xác nhận quá trình cài đặt thành công
echo "INSTALLED VSCODE"
################################## END VSCODE #####################################


# Thông báo POSTMAN sẽ cài đặt
echo "INSTALLING POSTMAN"

sudo snap install postman

# Xác nhận quá trình cài đặt thành công
echo "INSTALLED POSTMAN"
################################## END POSTMAN #####################################


# Thông báo POSTGRES sẽ cài đặt
echo "INSTALLING POSTGRES"

sudo sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install postgresql

# Xác nhận quá trình cài đặt thành công
echo "INSTALLED POSTGRES"
################################## END POSTGRES #####################################


# Thông báo PGADMIN4 sẽ cài đặt
echo "INSTALLING PGADMIN4"

# Cài curl
sudo apt  install curl

curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
sudo apt install pgadmin4-desktop

# Xác nhận quá trình cài đặt thành công
echo "INSTALLED PGADMIN4"
################################## END PGADMIN4 #####################################


# Thiếu Nodejs và Angular Cài thủ công vì phải chọn version LTS và new terminal 

# Script RUN: ~/ bash setup.sh 3.8.10
