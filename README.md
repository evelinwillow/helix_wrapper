# helix_wrapper
A small bash script to avoid opening files in read-only mode with the helix text editor.

Instead of doing that, this script sets the SUDO_EDITOR environment variable to "helix", in case it is not already set, and runs sudoedit instead.
It automatically detects if the file can be written to at all, if it should be written to as a normal user, or super user.

The only issue is that if you supply it with a directory path, you can STILL open files that are read-only as a normal user; This is a limitation of sudoedit.

This is a workaround for the issue of helix not loading your config file if executed as super user.

REQUIREMENTS:

1) helix
2) sudo
3) GNU make
4) Enough hatred for yourself to actually use helix over vim.

INSTALLATION:

```
git clone https://github.com/evelinwillow/helix_wrapper.git
cd helix_wrapper
make install
```

UNINSTALLATION:

It should be noted that this script actually renames the helix binary. Hence, if you uninstall the package, it leaves behind the *renamed* executable and only removes the *wrapper* file. Have an uninstall script.

```
git clone https://github.com/evelinwillow/helix_wrapper.git
cd helix_wrapper
make uninstall
```
