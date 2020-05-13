-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (native)
Source: linux-signed-amd64
Binary: kernel-image-4.19.0-8-amd64-di, nic-modules-4.19.0-8-amd64-di, nic-wireless-modules-4.19.0-8-amd64-di, nic-shared-modules-4.19.0-8-amd64-di, serial-modules-4.19.0-8-amd64-di, usb-serial-modules-4.19.0-8-amd64-di, ppp-modules-4.19.0-8-amd64-di, pata-modules-4.19.0-8-amd64-di, cdrom-core-modules-4.19.0-8-amd64-di, firewire-core-modules-4.19.0-8-amd64-di, scsi-core-modules-4.19.0-8-amd64-di, scsi-modules-4.19.0-8-amd64-di, scsi-nic-modules-4.19.0-8-amd64-di, loop-modules-4.19.0-8-amd64-di, btrfs-modules-4.19.0-8-amd64-di, ext4-modules-4.19.0-8-amd64-di, isofs-modules-4.19.0-8-amd64-di, jfs-modules-4.19.0-8-amd64-di, xfs-modules-4.19.0-8-amd64-di, fat-modules-4.19.0-8-amd64-di, md-modules-4.19.0-8-amd64-di, multipath-modules-4.19.0-8-amd64-di, usb-modules-4.19.0-8-amd64-di, usb-storage-modules-4.19.0-8-amd64-di, pcmcia-storage-modules-4.19.0-8-amd64-di, fb-modules-4.19.0-8-amd64-di, input-modules-4.19.0-8-amd64-di, event-modules-4.19.0-8-amd64-di,
 mouse-modules-4.19.0-8-amd64-di, nic-pcmcia-modules-4.19.0-8-amd64-di, pcmcia-modules-4.19.0-8-amd64-di, nic-usb-modules-4.19.0-8-amd64-di, sata-modules-4.19.0-8-amd64-di, acpi-modules-4.19.0-8-amd64-di, i2c-modules-4.19.0-8-amd64-di, crc-modules-4.19.0-8-amd64-di, crypto-modules-4.19.0-8-amd64-di, crypto-dm-modules-4.19.0-8-amd64-di, efi-modules-4.19.0-8-amd64-di, ata-modules-4.19.0-8-amd64-di, mmc-core-modules-4.19.0-8-amd64-di, mmc-modules-4.19.0-8-amd64-di, nbd-modules-4.19.0-8-amd64-di, squashfs-modules-4.19.0-8-amd64-di, speakup-modules-4.19.0-8-amd64-di, uinput-modules-4.19.0-8-amd64-di, sound-modules-4.19.0-8-amd64-di, compress-modules-4.19.0-8-amd64-di, udf-modules-4.19.0-8-amd64-di, fuse-modules-4.19.0-8-amd64-di, mtd-core-modules-4.19.0-8-amd64-di, linux-image-4.19.0-8-amd64, linux-image-4.19.0-8-cloud-amd64,
 linux-image-4.19.0-8-rt-amd64
