# My dotfiles

Last update: Jan 2021, Arch Linux with Kernel 5.10.5

Before using `config.sh`, install the following packages as root:

- sudo
- git
- networkmanager
- yay (via AUR git, i.e. `makepkg -si`)

## Hints

### GRUB

```bash
# pacman -S grub efibootmgr
# grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB
# grub-mkconfig -o /boot/grub/grub.cfg
```
