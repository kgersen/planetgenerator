#/bin/bash
prefix_dir="$(pwd)/OpenMesh"
mkdir build-OpenMesh
cd build-OpenMesh
cmake ../../OpenMesh-9.0.0 -DBUILD_APPS=OFF -DCMAKE_INSTALL_PREFIX="$prefix_dir"
make && make install