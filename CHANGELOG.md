# Changelog

## [Modern] - 2025-01

### Enhanced Build System
- **Visual Studio 2019/2022 support** - Updated CMake configuration for modern VS versions
- **Enhanced CUDA compatibility** - Automatic NVIDIA samples integration for CUDA 12+  
- **Improved dependency detection** - Better FindLibUSB and FindGLFW3 modules with graceful fallbacks
- **Simplified build process** - No manual environment variable setup required

### Technical Improvements
- **Fixed helper_math.h issues** - Resolves missing header problems with modern CUDA installations
- **Enhanced CMake modules** - Better Visual Studio version detection and pkg-config fallbacks
- **Automatic dependency management** - CUDA samples downloaded automatically during build
- **Better error messages** - Clear guidance when dependencies are missing

### Platform Support
- **Windows 10/11** - Full compatibility with latest Windows versions
- **CUDA 11.0+** - Enhanced compatibility with modern CUDA toolkit versions
- **Cross-platform** - Maintains compatibility with Linux and macOS

---

Based on the original [libfreenect2](https://github.com/OpenKinect/libfreenect2) by the OpenKinect team.
All credit for core functionality goes to the original maintainers.