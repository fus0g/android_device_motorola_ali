Device configuration for the Motorola Moto G6 (ali)
====================================================

This tree combines the former `device/motorola/ali` and
`device/motorola/msm8953-common` trees into a single repository for the
Moto G6 (ali, SDM450), for LineageOS 18.1.

The shared msm8953 pieces (`BoardConfigCommon.mk`, `msm8953.mk`, `configs/`,
`sepolicy/`, `rootdir/`, `light/`, `libshims/`, ...) now live next to the
device-specific files. The blob lists are `proprietary-files-common.txt`
(shared with the other msm8953 Motorola devices) and `proprietary-files.txt`
(ali only); the blobs themselves stay in `vendor/motorola/msm8953-common` and
`vendor/motorola/ali`.

Kernel: `kernel/motorola/sdm450` (LineageOS 4.9 kernel with the ali device
trees), see `lineage.dependencies`.

Original work: The LineageOS Project, The PixelExperience Project and the
Kizashi-Devices maintainers; the history of both former trees is kept in this
repository.
