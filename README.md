
A ROS2 package contaning accleration firmware artifcats to be used with Xilinx Kria Stack.

The package is based on [https://github.com/ros-acceleration/acceleration_firmware_kv260](acceleration_firmware_kv260) version 0.9

The provide rootfs is based on https://github.com/ikwzm/ZynqMP-FPGA-Ubuntu20.04

Generating `sd_card.img` using. `colcon acceleration linux vanilla --install-dir install-kv260-soallak` is not supported


## Firmware Artifacts

| Artifact                        | Description                           |
|---------------------------------|---------------------------------------|
| boot.scr                        | U-Boot boot script                    |
| Image                           | Kernel                                |
| system.dtb                      | device tree block                     |
| uEnv.txt                        | U-Boot environment                    |
| platform/kv260_custom_platform/ | Vitis Platform                        |
| kv260_custom_platform.xsa       | Platform XSA with included bitstream  |


## Install Toolchain

The tars under `toolchain` directory must be extracted under `/opt/`. This might require privileged:
permissions

```
sudo tar -C /opt/ -x -f toolchain/aarch64-linux-gnu-kv260-ubuntu-20.04.tar.gz
sudo tar -C /opt/ -x -f toolchain/kv260-ubuntu-20.04.tar.gz
```


