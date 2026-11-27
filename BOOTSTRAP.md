# Bootstrap for in.termium

Official Termux bootstraps and packages hardcode /data/data/com.termux/files/usr, so they cannot run here.
You need your own, built for /data/data/in.termium/files/usr.

0. Easiest: push this project to GitHub and run Actions → "Build bootstrap" (.github/workflows/bootstrap.yml). Untested; may need tweaks.
1. On a Linux x86_64 machine with Docker: `./scripts/build-bootstrap.sh` (clones termux-packages, rewrites the package name, builds bootstraps).
2. Put the resulting `bootstrap-aarch64.zip` (and `bootstrap-arm.zip` etc.) into `app/src/main/cpp/`.
   app/build.gradle already uses local zips from that folder before downloading anything.
3. Host the built .deb packages as your own apt repo and set its URL in the bootstrap's `etc/apt/sources.list`
   (official repos ship com.termux-built packages that will break here).
4. Build the app.
