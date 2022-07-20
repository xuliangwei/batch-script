# 需要准备的文件
* boot-debug.img
userdebug版本的boot.img，改为为boot-debug.img，用于root设备并将system分区挂载为可读写。
* boot.img
设备里原来烧录的正式版本的boot.img，升级后需要重新烧写回去。
* PRXXX_fw.img
新思提供的触摸屏固件，将其改名为PRXXX_fw.img。

# 注意事项
针对触摸屏进行烧写，原固件版本号是72.83.48.*，升级后变为72.83.48.53。
