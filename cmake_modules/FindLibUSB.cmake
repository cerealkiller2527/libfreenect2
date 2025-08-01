# - Find libusb for portable USB support
# 
# If the LibUSB_ROOT environment variable
# is defined, it will be used as base path.
# The following standard variables get defined:
#  LibUSB_FOUND:    true if LibUSB was found
#  LibUSB_INCLUDE_DIR: the directory that contains the include file
#  LibUSB_LIBRARIES:  the libraries

# Try pkg-config first, but don't fail if it doesn't work
IF(PKG_CONFIG_FOUND)
  IF(DEPENDS_DIR) #Otherwise use System pkg-config path
    SET(ENV{PKG_CONFIG_PATH} "$ENV{PKG_CONFIG_PATH}:${DEPENDS_DIR}/libusb/lib/pkgconfig")
  ENDIF()
  SET(MODULE "libusb-1.0")
  IF(CMAKE_SYSTEM_NAME MATCHES "Linux")
    SET(MODULE "libusb-1.0>=1.0.20")
  ENDIF()
  
  # Try pkg-config but don't require it - fall back to manual search if it fails
  PKG_CHECK_MODULES(LibUSB_PC ${MODULE})
  
  IF(LibUSB_PC_FOUND)
    FIND_LIBRARY(LibUSB_LIBRARY
      NAMES ${LibUSB_PC_LIBRARIES}
      HINTS ${LibUSB_PC_LIBRARY_DIRS}
    )
    IF(LibUSB_LIBRARY)
      SET(LibUSB_LIBRARIES ${LibUSB_LIBRARY})
      SET(LibUSB_INCLUDE_DIRS ${LibUSB_PC_INCLUDE_DIRS})
      RETURN()
    ENDIF()
  ENDIF()
ENDIF()

# If pkg-config failed or wasn't found, use manual search

FIND_PATH(LibUSB_INCLUDE_DIRS
  NAMES libusb.h
  PATHS
    "${DEPENDS_DIR}/libusb"
    "${DEPENDS_DIR}/libusbx"
    ENV LibUSB_ROOT
  PATH_SUFFIXES
    include
    libusb
    include/libusb-1.0
)

SET(LIBUSB_NAME libusb)

FIND_LIBRARY(LibUSB_LIBRARIES
  NAMES ${LIBUSB_NAME}-1.0
  PATHS
    "${DEPENDS_DIR}/libusb"
    "${DEPENDS_DIR}/libusbx"
    ENV LibUSB_ROOT
  PATH_SUFFIXES
    # Visual Studio paths (newer versions)
    VS2022/MS64/dll
    VS2022/MS64/static
    VS2019/MS64/dll
    VS2019/MS64/static
    VS2017/MS64/dll
    VS2017/MS64/static
    VS2015/MS64/dll
    VS2015/MS64/static
    VS2013/MS64/dll
    VS2013/MS64/static
    # Legacy paths
    x64/Release/dll
    x64/Debug/dll
    Win32/Release/dll
    Win32/Debug/dll
    MS64
    MS64/dll
    # Unix-style paths
    lib
    lib64
)

IF(WIN32)
FIND_FILE(LibUSB_DLL
  ${LIBUSB_NAME}-1.0.dll
  PATHS
    "${DEPENDS_DIR}/libusb"
    "${DEPENDS_DIR}/libusbx"
    ENV LibUSB_ROOT
  PATH_SUFFIXES
    # Visual Studio paths (newer versions)
    VS2022/MS64/dll
    VS2019/MS64/dll
    VS2017/MS64/dll
    VS2015/MS64/dll
    VS2013/MS64/dll
    # Legacy paths
    x64/Release/dll
    x64/Debug/dll
    Win32/Release/dll
    Win32/Debug/dll
    MS64
    MS64/dll
    # MinGW paths
    MinGW64/dll
    MinGW32/dll
)
ENDIF()

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(LibUSB FOUND_VAR LibUSB_FOUND
  REQUIRED_VARS LibUSB_LIBRARIES LibUSB_INCLUDE_DIRS)
