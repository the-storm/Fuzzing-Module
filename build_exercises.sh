set -e

export CC=/AFLplusplus/afl-clang-fast
export CXX=/AFLplusplus/afl-clang-fast++

# building exercise 1
cd /exercises/exercise1 && mkdir build && cd build && \
    CC=/AFLplusplus/afl-clang-fast CXX=/AFLplusplus/afl-clang-fast++ cmake .. && \
    make


# the command below is to run the fuzzer :)
# /AFLplusplus/afl-fuzz -i /seeds -o out -m none -d -- /exercises/exercise1/build/simple_crash

# building exercise 2
cd /exercises/exercise2 && mkdir build && cd build && \
    CC=/AFLplusplus/afl-clang-fast CXX=/AFLplusplus/afl-clang-fast++ cmake .. && \
    make

# the command below is to run the fuzzer :)
# /AFLplusplus/afl-fuzz -i /seeds -o out -m none -d -- /exercises/exercise2/build/medium

# building exercise 3

cd /exercises/exercise3 && mkdir build && cd build && \
    CC=/AFLplusplus/afl-clang-fast CXX=/AFLplusplus/afl-clang-fast++ cmake .. && \
    make

# # the command below is to run the fuzzer :)
# /AFLplusplus/afl-fuzz -i /seeds/ -o out -m none -d -- /exercises/exercise3/build/specs-slice

# building exercise 4

cd /exercises/exercise4 && mkdir build && cd build && \
    AFL_LLVM_LAF_SPLIT_SWITCHES=1 \
    AFL_LLVM_LAF_TRANSFORM_COMPARES=1 \
    AFL_LLVM_LAF_SPLIT_COMPARES=1 \
    AFL_USE_ASAN=1 \
    CC=/AFLplusplus/afl-clang-fast CXX=/AFLplusplus/afl-clang-fast++ cmake .. && \
    AFL_LLVM_LAF_SPLIT_SWITCHES=1 AFL_LLVM_LAF_TRANSFORM_COMPARES=1 AFL_LLVM_LAF_SPLIT_COMPARES=1 AFL_USE_ASAN=1 make

# the command below is to run the fuzzer :)
# /AFLplusplus/afl-fuzz -i /seeds/ -o out -m none -d -- /exercises/exercise4/src/build/flac_parser @@


echo "✅ All exercises built successfully."
sleep 36000