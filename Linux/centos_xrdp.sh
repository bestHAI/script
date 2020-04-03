#!/bin/bash

# ---------- 脚本说明 - start ---------- #

# 脚本作用：安装xrdp(windows远程桌面连接linux)
# 适用环境：Centos
# 运行权限：root
# 工作路径：命令行所在目录
# 执行结果：
#     1. 安装 tigervnc
#     2. 安装 xrdp
#     3. 设置开机自启动

# ---------- 脚本说明  -  end ---------- #

#########################################

# ---------- 脚本主体 - start ---------- #
yum install  epel* -y && \
yum install tigervnc tigervnc-server && \
yum --enablerepo=epel -y install xrdp && \
systemctl start xrdp && \
systemctl enable xrdp && \
systemctl stop firewalld  && \
systemctl disable firewalld

# ---------- 脚本主体  -  end ---------- #
