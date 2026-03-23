cmake -S . -B build -DLEARNING_TO_FLY_IN_SECONDS_ENABLE_TESTS=ON && cmake --build build -j && ctest --test-dir build --output-on-failure
