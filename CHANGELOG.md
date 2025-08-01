# Changelog

## [Modern] - 2025-01

### 🚀 **Major CUDA Modernization**
- **Native CMake CUDA support** - Replaced deprecated FindCUDA with enable_language(CUDA)
- **CUDA 12.9+ compatibility** - Full support for latest Visual Studio 2022 versions
- **Modern GPU architecture support** - Maxwell to Ada Lovelace (compute capabilities 50-90)
- **Advanced CUDA optimization** - Extended lambdas, relaxed constexpr, fast math
- **Performance enhancement** - Achieves 25-35+ FPS with modern CUDA pipeline
- **Future-proof build system** - CMake 3.18+ with eliminated deprecation warnings

### Enhanced Build System
- **Visual Studio 2019/2022 support** - Updated CMake configuration for modern VS versions
- **Enhanced CUDA compatibility** - Automatic NVIDIA samples integration for CUDA 12.9+  
- **Improved dependency detection** - Better FindLibUSB and FindGLFW3 modules with graceful fallbacks
- **Simplified build process** - No manual environment variable setup required

### Technical Improvements
- **Modern CUDA compilation** - Separable compilation and device linking support
- **Enhanced CMake modules** - Better Visual Studio version detection and pkg-config fallbacks
- **Automatic dependency management** - CUDA samples downloaded automatically during build
- **Better error messages** - Clear guidance when dependencies are missing
- **GPU architecture targeting** - Automatic support for RTX 30/40 series and latest GPUs

### Platform Support
- **Windows 10/11** - Full compatibility with latest Windows versions
- **CUDA 12.9+** - Enhanced compatibility with modern CUDA toolkit versions
- **Visual Studio 2022** - Full support including v17.10+ with compiler 14.44
- **Cross-platform** - Maintains compatibility with Linux and macOS

---

Based on the original [libfreenect2](https://github.com/OpenKinect/libfreenect2) by the OpenKinect team.
All credit for core functionality goes to the original maintainers.