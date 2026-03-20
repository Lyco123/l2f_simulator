set(RLTOOLS_GTEST_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../external/rl_tools/tests/lib/googletest)

if(EXISTS ${RLTOOLS_GTEST_DIR}/CMakeLists.txt)
    add_subdirectory(${RLTOOLS_GTEST_DIR} ${CMAKE_BINARY_DIR}/_deps/googletest-build EXCLUDE_FROM_ALL)
else()
    find_package(GTest REQUIRED)
endif()

include(GoogleTest)

add_executable(ctbr_control_loop_test ctbr_control_loop.cpp)

target_include_directories(ctbr_control_loop_test PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/..
    ${CMAKE_CURRENT_SOURCE_DIR}/../include
    ${CMAKE_CURRENT_SOURCE_DIR}/../external/rl_tools/include
)

if(Protobuf_FOUND)
    target_compile_definitions(ctbr_control_loop_test PRIVATE RL_TOOLS_ENABLE_TENSORBOARD)
    target_compile_definitions(ctbr_control_loop_test PRIVATE CTBR_TEST_LOG_DIR=\"${CMAKE_CURRENT_BINARY_DIR}/logs\")
endif()

target_link_libraries(ctbr_control_loop_test PRIVATE
    learning_to_fly
    GTest::gtest_main
)

if(TARGET tensorboard_logger)
    target_link_libraries(ctbr_control_loop_test PRIVATE tensorboard_logger)
endif()

gtest_discover_tests(ctbr_control_loop_test)
