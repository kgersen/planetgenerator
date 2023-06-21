cmake_minimum_required(VERSION 3.0.0)
project(DUPlanetGenerator VERSION 0.1.0 LANGUAGES C CXX)

set(CMAKE_DEBUG_POSTFIX "d")

add_executable(DUPlanetGenerator main.cpp PlanetGenerator.cpp Polyhedron.cpp)
target_include_directories(DUPlanetGenerator PRIVATE ${CMAKE_SOURCE_DIR})
target_link_libraries(DUPlanetGenerator OpenMeshCore)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)

# OpenMesh - Windows
# download: https://www.graphics.rwth-aachen.de/media/openmesh_static/Releases/9.0/OpenMesh-9.0-VS2019-64-Bit.exe
# install/extract to ../OpenMesh9.0
# or elsewhere and ajust path below
set(OPENMESH_PATH ${CMAKE_SOURCE_DIR}/../OpenMesh9.0)

find_package(OpenMesh CONFIG REQUIRED PATHS ${OPENMESH_PATH}/share/OpenMesh/cmake)

set_property(TARGET OpenMeshCore APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(OpenMeshCore PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "${OPENMESH_PATH}/lib/OpenMeshCored.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS OpenMeshCore )
list(APPEND _IMPORT_CHECK_FILES_FOR_OpenMeshCore "${OPENMESH_PATH}/lib/OpenMeshCored.lib" )

# Import target "OpenMeshTools" for configuration "Debug"
set_property(TARGET OpenMeshTools APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(OpenMeshTools PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "C;CXX"
  IMPORTED_LOCATION_DEBUG "${OPENMESH_PATH}/lib/OpenMeshToolsd.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS OpenMeshTools )
list(APPEND _IMPORT_CHECK_FILES_FOR_OpenMeshTools "${OPENMESH_PATH}/lib/OpenMeshToolsd.lib" )