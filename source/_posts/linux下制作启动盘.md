---
title: linux下制作启动盘
date: 2016-06-18 12:21:39
tags: linux
categories: linux

---

完全卸载lwindows后，想要制作启动盘就要有点尴尬，以前都是windows的图形化界面，什么老毛桃软碟通，后来发现linux更方便，我们可以使用linux下的一条命令来完成-----dd

操作方法:

 1 卸载你的U盘
  假设你的u盘对应的设备是sdb1(可以使用df查看或者fdisk)
  sudo umount /dev/sdb1

2 写入linux(ubuntu fedora .....)系统
  sudo dd if=系统路径   of=/dev/sdb
例如   sudo dd if=./ubuntu-13.04-beta2-desktop-amd64.iso   of=/dev/sdb

3 大约5～6分钟解释 命令行返回消息后就代表完成了
