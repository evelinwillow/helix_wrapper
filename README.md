# helix_wrapper
A small bash script to avoid opening files in read-only mode with the helix text editor.

Instead of doing that, this script sets the SUDO_EDITOR environment variable to "helix", in case it is not already set, and runs sudoedit instead.
It automatically detects if the file can be written to at all, if it should be written to as a normal user, or super user.

The only issue is that if you supply it with a directory path, you can STILL open files that are read-only as a normal user; This is a limitation of sudoedit.

This is a workaround for the issue of helix not loading your config file if executed as super user.

REQUIREMENTS:

1) Helix.
2) Sudo
3) make

INSTALLATION:

```bash
git clone https://github.com/evelinwillow/helix_wrapper.git
cd helix_wrapper
make install
```

UNINSTALLATION:

```bash
git clone https://github.com/evelinwillow/helix_wrapper.git
cd helix_wrapper
make uninstall
```
