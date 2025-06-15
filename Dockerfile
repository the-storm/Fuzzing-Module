FROM aflplusplus/aflplusplus:v4.32c


RUN apt-get update && apt-get install -y fish build-essential gcc

RUN mkdir /seeds && cd /seeds && for i in {0..4}; do dd if=/dev/urandom of=seed_$i bs=10 count=1; done

# building exercise 1
RUN cd /exercise1 && mkdir build && cd build && \
    CC=/AFLplusplus/afl-clang-fast CXX=/AFLplusplus/afl-clang-fast++ cmake .. && \
    make


# the command below is to run the fuzzer :)
# /AFLplusplus/afl-fuzz -i /seeds -o out -m none -d -- /exercise1/build/simple_crash

# building exercise 2
RUN cd /exercise2 && mkdir build && cd build && \
    CC=/AFLplusplus/afl-clang-fast CXX=/AFLplusplus/afl-clang-fast++ cmake .. && \
    make

# the command below is to run the fuzzer :)
# /AFLplusplus/afl-fuzz -i /seeds -o out -m none -d -- /exercise2/build/medium

# building exercise 3

RUN cd /exercise3 && mkdir build && cd build && \
    CC=/AFLplusplus/afl-clang-fast CXX=/AFLplusplus/afl-clang-fast++ cmake .. && \
    make

# # the command below is to run the fuzzer :)
# /AFLplusplus/afl-fuzz -i /seeds/ -o out -m none -d -- ./specs-slice

CMD ["sleep", "36000"]