# 🚀 libfreenect2-modern

<div align="center">

**Modernized build system and enhanced compatibility for libfreenect2**  
*Kinect v2 driver with improved Visual Studio and CUDA support*

[![License](https://img.shields.io/badge/license-Apache%202.0%20%7C%20GPL%20v2-blue.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20macOS%20%7C%20Linux-lightgrey.svg)](#installation)
[![CUDA](https://img.shields.io/badge/CUDA-11.0%2B-green.svg)](#cuda-support)
[![Visual Studio](https://img.shields.io/badge/Visual%20Studio-2013--2022-purple.svg)](#windows--visual-studio)

</div>

## Table of Contents

* [Description](README.md#description)
* [Requirements](README.md#requirements)
* [Troubleshooting](README.md#troubleshooting-and-reporting-bugs)
* [Maintainers](README.md#maintainers)
* [Installation](README.md#installation)
  * [Windows / Visual Studio](README.md#windows--visual-studio)
  * [MacOS](README.md#macos)
  * [Linux](README.md#linux)
* [API Documentation (external)](https://openkinect.github.io/libfreenect2/)

## ✨ Description

Driver for Kinect for Windows v2 (K4W2) devices (release and developer preview).

This is a modernized version of the original [libfreenect2](https://github.com/OpenKinect/libfreenect2) with enhanced compatibility for modern development environments.

### 🎯 **Key Improvements**

| Feature | Benefit |
|---------|---------|
| 🛠️ **Visual Studio 2019/2022 Support** | Enhanced CMake configuration for modern toolchains |
| 🚀 **CUDA 12+ Compatibility** | Automatic NVIDIA samples integration - no manual setup |
| 📦 **Improved Build System** | Better dependency detection and clearer error messages |
| ⚡ **Automatic Dependencies** | No manual environment variable configuration required |

Note: libfreenect2 does not do anything for either Kinect for Windows v1 or Kinect for Xbox 360 sensors. Use libfreenect1 for those sensors.

If you are using libfreenect2 in an academic context, please cite our work using the following DOI: [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.50641.svg)](https://doi.org/10.5281/zenodo.50641)



If you use the KDE depth unwrapping algorithm implemented in the library, please also cite this ECCV 2016 [paper](http://users.isy.liu.se/cvl/perfo/abstracts/jaremo16.html).

This driver supports:
* RGB image transfer
* IR and depth image transfer
* registration of RGB and depth images

Missing features:
* firmware updates (see [issue #460](https://github.com/OpenKinect/libfreenect2/issues/460) for WiP)

Watch the OpenKinect wiki at www.openkinect.org and the mailing list at https://groups.google.com/forum/#!forum/openkinect for the latest developments and more information about the K4W2 USB protocol.

The API reference documentation is provided here https://openkinect.github.io/libfreenect2/.

## 📋 Requirements

### 🖥️ Hardware Requirements

| Component | Requirement | Notes |
|-----------|-------------|-------|
| **USB Controller** | USB 3.0 | ⚠️ USB 2.0 not supported |
| **Recommended Controllers** | Intel, NEC | ✅ Known to work well |
| **Avoid** | ASMedia | ❌ Known compatibility issues |
| **Virtual Machines** | Not recommended | ⚠️ USB 3.0 isochronous transfer issues |

##### Requirements for multiple Kinects

It has been reported to work for up to 5 devices on a high-end PC using multiple separate PCI Express USB3 expansion cards (with NEC controller chip). If you're using Linux, you may have to [increase USBFS memory buffers](https://github.com/OpenKinect/libfreenect2/wiki/Troubleshooting#multiple-kinects-try-increasing-usbfs-buffer-size). Depending on the number of Kinects, you may need to use an even larger buffer size. If you're using an expansion card, make sure it's not plugged into an PCI-E x1 slot. A single lane doesn't have enough bandwidth. x8 or x16 slots usually work.

### 💻 Operating System Requirements

| OS | Status | Versions |
|----|--------|----------|
| **Windows** | ✅ Primary | 10/11 (recommended), 8.1, 7 (buggy) |
| **Linux** | ⚠️ Community | Ubuntu 16.04+, Debian Stretch+, kernel 3.16+ |
| **macOS** | ⚠️ Community | 10.14+ |

### 🎮 Pipeline Requirements

<details>
<summary><strong>Click to expand pipeline details</strong></summary>

| Pipeline | Requirements | Performance | Platform Support |
|----------|-------------|-------------|------------------|
| **🚀 CUDA** | CUDA 11.0+, NVIDIA GPU | Highest (20-35+ FPS) | Windows/Linux/macOS |
| **🎨 OpenGL** | OpenGL 3.1+ | Good (15-25 FPS) | All platforms |
| **⚡ OpenCL** | OpenCL 1.1+ | Good (15-25 FPS) | All platforms |
| **🖥️ CPU** | Any CPU | Basic (5-15 FPS) | All platforms |

**Additional Features:**
- **VAAPI JPEG**: Intel Ivy Bridge+, Linux only
- **VideoToolbox**: macOS only  
- **OpenNI2**: Version 2.2.0.33
- **Jetson TK1**: Linux4Tegra 21.3+

</details>

## Troubleshooting and reporting bugs

First, check https://github.com/OpenKinect/libfreenect2/wiki/Troubleshooting for known issues.

When you report USB issues, please attach relevant debug log from running the program with environment variable `LIBUSB_DEBUG=3`, and relevant log from `dmesg`. Also include relevant hardware information `lspci` and `lsusb -t`.

## 👥 Maintainers

### 🔧 Modern Version
**[Madhav Lodha](https://madhavlodha.com)** - *Build system modernization and enhanced compatibility*  
📧 Contact: [madhavlodha.com](https://madhavlodha.com) | 🐙 GitHub: [@cerealkiller2527](https://github.com/cerealkiller2527)

This modernized version focuses on build system improvements and modern toolchain compatibility.

### 🏛️ Original libfreenect2 Team
* **Joshua Blake** <joshblake@gmail.com>
* **Florian Echtler**  
* **Christian Kerl**
* **Lingzhu Xiang** (development/master branch)

> 💝 **All credit for the core functionality goes to the original [OpenKinect team](https://github.com/OpenKinect/libfreenect2)**

## 🚀 Installation

### 🪟 Windows / Visual Studio

#### Prerequisites
- Windows 10/11 (recommended), Windows 8.1, Windows 7 (buggy)
- Visual Studio 2013, 2015, 2017, 2019, or 2022 with C++ build tools
- Git for Windows
- CMake 3.5 or later

#### Step 1: Install USB Driver (Choose ONE option)

**Option A: UsbDk Driver (Recommended)**
1. (Windows 7 only) Install Microsoft Security Advisory 3033929 first (or USB devices will stop working)
2. Download the latest x64 installer from https://github.com/daynix/UsbDk/releases
3. Install the downloaded UsbDk driver
4. **Important**: Do not install both UsbDK and libusbK drivers - they interfere with each other

**Option B: libusbK Driver (Alternative)**
1. Download Zadig from http://zadig.akeo.ie/
2. Run Zadig and in options:
   - ✅ Check "List All Devices" 
   - ❌ Uncheck "Ignore Hubs or Composite Parents"
3. Select **"Xbox NUI Sensor (composite parent)"** from dropdown
   - **Important**: Ignore "NuiSensor Adaptor" varieties - select the composite parent only
   - Current driver should show `usbccgp`
   - USB ID should be VID 045E, PID 02C4 or 02D8
4. Select **libusbK (v3.0.7.0 or newer)** from replacement driver list
5. Click "Replace Driver" → Click "Yes" on system driver warning

To uninstall libusbK driver later:
1. Open Device Manager
2. Under "libusbK USB Devices", right-click "Xbox NUI Sensor (Composite Parent)"
3. Select "Uninstall" and ✅ check "Delete the driver software for this device"
4. To restore SDK driver: Action menu → "Scan for hardware changes"

#### Step 2: Install Dependencies

All dependencies are included in the `depends/` directory, but you can also install them system-wide:

**Install libusb**
- Download latest build (.7z file) from https://github.com/libusb/libusb/releases
- Extract as `depends/libusb` (rename `libusb-1.x.y` folder to `libusb`)

**Install TurboJPEG**  
- Download `-vc64.exe` installer from http://sourceforge.net/projects/libjpeg-turbo/files
- Install to `C:\libjpeg-turbo64` or `depends/libjpeg-turbo64`

**Install GLFW**
- Download 64-bit version from http://www.glfw.org/download.html  
- Extract as `depends/glfw` (rename `glfw-3.x.x.bin.WIN64` to `glfw`)

**Install CUDA (optional, NVIDIA only)**
- Download CUDA Toolkit 11.0+ from https://developer.nvidia.com/cuda-downloads
- **Note**: CUDA samples are automatically downloaded during build - no manual setup required

**Install OpenCL (optional)**
- Intel GPU: Download "Intel® SDK for OpenCL™ Applications 2016" from https://software.intel.com/en-us/intel-opencl
- AMD/NVIDIA: Usually included with GPU drivers

**Install OpenNI2 (optional)**
- Download OpenNI 2.2.0.33 (x64) from http://structure.io/openni
- Install to default location (`C:\Program Files\OpenNI2`)
#### Step 3: Build libfreenect2

**Clone the repository**
```bash
git clone https://github.com/cerealkiller2527/libfreenect2-modern.git
cd libfreenect2-modern
```

**Configure and build**
```bash
mkdir build && cd build
cmake .. -G "Visual Studio 17 2022" -A x64
cmake --build . --config RelWithDebInfo --target install
```

**Supported Visual Studio versions:**
- Visual Studio 2022: `-G "Visual Studio 17 2022" -A x64` (recommended)
- Visual Studio 2019: `-G "Visual Studio 16 2019" -A x64`
- Visual Studio 2017: `-G "Visual Studio 15 2017 Win64"`
- Visual Studio 2015: `-G "Visual Studio 14 2015 Win64"`
- Visual Studio 2013: `-G "Visual Studio 12 2013 Win64"`

**Key improvements in this modernized version:**
- ✅ **Automatic CUDA samples**: No need to manually set `NVCUDASAMPLES_ROOT`
- ✅ **Enhanced dependency detection**: Better fallbacks when pkg-config is missing
- ✅ **Visual Studio 2022 support**: Updated cmake modules for latest toolchain
- ✅ **Clear error messages**: Helpful guidance when dependencies are missing

#### Step 4: Test Your Installation

**Run the test program**
```bash
.\install\bin\Protonect.exe
```

**Test specific pipelines**
```bash
# Test CUDA pipeline (NVIDIA GPUs)
.\install\bin\Protonect.exe cuda

# Test OpenGL pipeline (All GPUs) 
.\install\bin\Protonect.exe gl

# Test CPU pipeline (Fallback)
.\install\bin\Protonect.exe cpu
```

#### Step 5: Test OpenNI2 Integration (Optional)

1. Copy DLL files from `install\bin` to `C:\Program Files\OpenNI2\Tools\OpenNI2\Drivers`:
   - `freenect2-openni2.dll`
   - `libusb-1.0.dll`
   - `glfw3.dll` 
   - `turbojpeg.dll`
2. Run `C:\Program Files\OpenNI2\Tools\NiViewer.exe`
3. Set `LIBFREENECT2_PIPELINE=cuda` to force specific pipeline

### Windows / vcpkg

You can download and install libfreenect2 using the [vcpkg](https://github.com/Microsoft/vcpkg) dependency manager:
```
git clone https://github.com/Microsoft/vcpkg.git
cd vcpkg
./vcpkg integrate install
vcpkg install libfreenect2
```
The libfreenect2 port in vcpkg is kept up to date by Microsoft team members and community contributors. If the version is out of date, please [create an issue or pull request](https://github.com/Microsoft/vcpkg) on the vcpkg repository.

### macOS

> **⚠️ Platform Status**: This modernized version has been primarily tested on Windows. macOS support should work but hasn't been extensively tested. Please [open an issue](https://github.com/cerealkiller2527/libfreenect2-modern/issues) if you encounter problems or [submit a PR](https://github.com/cerealkiller2527/libfreenect2-modern/pulls) with fixes.

#### Prerequisites
- macOS 10.14 or later
- Xcode Command Line Tools: `xcode-select --install`
- Homebrew package manager
- CMake 3.5 or later

#### Installation Steps

**Install build tools and dependencies**
```bash
# Install essential build tools
brew install cmake pkg-config git

# Clone repository
git clone https://github.com/cerealkiller2527/libfreenect2-modern.git
cd libfreenect2-modern

# Install core dependencies
brew install libusb glfw jpeg-turbo
```

**Install optional dependencies**
```bash
# For CUDA support (NVIDIA GPUs only)
# Download CUDA Toolkit from NVIDIA website - brew version may be outdated

# For OpenNI2 support
brew tap brewsci/science
brew install openni2
export OPENNI2_REDIST=/usr/local/lib/ni2
export OPENNI2_INCLUDE=/usr/local/include/ni2
```

**Build and install**
```bash
mkdir build && cd build
cmake ..
make -j$(nproc)
make install
```

**Test installation**
```bash
# Test basic functionality
./bin/Protonect

# Test specific pipelines
./bin/Protonect cuda    # NVIDIA GPUs only
./bin/Protonect gl      # All GPUs
./bin/Protonect cpu     # CPU fallback

# Test OpenNI2 integration (if installed)
make install-openni2   # May need sudo
NiViewer
```

### Linux

> **⚠️ Platform Status**: This modernized version has been primarily tested on Windows. Linux support should work but hasn't been extensively tested. Please [open an issue](https://github.com/cerealkiller2527/libfreenect2-modern/issues) if you encounter problems or [submit a PR](https://github.com/cerealkiller2527/libfreenect2-modern/pulls) with fixes.

#### Prerequisites
- Ubuntu 16.04+ or Debian Stretch+ (Ubuntu 12.04 and Debian Jessie are too old)
- Linux kernel 3.16+ (recommended: 4.4+)
- CMake 3.5 or later
- Modern C++ compiler (GCC 5+ or Clang 3.9+)

#### Installation Steps

**Install build tools and dependencies**
```bash
# Update package list
sudo apt-get update

# Install build tools
sudo apt-get install build-essential cmake pkg-config git

# Clone repository  
git clone https://github.com/cerealkiller2527/libfreenect2-modern.git
cd libfreenect2-modern

# Install core dependencies
sudo apt-get install libusb-1.0-0-dev libglfw3-dev

# Install TurboJPEG
# Ubuntu 16.04-18.04:
sudo apt-get install libturbojpeg0-dev
# Ubuntu 14.04 (if still supported):
# sudo apt-get install libturbojpeg libjpeg-turbo8-dev
```

**Install optional dependencies**
```bash
# For OpenCL support
sudo apt-get install ocl-icd-opencl-dev

# Intel GPU OpenCL:
sudo apt-get install beignet-dev

# AMD GPU OpenCL: 
# Install AMD drivers and: sudo apt-get install opencl-headers

# For CUDA support (NVIDIA only):
# Follow NVIDIA's installation instructions for your distribution
# Ensure you install the samples package

# For VAAPI support (Intel only):
sudo apt-get install libva-dev libjpeg-dev

# For OpenNI2 support:
sudo apt-get install libopenni2-dev
```

**Build and install**
```bash
mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=$HOME/freenect2
make -j$(nproc)
make install
```

**Set up device permissions**
```bash
# Copy udev rules for device access
sudo cp ../platform/linux/udev/90-kinect2.rules /etc/udev/rules.d/
# Reload udev rules
sudo udevadm control --reload-rules && sudo udevadm trigger
# Replug your Kinect device
```

**Test installation**
```bash
# Test basic functionality
./bin/Protonect

# Test specific pipelines
./bin/Protonect cuda    # NVIDIA GPUs only
./bin/Protonect cl      # OpenCL GPUs  
./bin/Protonect gl      # All GPUs
./bin/Protonect cpu     # CPU fallback

# Test OpenNI2 integration (if installed)
sudo apt-get install openni2-utils
sudo make install-openni2
NiViewer2
```

**For CMake-based applications using libfreenect2:**
```bash
cmake -Dfreenect2_DIR=$HOME/freenect2/lib/cmake/freenect2 [other options]
```

## Troubleshooting

### Common Issues

**"Could not find CUDA" or "helper_math.h not found"**
- ✅ **This version automatically handles CUDA samples** - no manual setup required
- Ensure CUDA Toolkit 11.0+ is installed
- On Linux: verify NVIDIA drivers are properly installed

**"libusb not found" or "GLFW not found"**
- ✅ **Enhanced dependency detection** in this version provides better error messages
- Check that dependencies are in `depends/` directory or installed system-wide
- On Windows: ensure you're using the correct Visual Studio version

**"Xbox NUI Sensor not found"**
- Verify Kinect v2 is connected to **USB 3.0 port** (USB 2.0 not supported)
- Install UsbDk or libusbK driver as described above
- Intel/NEC USB controllers work best; ASMedia controllers may not work

**Pipeline performance issues**
- Use `LIBFREENECT2_PIPELINE=cuda` to force CUDA pipeline
- Check that appropriate GPU drivers are installed
- CUDA > OpenGL > CPU for performance ranking

### Performance Expectations

| Pipeline | Typical Performance | GPU Requirement |
|----------|-------------------|-----------------|
| CUDA     | 20-35+ FPS       | NVIDIA GPU      |
| OpenGL   | 15-25 FPS        | Any modern GPU  |
| CPU      | 5-15 FPS         | None            |

### Getting Help

- **Issues with this modernized version**: [Open an issue](https://github.com/cerealkiller2527/libfreenect2-modern/issues)
- **General libfreenect2 questions**: Check [original project wiki](https://github.com/OpenKinect/libfreenect2/wiki/Troubleshooting)
- **Contributing improvements**: [Submit a pull request](https://github.com/cerealkiller2527/libfreenect2-modern/pulls)

## Contributing

This modernized version welcomes contributions! Priority areas:

1. **Cross-platform testing** - Help test and improve macOS/Linux support  
2. **Build system improvements** - CMake modernization and dependency handling
3. **Documentation** - Platform-specific guides and troubleshooting
4. **Performance optimizations** - GPU pipeline enhancements

### Relationship to Original Project

This is a community-maintained modernized version that:
- ✅ Maintains full API compatibility with original libfreenect2
- ✅ Credits and respects the original OpenKinect team's excellent work  
- ✅ Focuses on build system and toolchain improvements
- ✅ Contributes improvements back to the community when possible

**Original project**: https://github.com/OpenKinect/libfreenect2
