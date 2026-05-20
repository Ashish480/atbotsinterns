# generated from ament/cmake/core/templates/nameConfig.cmake.in

# prevent multiple inclusion
if(_greeting_CONFIG_INCLUDED)
  # ensure to keep the found flag the same
  if(NOT DEFINED greeting_FOUND)
    # explicitly set it to FALSE, otherwise CMake will set it to TRUE
    set(greeting_FOUND FALSE)
  elseif(NOT greeting_FOUND)
    # use separate condition to avoid uninitialized variable warning
    set(greeting_FOUND FALSE)
  endif()
  return()
endif()
set(_greeting_CONFIG_INCLUDED TRUE)

# output package information
if(NOT greeting_FIND_QUIETLY)
  message(STATUS "Found greeting: 0.0.0 (${greeting_DIR})")
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "Package 'greeting' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  # optionally quiet the deprecation message
  if(NOT ${greeting_DEPRECATED_QUIET})
    message(DEPRECATION "${_msg}")
  endif()
endif()

# flag package as ament-based to distinguish it after being find_package()-ed
set(greeting_FOUND_AMENT_PACKAGE TRUE)

# include all config extra files
set(_extras "")
foreach(_extra ${_extras})
  include("${greeting_DIR}/${_extra}")
endforeach()
