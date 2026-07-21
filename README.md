# AutoClicker GUI

![License](https://img.shields.io/badge/license-GPL--3.0-blue.svg)
![Platform](https://img.shields.io/badge/platform-Linux-lightgrey.svg)

A blazing fast, hardware-level AutoClicker interface built in native C++ and GTK3. 

Unlike traditional software-based clickers (like `xdotool` or `xte`), this GUI does not use X11/Wayland software events. Instead, it interacts directly with a custom Linux kernel module to simulate **physical hardware mouse clicks**. This makes it completely undetectable by software hooks (such as anti-cheat engines) and incredibly fast!

---

## ⚠️ Requirements

This project is a userspace GUI. It **requires** the `RKKDR` (Kernel Driver) module to be loaded into your Linux kernel to function. The GUI communicates with the custom `/dev/rkkdr_mouse` hardware interface exposed by that driver.

### Dependencies (Arch Linux)
You will need GTK3 and standard C++ compilation tools:
```bash
sudo pacman -S gtk3 pkgconf base-devel
```

---

## Installation & Setup

If you cloned this GUI repository from GitHub, you must also pull in the `RKKDR` kernel module as a Git Submodule.

To initialize the kernel driver dependency, run:
```bash
git submodule update --init --recursive
```

---

## Usage

### The Easy Way (Launcher)
Simply run the included launcher script. It will automatically:
1. Compile the C++ GUI
2. Build and load the `RKKDR` kernel driver into your system
3. Launch the interface cleanly

```bash
./launcher.sh
```

### The Manual Way
1. Compile the GUI natively:
   ```bash
   make
   ```
2. Ensure the `RKKDR` driver is loaded into your kernel (via the `KernelDriver` root directory).
3. Run the GUI manually (Requires `sudo` to write to the kernel `/dev/` node, and `-E` to preserve your display environment variables so GTK can open):
   ```bash
   sudo -E ../../release/AutoClicker
   ```
