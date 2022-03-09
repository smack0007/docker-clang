FROM debian:bullseye

ARG clang_version=13

RUN apt-get -qq update && \
    apt-get install -qqy --no-install-recommends ca-certificates gnupg2 lsb-release software-properties-common wget && \
    wget https://apt.llvm.org/llvm.sh && \
    chmod +x llvm.sh && \
    ./llvm.sh $clang_version && \
    rm ./llvm.sh && \
    apt-get install -qqy clang-tidy-$clang_version clang-format-$clang_version && \
    apt-get remove -qqy --purge ca-certificates gnupg2 lsb-release software-properties-common wget && \
    apt-get autoremove -qqy && \
    rm -rf /var/lib/apt/lists/* && \
    ln -s /usr/bin/clang-13 /usr/bin/clang && \
    ln -s /usr/bin/clang-format-13 /usr/bin/clang-format && \
    ln -s /usr/bin/clang-tidy-13 /usr/bin/clang-tidy && \
    ln -s /usr/bin/ld.lld-13 /usr/bin/ld.lld && \
    ln -s /usr/bin/wasm-ld-13 /usr/bin/wasm-ld
