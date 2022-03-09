FROM debian:bullseye

RUN apt-get -qq update && \
    apt-get install -qqy --no-install-recommends ca-certificates gnupg2 lsb-release software-properties-common wget \
    wget https://apt.llvm.org/llvm.sh \
    sh ./llvm.sh 13 all \
    rm ./llvm.sh \
    ln -s /usr/bin/clang-13 /usr/bin/clang \
    ln -s /usr/bin/clang-format-13 /usr/bin/clang-format \
    ln -s /usr/bin/clang-tidy-13 /usr/bin/clang-tidy \
    ln -s /usr/bin/ld.lld-13 /usr/bin/ld.lld \
    ln -s /usr/bin/wasm-ld-13 /usr/bin/wasm-ld \
    rm -rf /var/lib/apt/lists/*


