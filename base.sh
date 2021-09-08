#!/bin/bash

ln -sf /usr/share/zoneinfo/Brazil/East /etc/localtime
hwclock --systohc
sed -i '177s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "desktop" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts
echo root:password | chpasswd

pacman -S --noconfirm grub btrfs-progs networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools reflector base-devel linux-headers avahi xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils inetutils dnsutils cups hplip pipewire pipewire-pulse pipewire-alsa pipewire-jack pipewire-media-sessions wireplumber playerctl bash-completion openssh rsync acpi_call bridge-utils dnsmasq vde2 openbsd-netcat iptables-nft ipset firewalld flatpak sof-firmware nss-mdns acpid os-prober ntfs-3g terminus-font otf-ipafont nerd-fonts-noto-sans-mono noto-fonts noto-fonts-extra adobe-source-sans-pro-fonts ttf-opensans ttf-bitstream-vera ttf-dejavu ttf-cascadia-code ttf-fira-code ttf-jetbrains-mono inter-font p7zip bat fish qbittorrent neofetch kvantum-qt5 vivaldi-ffmpeg-codecs alacritty xf86-input-libinput libinput

# pacman -S --noconfirm xf86-video-amdgpu
pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

# grub-install --target=i386-pc /dev/sdX # replace sdx with your disk name, not the partition
grub-install /dev/DISK_LABEL
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable cups.service
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable firewalld
systemctl enable acpid

useradd -m arch
echo arch:password | chpasswd

echo "arch ALL=(ALL) ALL" >> /etc/sudoers.d/arch


printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"
