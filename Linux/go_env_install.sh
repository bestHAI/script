#!/bin/bash

# ---------- 脚本说明 - start ---------- #

# 脚本作用：GO环境安装
# 运行权限：root
# 工作路径：命令行所在目录
# 执行结果：
#     1. 在工作路径上新建文件夹：go、go_path
#     2. GOROOT为：go、GOPATH为：go_path
#     3. 配置相关环境变量

# ---------- 脚本说明  -  end ---------- #

#########################################

# ---------- 可改参数 - start ---------- #

version="14.1"  # 版本号，具体可以参考：https://golang.org/dl/ 或 https://studygolang.com/dl

# ---------- 可改参数  -  end ---------- #

#########################################

# ---------- 固定参数 - start ---------- #

work_path=$(dirname $(readlink -f "$0"))  # 当前的绝对路径

# ---------- 固定参数  -  end ---------- #

#########################################

# ---------- 脚本主体 - start ---------- #
echo -e "下载" && \
curl -O "https://dl.google.com/go/go1.$version.linux-amd64.tar.gz" && \

echo -e "解压" && \
tar -zxf "go1.$version.linux-amd64.tar.gz" && \

echo -e "配置" && \
echo "export GOROOT=$work_path/go" >> /etc/profile && \
echo "PATH=$PATH:$work_path/go/bin" >> /etc/profile && \
echo "export GOPATH=$work_path/go_path" >> /etc/profile && \
source /etc/profile && \

echo -e "清除" && \
mkdir "$work_path/go_path" && \
rm -rf "go1.$version.linux-amd64.tar.gz" && \

echo -e "完成"

# ---------- 脚本主体  -  end ---------- #
