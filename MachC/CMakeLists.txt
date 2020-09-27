cmake_minimum_required(VERSION 3.0)

project(simple_c_xpc)

add_executable(simple_c_xpc_caller simpleCXPCCaller/main.mm)
add_executable(simple_c_xpc_callee simpleCXPCCallee/main.mm)

target_link_libraries(simple_c_xpc_callee "-framework SystemConfiguration" "-framework Foundation")
target_link_libraries(simple_c_xpc_caller "-framework SystemConfiguration" "-framework Foundation")
