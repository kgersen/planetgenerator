cmake_minimum_required(VERSION 3.0.0)
project(DUPlanetGenerator VERSION 0.1.0 LANGUAGES C CXX)

include(CTest)
enable_testing()

add_executable(DUPlanetGenerator main.cpp PlanetGenerator.cpp Polyhedron.cpp)
target_include_directories(DUPlanetGenerator PRIVATE ${CMAKE_SOURCE_DIR})
target_link_libraries(DUPlanetGenerator OpenMeshCore)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)

find_package(OpenMesh CONFIG REQUIRED PATHS ${CMAKE_SOURCE_DIR}/../OpenMesh9.0/share/OpenMesh/cmake)
# target_include_directories(DUPlanetGenerator PRIVATE ${CMAKE_SOURCE_DIR}/../OpenMesh9.0/include)
# find_library(OpenMeshCore REQUIRED PATHS ${CMAKE_SOURCE_DIR}/../OpenMesh9.0/lib)
