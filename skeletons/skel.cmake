#1. specify the version of cmake
cmake_minimum_required(VERSION 3.10)

#2. define the name of project
project(main)

#3. specify c++ compiler version
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_FLAGS "-std=c++17 -g -Wall -pthread ")
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

#4. head file path
include_directories(
  ${PROJECT_SOURCE_DIR}
  )

#5. third path link path
link_directories(
  ${PROJECT_SOURCE_DIR}
  )

#6. source code file path
file(GLOB MAIN_FILE
  ${PROJECT_SOURCE_DIR}/main.cc
  )
file(GLOB SOURCE_FILE
  ${PROJECT_SOURCE_DIR}/*.cc
  )

#7. define the executable
add_executable(${PROJECT_NAME} ${MAIN_FILE} ${SOURCE_FILE})
target_link_libraries(${PROJECT_NAME}
  )

# #8. define gtest path
# set(GTEST_LIBRARY ${PROJECT_SOURCE_DIR}/third_party/googletest/build/lib)
# set(GTEST_INCLUDE_DIR ${PROJECT_SOURCE_DIR}/third_party/googletest/googletest/include)
# set(GTEST_MAIN_LIBRARY ${GTEST_LIBRARY})
#
# #9. compile test files
# find_package(GTest)
# enable_testing()
# if (GTEST_FOUND)
#   file(GLOB TEST_FILE ${PROJECT_SOURCE_DIR}/tests/*.cc)
#   foreach(testsourcefile ${TEST_FILE})
#     string(REGEX MATCH "[^/]+$" testsourcefilewithoutpath ${testsourcefile})
#     string(REPLACE ".cc" "" testname ${testsourcefilewithoutpath})
#     add_executable( ${testname} ${testsourcefile} ${SOURCE_FILE})
#     target_link_libraries(${testname}
#       )
#     add_test(NAME ${testname} COMMAND ${testname})
#   ENDFOREACH(testsourcefile ${TEST_FILE})
# endif()
#
