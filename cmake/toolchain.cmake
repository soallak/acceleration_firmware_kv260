set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_SYSTEM_PROCESSOR aarch64)
set(CMAKE_VERBOSE_MAKEFILE:BOOL ON) # pushed to here, instead of as within
                                    # --cmake-args

set(FIRMWARE_DIR __FIRMWARE_DIR__)
set(INSTALL_DIR __INSTALL_DIR__)
# TODO(soallak): Add support for custom sysroot and compiker installation paths
#set(COMPILER_INSTALL_DIR __COMPILER_INSTALL_DIR__)
#set(SYSROOT_INSTALL_DIR __SYSROOT_INSTALL_DIR__)

# Specify the cross compiler
set(COMPILER_INSTALL_DIR /opt/aarch64-linux-gnu-kv260-ubuntu-20.04)
set(CMAKE_C_COMPILER ${COMPILER_INSTALL_DIR}/bin/aarch64-linux-gnu-gcc)
set(CMAKE_CXX_COMPILER ${COMPILER_INSTALL_DIR}/bin/aarch64-linux-gnu-g++)

# Specify the target file system
set(SYSROOT_INSTALL_DIR /opt/sysroot-kv260-ubuntu-20.04/)
set(CMAKE_SYSROOT ${SYSROOT_INSTALL_DIR})
set(CMAKE_FIND_ROOT_PATH "${INSTALL_DIR}-kv260-soallak" ${CMAKE_SYSROOT}
                         ${CMAKE_SYSROOT}/opt/ros/foxy/)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

set(ENV{PKG_CONFIG_SYSROOT_DIR} ${CMAKE_SYSROOT})
set(ENV{PKG_CONFIG_LIBDIR}
    "${CMAKE_SYSROOT}/usr/lib/pkgconfig:${CMAKE_SYSROOT}/usr/share/pkgconfig:${CMAKE_SYSROOT}/usr/lib/aarch64-linux-gnu/pkgconfig/"
)
set(ENV{PKG_CONFIG_PATH}
    "${CMAKE_SYSROOT}/usr/lib/pkgconfig:${CMAKE_SYSROOT}/usr/share/pkgconfig:${CMAKE_SYSROOT}/usr/lib/aarch64-linux-gnu/pkgconfig/"
)

set(CMAKE_SHARED_LINKER_FLAGS_INIT "-Wl,--unresolved-symbols=ignore-all")
set(CMAKE_EXE_LINKER_FLAGS_INIT "-Wl,--unresolved-symbols=ignore-all")

# to fix FindThread
set(CMAKE_THREAD_LIBS_INIT "-lpthread")
set(CMAKE_HAVE_THREADS_LIBRARY 1)
set(CMAKE_USE_WIN32_THREADS_INIT 0)
set(CMAKE_USE_PTHREADS_INIT 1)
set(THREADS_PREFER_PTHREAD_FLAG ON)