Architecture: amd64
Version: 4.19.98+1
Maintainer: Debian Kernel Team <debian-kernel@lists.debian.org>
Uploaders: Ben Hutchings <ben@decadent.org.uk>
Homepage: https://www.kernel.org/
Standards-Version: 4.1.1
Vcs-Browser: https://salsa.debian.org/kernel-team/linux
Vcs-Git: https://salsa.debian.org/kernel-team/linux.git
Build-Depends: debhelper (>= 10.1~), rsync, sbsigntool [amd64 arm64 i386], kernel-wedge (>= 2.99~), linux-kbuild-4.19, linux-support-4.19.0-8 (= 4.19.98-1), linux-image-4.19.0-8-amd64-unsigned (= 4.19.98-1) [amd64], linux-image-4.19.0-8-cloud-amd64-unsigned (= 4.19.98-1) [amd64], linux-image-4.19.0-8-rt-amd64-unsigned (= 4.19.98-1) [amd64]
Package-List:
 acpi-modules-4.19.0-8-amd64-di udeb debian-installer optional arch=amd64
 ata-modules-4.19.0-8-amd64-di udeb debian-installer optional arch=amd64
 btrfs-modules-4.19.0-8-amd64-di udeb debian-installer optional arch=amd64
 cdrom-core-modules-4.19.0-8-amd64-di udeb debian-installer standard arch=amd64
 compress-modules-4.19.0-8-amd64-di udeb debian-installer optional arch=amd64
 crc-modules-4.19.0-8-amd64-di udeb debian-installer optional arch=amd64
 crypto-dm-modules-4.19.0-8-amd64-di udeb debian-installer optional arch=amd64
 crypto-modules-4.19.0-8-amd64-di udeb debian-installer optional arch=amd64
 efi-modules-4.19.0-8-amd64-di udeb debian-installer optional arch=amd64
 event-modules-4.19.0-8-amd64-di udeb debian-installer optional arch=amd64
 ext4-modules-4.19.0-8-amd64-di udeb debian-installer standard arch=amd64
 fat-modules-4.19.0-8-amd64-di udeb debian-installer standard arch=amd64
 fb-modules-4.19.0-8-amd64-di udeb debian-installer optional arch=amd64
 firewire-core-modules-4.19.0-8-amd64-di udeb debian-installer standard arch=amd64
 fuse-modules-4.19.0-8-amd64-di udeb debian-installer optional arch=amd64
 i2c-modules-4.19.0-8-amd64-di udeb debian-installer optional arch=amd64
 input-modules-4.19.0-8-amd64-di udeb debian-installer optional arch=amd64
 isofs-modules-4.19.0-8-amd64-di udeb debian-installer standard arch=amd64
 jfs-modules-4.19.0-8-amd64-di udeb debian-installer standard arch=amd64
 kernel-image-4.19.0-8-amd64-di udeb debian-installer standard arch=amd64
 linux-image-4.19.0-8-amd64 deb kernel optional arch=amd64
 linux-image-4.19.0-8-cloud-amd64 deb kernel optional arch=amd64
 linux-image-4.19.0-8-rt-amd64 deb kernel optional arch=amd64
 loop-modules-4.19.0-8-amd64-di udeb debian-installer standard arch=amd64
 md-modules-4.19.0-8-amd64-di udeb debian-installer optional arch=amd64
 mmc-core-modules-4.19.0-8-amd64-di udeb debian-installer optional arch=amd64
 mmc-modules-4.19.0-8-amd64-di udeb debian-installer optional arch=amd64
 mouse-modules-4.19.0-8-amd64-di udeb debian-installer optional arch=amd64
 mtd-core-modules-4.19.0-8-amd64-di udeb debian-installer optional arch=amd64
 multipath-modules-4.19.0-8-amd64-di udeb debian-installer optional arch=amd64
 nbd-modules-4.19.0-8-amd64-di udeb debian-installer optional arch=amd64
 nic-modules-4.19.0-8-amd64-di udeb debian-installer standard arch=amd64
 nic-pcmcia-modules-4.19.0-8-amd64-di udeb debian-installer standard arch=amd64
 nic-shared-modules-4.19.0-8-amd64-di udeb debian-installer standard arch=amd64
 nic-usb-modules-4.19.0-8-amd64-di udeb debian-installer standard arch=amd64
 nic-wireless-modules-4.19.0-8-amd64-di udeb debian-installer standard arch=amd64
 pata-modules-4.19.0-8-amd64-di udeb debian-installer standard arch=amd64
 pcmcia-modules-4.19.0-8-amd64-di udeb debian-installer standard arch=amd64
 pcmcia-storage-modules-4.19.0-8-amd64-di udeb debian-installer standard arch=amd64
 ppp-modules-4.19.0-8-amd64-di udeb debian-installer optional arch=amd64
 sata-modules-4.19.0-8-amd64-di udeb debian-installer standard arch=amd64
 scsi-core-modules-4.19.0-8-amd64-di udeb debian-installer standard arch=amd64
 scsi-modules-4.19.0-8-amd64-di udeb debian-installer standard arch=amd64
 scsi-nic-modules-4.19.0-8-amd64-di udeb debian-installer optional arch=amd64
 serial-modules-4.19.0-8-amd64-di udeb debian-installer optional arch=amd64
 sound-modules-4.19.0-8-amd64-di udeb debian-installer optional arch=amd64
 speakup-modules-4.19.0-8-amd64-di udeb debian-installer optional arch=amd64
 squashfs-modules-4.19.0-8-amd64-di udeb debian-installer optional arch=amd64
 udf-modules-4.19.0-8-amd64-di udeb debian-installer optional arch=amd64
 uinput-modules-4.19.0-8-amd64-di udeb debian-installer optional arch=amd64
 usb-modules-4.19.0-8-amd64-di udeb debian-installer optional arch=amd64
 usb-serial-modules-4.19.0-8-amd64-di udeb debian-installer optional arch=amd64
 usb-storage-modules-4.19.0-8-amd64-di udeb debian-installer standard arch=amd64
 xfs-modules-4.19.0-8-amd64-di udeb debian-installer standard arch=amd64
Checksums-Sha1:
 2cc2915d1ebfa0055c8e01f3623e586422c1e0f9 2513736 linux-signed-amd64_4.19.98+1.tar.xz
Checksums-Sha256:
 bcf948940017f0ef0e0174f8e5291fbee0a6f638fc71f83f5b634fc437220ebf 2513736 linux-signed-amd64_4.19.98+1.tar.xz
Files:
 760b959e0ce169d74f269d6b47840a06 2513736 linux-signed-amd64_4.19.98+1.tar.xz

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE8nXL3e4u3Tgu6Vp6qgZoiu+K+NUFAl4xQmwACgkQqgZoiu+K
+NVPmA/+OmlntY5P3X+FFpdCk1VnJJOvzVsm9cMtUpYJ2mYZH6bZTp9r2yWt3bEf
62gCivCq5X5sDxY+qP9jHC/l8ncdIwiw9SW6BzfbQwIj7BXRBZ9bSALb3/4LuMw9
yCYGpHjC2ug/UimrtbfCvxZK7ZBEL7+4I8mhzLRi/vul6GCgVCZ2A+9YP9KH81at
sBO00s9o2K8YnWIKAMb54dcRRu/U6SWRksMHQB+KBeDeFSqZajSSdeR9fdeVyG9t
TDhY+DgDM4hxSx3RPOzZt7Jm73pgooxB2TmeoTV2yygwqvnpRal4/0hDsiFDUOuN
s3wSQ22HrN+rTpGd6WFQt2mql9+b8R305kFBydQeXcQUvqV/xTxLHBe1MWA+MqTo
caF8dpiWou06GsL98xz40q6YOmCHeNY+aRZFxSvFAILHP6HU9qRNlLBY7tpEogaP
O4MDOideVGeUOl7DuAzTEl2ihksMXjjqrbpKV0W+5TzVKpi05iu49LchfhQDvyF9
vvnqLYhFVerYcZ6GdtmJUJclXC8o8P9wWIcspjWWPMq/6r6uY3FXNtHFfqQJKtf2
E8QjzOAM/pju7gcrryjxmND8+d6ASev4sHR4/4g0Wg7ARrfNY4l4PlhO8EirdM7h
3QuF5u3nNee0686jPkMIPKwnnIgB070gxS3yLm6ieT+SYaoaAiw=
=oKF9
-----END PGP SIGNATURE-----
