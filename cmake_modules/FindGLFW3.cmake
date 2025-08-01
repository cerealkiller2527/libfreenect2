# - Try to find GLFW3
#
# If no pkgconfig, define GLFW_ROOT to installation tree
# Will define the following:
# GLFW3_FOUND
# GLFW3_INCLUDE_DIRS
# GLFW3_LIBRARIES

# Try pkg-config first, but don't fail if it doesn't work
IF(PKG_CONFIG_FOUND)
  IF(APPLE)
    # homebrew or macports pkgconfig locations
    SET(ENV{PKG_CONFIG_PATH} "/usr/local/opt/glfw3/lib/pkgconfig:/opt/local/lib/pkgconfig")
  ENDIF()
  SET(ENV{PKG_CONFIG_PATH} "${DEPENDS_DIR}/glfw/lib/pkgconfig:$ENV{PKG_CONFIG_PATH}")
  PKG_CHECK_MODULES(GLFW3_PC glfw3)

  IF(GLFW3_PC_FOUND)
    FIND_LIBRARY(GLFW3_LIBRARY
      NAMES ${GLFW3_PC_LIBRARIES}
      HINTS ${GLFW3_PC_LIBRARY_DIRS}
    )
    IF(GLFW3_LIBRARY)
      SET(GLFW3_LIBRARIES ${GLFW3_LIBRARY})
      SET(GLFW3_INCLUDE_DIRS ${GLFW3_PC_INCLUDE_DIRS})
      RETURN()
    ENDIF()
  ENDIF()
ENDIF()

# If pkg-config failed or wasn't found, use manual search

FIND_PATH(GLFW3_INCLUDE_DIRS
  GLFW/glfw3.h
  DOC "GLFW include directory "
  PATHS
    "${DEPENDS_DIR}/glfw"
    "$ENV{ProgramW6432}/glfw"
    ENV GLFW_ROOT
  PATH_SUFFIXES
    include
)

# directories in the official binary package
IF(MINGW)
  SET(_SUFFIX lib-mingw-w64)
ELSEIF(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 19.40)
  SET(_SUFFIX lib-vc2022)  # VS 2022
ELSEIF(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 19.30)  
  SET(_SUFFIX lib-vc2022)  # VS 2022 (early versions)
ELSEIF(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 19.20)
  SET(_SUFFIX lib-vc2019)  # VS 2019
ELSEIF(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 19.10)
  SET(_SUFFIX lib-vc2017)  # VS 2017
ELSEIF(MSVC14)
  SET(_SUFFIX lib-vc2015)  # VS 2015
ELSEIF(MSVC12)
  SET(_SUFFIX lib-vc2013)  # VS 2013
ELSEIF(MSVC11)
  SET(_SUFFIX lib-vc2012)  # VS 2012
ELSEIF(MSVC)
  SET(_SUFFIX lib-vc2022)  # Default to newest available
ENDIF()

FIND_LIBRARY(GLFW3_LIBRARIES
  NAMES glfw3dll glfw3
  PATHS
    "${DEPENDS_DIR}/glfw"
    "$ENV{ProgramW6432}/glfw"
    ENV GLFW_ROOT
  PATH_SUFFIXES
    lib
    ${_SUFFIX}
)

IF(WIN32)
FIND_FILE(GLFW3_DLL
  glfw3.dll
  PATHS
    "${DEPENDS_DIR}/glfw"
    "$ENV{ProgramW6432}/glfw"
    ENV GLFW_ROOT
  PATH_SUFFIXES
    ${_SUFFIX}
)
ENDIF()

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(GLFW3 FOUND_VAR GLFW3_FOUND
  REQUIRED_VARS GLFW3_LIBRARIES GLFW3_INCLUDE_DIRS)
