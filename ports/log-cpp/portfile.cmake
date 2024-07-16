vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

# vcpkg_from_gitlab(
#     GITLAB_URL http://git-inc.ovopark.com:6780
#     OUT_SOURCE_PATH SOURCE_PATH
#     REPO system/threadlibrary/log-cpp
#     REF "${VERSION}"
#     SHA512 0
#     HEAD_REF init
#     AUTHORIZATION_TOKEN Ng2qwPT14ZPo4HwWeJJu
# )

vcpkg_from_git(
    OUT_SOURCE_PATH SOURCE_PATH
    URL http://git-inc.ovopark.com:6780/system/threadlibrary/log-cpp
    REF 609576f28596de568781bd9fbed0304bbf12776f
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    NO_CHARSET_FLAG 
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    CONFIG_PATH lib/cmake/log-cpp
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)