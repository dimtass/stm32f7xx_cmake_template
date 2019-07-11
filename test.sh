#!/bin/bash -e

build() {
    local TEST_CASE=$1
    echo "Building test case: ${TEST_CASE}"
    OUTPUT=$(eval ${TEST_CASE} ./build.sh 2>&1)
    CODE=$(echo $?)
    if [ ${CODE} -eq 0 ]; then
        echo "---RESULT: SUCCESS"
        echo ""
    else
        echo "Failed with code: ${CODE}"
        echo "OUTPUT"
    fi
}

build "CLEANBUILD=true USE_HAL_DRIVER=ON SRC=src_c_hal"
build "CLEANBUILD=true USE_HAL_DRIVER=ON USE_FREERTOS=ON SRC=src_c_freertos"
build "CLEANBUILD=true USE_HAL_DRIVER=ON SRC=src_cpp_hal"
build "CLEANBUILD=true USE_HAL_DRIVER=ON USE_FREERTOS=ON SRC=src_cpp_freertos"

if [ -d "./build-stm32" ]; then
    rm -rf build-stm32
fi