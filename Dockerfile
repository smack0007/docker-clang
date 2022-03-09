FROM debian:bullseye

RUN apt-get -qq update && \
    apt-get install -qqy --no-install-recommends wget \
    wget https://apt.llvm.org/llvm.sh \
    chmod +x llvm.sh \
    sudo ./llvm.sh 13 all \
    sudo ln -s /usr/bin/clang-13 /usr/bin/clang \
    sudo ln -s /usr/bin/clang-format-13 /usr/bin/clang-format \
    sudo ln -s /usr/bin/clang-tidy-13 /usr/bin/clang-tidy \
    sudo ln -s /usr/bin/wasm-ld-13 /usr/bin/wasm-ld \
    rm -rf /var/lib/apt/lists/*
