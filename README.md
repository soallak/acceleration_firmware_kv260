
A ROS2 package containing acceleration firmware artifacts to use with Xilinx Kria Stack.

The package is based on [acceleration_firmware_kv260](https://github.com/ros-acceleration/acceleration_firmware_kv260) version 0.9

The provided rootfs is based on https://github.com/ikwzm/ZynqMP-FPGA-Ubuntu20.04

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


## Install toolchain

The toolchain.zip is found in the [releases](https://github.com/soallak/acceleration_firmware_kv260/releases).

The tars under `toolchain` directory must be extracted under `/opt/`. This might require privileged:
permissions.

 1. Download and unzip release toolchain.zip
 2. Extract toolchain components:
  ```bash
  sudo tar -C /opt/ -x -f toolchain/kv260-ubuntu-20.04.tar.gz # Sysroot
  ```

 3. Install dependencies:
   - bison
   - flex
   - libgmp3
   - libmpc
   - libmpfr
   - texinfo

 4. Build cross compiler:
 ```bash
  cd scripts/
  sudo ./create_toolchain.sh
 ```
