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

echo "✅ All exercises built successfully."
sleep 36000