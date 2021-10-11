# My dotfiles

Last update: Jan 2021, Arch Linux with Kernel 5.10.5

Before using `config.sh`, install the following packages as root:

- sudo
- git
- networkmanager
- yay (via AUR git, i.e. `makepkg -si`)

## Hints

### GRUB

:warning: don't forget to select UEFI instead of legacy when switching to boot
from flash drive

```text
# pacman -S grub efibootmgr
# grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB
# grub-mkconfig -o /boot/grub/grub.cfg
```

### libinput

- disable touchpad while typing on Dell: https://bbs.archlinux.org/viewtopic.php?id=240488
- `xf86-input-libinput` must be the one `xf86-input-*` driver installed and it
  **does not** replaces `libinput` itself my rather extends it as a wrapper for
  working with xorg server.
- `xinput (list | list-props | set-prop)` does all the work that would have
  been messy via config files under `/usr/share/X11/xorg.conf.d/`
