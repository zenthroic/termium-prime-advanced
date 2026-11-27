# Termium - Prime — changes over upstream Termux

- App name: "Termium - Prime".
- Package: `com.termux` -> `in.termium` (same 10-char length, on purpose). Java folders moved to `in/termium`, JNI names, namespaces, applicationId, permissions updated. Maven dep `com.termux:termux-am-library` unchanged.
- Private data is separate from official Termux (`/data/data/in.termium`). `sharedUserId` removed. Shared storage permissions (incl. MANAGE_EXTERNAL_STORAGE) kept.
- Bootstrap: official bootstrap is patched while extracting (`TermuxInstaller.java`): bytes `com.termux` -> `in.termium` in all files and symlink targets.
- `pkg install`: `dpkg-termium` wrapper (installed on first run, enabled by `etc/apt/apt.conf.d/99-termium`) repacks each .deb with the same replacement before dpkg installs it. Skip with `TERMIUM_NO_RESTORE=1 pkg install <name>`.
- Untested: not compiled or run on a device.
